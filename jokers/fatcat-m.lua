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
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                SMODS.add_card({
                    set = "Joker",
                    area = G.jokers,
                    key_append = "minty_fatcat",
                    edition = "negative",
                    stickers = {
                        "rental",
                        "perishable"
                    }
                })
                card:juice_up(0.3, 0.5)
                return true
            end }))
        end
    end
}

-- See localization/en-us.lua to create joker text