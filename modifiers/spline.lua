local mf = (SMODS.Mods["MoreFluff"] or {}).can_load

SMODS.Enhancement({
    key = "spline",
    name = "Spline Card",
    atlas = "enhance",
    set = "Enhanced",
    pos = {
        x = 2,
        y = 1
    },
	object_type = "Enhancement",
	badge_colour = HEX("a3ecc0"), --Magic Mint, according to internet
    config = {
        extra = {
            odds = 3,
            chips = 13,
            gymboost = "chips"
        },
    },
    valk_hand_buff = {
        title = "MECHANICAL",
        colour = HEX("777777"),
        scoring_func = function (power)
            local number = 0
            for _, v in ipairs(G.play.cards) do
                v.ability.perma_bonus = (v.ability.perma_bonus or 0) + 10 + (power * 3)
                v.ability.perma_bonus = v.ability.perma_bonus * (1.5 + (power*0.5))
                number = number + v.ability.perma_bonus
            end
            MINTY.event(function ()
                for _, v in ipairs(G.play.cards) do
                    v:juice_up()
                end
                return true
            end)
            return {
                message = localize("k_upgrade_ex"),
                extra = {
                    chips = number
                }
            }
        end
    },
    loc_vars = function(self, info_queue, card)
        local luck, odds = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "minty_spline_desc", false)
        return {
            vars = {
                luck,
                odds,
                card.ability.extra.chips,
            },
        }
    end,
    get_weight = function (self)
        local default = 5
        return mf and default or default/2
    end,
    calculate = function (self, card, context)
        if (context.main_scoring and context.cardarea == G.play and SMODS.pseudorandom_probability(card, 'minty_splineboost', 1, card.ability.extra.odds, 'minty_splineboost')) or context.forcetrigger then
            card.ability.perma_bonus = card.ability.perma_bonus + card.ability.extra.chips
            return {
                message = localize('k_upgrade_ex')
            }
        end
    end
})