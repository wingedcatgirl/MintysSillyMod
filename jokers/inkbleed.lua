SMODS.Joker {
    key = "inkbleed",
    name = "Inkbleed",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    demicoloncompat = false,
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
                card.ability.extra.mult
            }
        }
    end,
    in_pool = function (self, args) --Only if we actually *have* name collisions
        return not not next(MINTY.inkbleedtable)
    end,
    calculate = function(self, card, context)
        if context.check_enhancement then
            local ret = {}
            local enh = context.other_card.config.center.key
            if enh == "c_base" then return end
            if MINTY.inkbleedtable and next(MINTY.inkbleedtable[enh]) then return MINTY.inkbleedtable[enh] end
        end
    end
}

-- See localization/en-us.lua to create joker text