SMODS.Joker {
    key = "fatcat-m",
    name = "Fat Cat",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    rarity = 3,
    cost = 11,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = true,
    pools = {
        ["kity"] = true
    },
    config = {
        extra = {
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind or context.forcetrigger then
                local copier = context.blueprint and context.blueprint_card or card
                G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({
                                set = "Joker",
                                area = G.jokers,
                                key_append = "minty_fatcat",
                                edition = "e_negative",
                                stickers = {
                                    "rental",
                                    "perishable"
                                }
                            })
                            card:juice_up(0.3, 0.5)
                            card_eval_status_text(copier, 'extra', nil, nil, nil, {message = localize('k_minty_ordered'), delay = 0.35})
                            return true
                        end}))
        end
    end
}