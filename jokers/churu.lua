SMODS.Joker {
    key = "churutreat",
    config = {
        extra = {
            mult = 5,
            odds = 6
        }
    },
    rarity = 2,
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 6,
        y = 0
    },
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    no_pool_flag = "churu_treat_eaten",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,

    calculate = function(self, card, context)
        -- Give the mult during play if card is a 3, and retrigger if it's a 3 of 3s
        if context.cardarea == G.play then
            if context.other_card:is_suit("minty_3s") and context.other_card:get_id() == 3 then
                return {
                    mult = card.ability.extra.mult,
                    card = card,
                    message = localize('k_again_ex'),
                    repetitions = 1
                }
            elseif context.other_card:is_suit("minty_3s") or context.other_card:get_id() == 3 then
                return {
                    mult = card.ability.extra.mult,
                    card = card
                }
            end
        end

        -- Check if the Joker needs to be eaten
        if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
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

SMODS.Joker {
    key = 'plastic_stick',
    config = {
        extra = {
            xMult = 1
        }
    },
    rarity = 2,
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 6,
        y = 1
    },
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    yes_pool_flag = "sticks_can_spawn",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xMult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local xMult = card.ability.extra.xMult
            for i = 1, #G.jokers.cards do
                local current_card = G.jokers.cards[i]
                if current_card ~= card and string.match(string.lower(current_card.ability.name), "%f[%w]stick%f[%W]") then
                    xMult = xMult + card.ability.extra.xMult
                end
            end

            return {
                message = localize{ type = 'variable', key = 'a_xmult', vars = { xMult } },
                Xmult_mod = xMult,
                card = card
            }
        end
    end
}