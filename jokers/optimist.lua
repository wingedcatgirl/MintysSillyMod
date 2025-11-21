SMODS.Joker {
    key = "optimist",
    name = "Optimist",
    --pronouns = "",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    rarity = 1,
    cost = 7,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = false,
    config = {
        extra = {
            xmult = 1,
            factor = 0.25,
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
                card.ability.extra.xmult,
                card.ability.extra.factor,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.pseudorandom_result and context.result then
            card.ability.extra.xmult = card.ability.extra.xmult + (context.numerator * card.ability.extra.factor)
            return {
                message = localize("k_upgrade_ex")
            }
        end

        if context.joker_main and card.ability.extra.xmult > 1 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}