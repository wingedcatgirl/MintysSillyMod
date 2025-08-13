local ortalab = (SMODS.Mods["ortalab"] or {}).can_load

SMODS.Joker {
    key = "lune",
    name = "Lune",
    atlas = 'legends',
    pos = {
        x = 5,
        y = 0
    },
    soul_pos = {
        x = 5,
        y = 1
    },
    rarity = 4,
    cost = 20,
    unlocked = false,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    demicoloncompat = false,
    pools = {
        ["kity"] = true,
        ["Ortalab"] = true,
    },
    config = {
        extra = {
            drop = 33
        }
    },
    
    locked_loc_vars = function (self, info_queue, card)
        if not (ortalab or MINTY.config.dev_mode or MINTY.config.include_crossover) then
            return {
                key = "minty_joker_unavailable",
                vars = {
                    "Mod",
                    "Ortalab"
                }
            }
        else
            return {
                key = "minty_joker_locked_kity"
            }
        end
    end,
    --]]
    loc_vars = function(self, info_queue, card)
        if MINTY.in_collection(card) and not (ortalab or MINTY.config.dev_mode or MINTY.config.include_crossover) then
            info_queue[#info_queue+1] = { set = "Other", key = "minty_disabled_object", specific_vars = { "Mod", "Ortalab" } }
        end
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.extra.drop,
            },
        }
    end,
    in_pool = function (self, args)
        return (ortalab or MINTY.config.dev_mode or MINTY.config.include_crossover)
    end,
    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
	        return {
                numerator = context.numerator / card.ability.extra.drop
            }
        end
    end
}