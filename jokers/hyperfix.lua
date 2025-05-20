SMODS.Joker {
    key = "hyperfix",
    name = "Angel of Hyperfixation",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 2,
        y = 4
    },
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            expmult_base = 1,
            expmult_boost = 0.25
        }
    },
    in_pool = function (self, args) --Don't spawn if locked at 0 (not sure that's actually possible but hey)
        if G and G.GAME and G.GAME.minty_hyperfix and G.GAME.minty_hyperfix.active or (G.GAME.minty_hyperfix.value > 0) then
            return true
        else
            return false
        end
    end,
    loc_vars = function(self, info_queue, card)
        local key = self.key
        local total = card.ability.extra.expmult_base + ((G.GAME.minty_hyperfix and G.GAME.minty_hyperfix.value or 0) * card.ability.extra.expmult_boost)
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.extra.expmult_boost,
                total
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand then
            local total = card.ability.extra.expmult_base + ((G.GAME.minty_hyperfix and G.GAME.minty_hyperfix.value or 0) * card.ability.extra.expmult_boost)
            return {
                emult = total,
                card = card
            }
        end
    end
}

-- See localization/en-us.lua to create joker text