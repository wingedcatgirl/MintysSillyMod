SMODS.Joker {
    key = "froyo",
    name = "Frozen Yogurt",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 2,
        y = 0
    },
    rarity = 1,
    cost = 1,
    unlocked = true,
    discovered = false,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = true,
    pools = {["Food"] = true}, -- Cryptid compatibility for refactor
    config = {
        extra = {
            chips = 50,
            chip_mod = 5
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {card.ability.extra.chips, card.ability.extra.chip_mod}
        }
    end,
    calculate = function(self, card, context)
        if (context.after and not context.blueprint) or context.forcetrigger then
            local new_chip_val = card.ability.extra.chips - card.ability.extra.chip_mod
            if (new_chip_val > 0) then
                card.ability.extra.chips = new_chip_val
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize {
                        type = 'variable',
                        key = 'a_chips_minus',
                        vars = {card.ability.extra.chip_mod}
                    },
                    colour = G.C.CHIPS
                });
            else
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
                                card = nil
                                return true; 
                            end
                        })) 
                        return true
                    end
                }))
                return {
                    message = localize('k_melted_ex'),
                    colour = G.C.FILTER
                }
            end
        end
        if context.joker_main then
            return {
                message = localize {
                    type = 'variable',
                    key = 'a_chips',
                    vars = {card.ability.extra.chips}
                },
                chip_mod = card.ability.extra.chips,
                colour = G.C.CHIPS
            }
        end
    end
}

if (SMODS.Mods["Cryptid"] or {}).can_load then
    table.insert(Cryptid.food, "j_minty_froyo")
end