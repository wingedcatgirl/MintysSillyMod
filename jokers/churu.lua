SMODS.Joker {
    key = "churutreat",
    config = {
        extra = {
            s_mult = 5,
            odds = 4,
            again = 0
        }
    },
    rarity = 1,
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 6,
        y = 0
    },
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    pools = {
        ["Food"] = true, -- Cryptid compatibility for refactor
        ["Paperback"] = true, --Increase freqency when playing with Paper Deck
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.extra.s_mult,
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,

    in_pool = function(self, args)
        if G.GAME.pool_flags.churu_treat_eaten then
            return false
        end
        return MINTY.threeSuit_in_pool()
    end,
    calculate = function(self, card, context)
        if context.forcetrigger then
            return {
                mult = card.ability.extra.s_mult,
                card = card
            }
        end

        -- Give the mult during play if card is a 3, and retrigger if it's a 3 of 3s
        if context.cardarea == G.play and context.individual and context.other_card:is_3() then
            local count = context.other_card:is_3()
            card.ability.extra.again = count - 1
            return {
                mult = card.ability.extra.s_mult,
                card = card
            }
        end
        if context.retrigger_joker_check and card.ability.extra.again ~= 0 and context.other_card == card then
            local again = card.ability.extra.again
            card.ability.extra.again = 0
            return {
                message = localize("k_again_ex"),
                message_card = card,
                repetitions = again,
            }
        end

        -- Check if the Joker needs to be eaten
        if context.end_of_round and not context.blueprint and not (context.individual or context.repetition or context.retrigger_joker_check or context.retrigger_joker) then
            card.ability.extra.again = 0
            if pseudorandom("churu") < G.GAME.probabilities.normal / card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                G.jokers:remove_card(card)
                                card:remove()
                                -- card = nil

                                -- Remove Churu Treat from the pool
                                G.GAME.pool_flags.churu_treat_eaten = true

                                -- Create Plastic "Stick"
                                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                    local jokers_to_create = math.min(1,
                                        G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                                    G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create

                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            local card = create_card('Joker', G.jokers, nil, 0, nil, nil, 'j_minty_plastic_stick', nil)
                                            card:add_to_deck()
                                            G.jokers:emplace(card)
                                            card:start_materialize()
                                            G.GAME.joker_buffer = 0
                                            return true
                                        end
                                    }))
                                end
                                return true;
                            end
                        }))
                        return true
                    end
                }))

                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            else
                return {
                    message = localize('k_safe_ex'),
                    colour = G.C.CHIPS,
                    card = card
                }
            end
        end
    end
}

if (SMODS.Mods["Cryptid"] or {}).can_load then
    table.insert(Cryptid.food, "j_minty_churutreat")
end

SMODS.Joker {
    key = 'plastic_stick',
    config = {
        extra = {
            xMult = 1
        }
    },
    rarity = 1,
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 6,
        y = 1
    },
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    pools = {
        ["Paperback"] = true, --Increase freqency when playing with Paper Deck. if sticks can spawn which i don't think pb ever actually turns on lol
    },
    yes_pool_flag = "sticks_can_spawn",

    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end

        local xMult = PB_UTIL.calculate_stick_xMult(card)

        return {
            key = key,
            vars = {
                card.ability.extra.xMult,
                xMult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local xMult = PB_UTIL.calculate_stick_xMult(card)

            if xMult ~= 1 then
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { xMult } },
                    Xmult_mod = xMult,
                    card = card
                }
            end
        end
    end
}