SMODS.Joker {
    key = "pessimist",
    name = "Pessimist",
    --pronouns = "",
    atlas = 'jokerdoodles', --TODO art
    pos = {
        x = 4,
        y = 8
    },
    soul_pos = {
        x = 5,
        y = 8
    },
    rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = false,
    config = {
        extra = {
            chips = 0,
            factor = 2
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
                card.ability.extra.chips,
                card.ability.extra.factor,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.pseudorandom_result and not context.result then
            card.ability.extra.chips = card.ability.extra.chips + (context.denominator * card.ability.extra.factor)
            return {
                message = localize("k_upgrade_ex")
            }
        end

        if context.joker_main and card.ability.extra.chips >= 0 then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}