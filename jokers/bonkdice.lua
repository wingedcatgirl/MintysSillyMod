SMODS.Joker {
    key = "bonkdice",
    name = "Bonkin' Dice",
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
    cost = 6,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = true,
    demicoloncompat = false,
    config = {
        extra = {
            min = 1,
            max = 6,
            gain = 2,
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        local min, max = SMODS.get_probability_vars(card, card.ability.extra.min, card.ability.extra.max, "minty_bonk_dice_roll", true)
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                min,
                max,
                card.ability.extra.gain
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local min, max = SMODS.get_probability_vars(card, card.ability.extra.min, card.ability.extra.max, "minty_bonk_dice_roll", true)
            local mult = pseudorandom("minty_bonk_dice_roll", min, max)
            if mult == max then
                SMODS.pseudorandom_probability(card, "minty_bonk_upgrade", 1, 1, nil, true) --Force a successful luck roll so things that care about that can respond
                MINTY.event(function ()
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "max",
                        scalar_value = "gain"
                    })
                    return true
                end)
            else
                SMODS.pseudorandom_probability(card, "minty_bonk_don't_upgrade", 0, 1000000, nil, true) --...or a failed luck roll.
            end
            if mult > 0 then
                return {
                    mult = mult
                }
            end
        end
    end
}