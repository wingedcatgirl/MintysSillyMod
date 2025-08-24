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
    calculate = function (self, card, context)
        if (context.main_scoring and context.cardarea == G.play and SMODS.pseudorandom_probability(card, 'minty_splineboost', 1, card.ability.extra.odds, 'minty_splineboost')) or context.forcetrigger then
            card.ability.perma_bonus = card.ability.perma_bonus + card.ability.extra.chips
            return {
                message = localize('k_upgrade_ex')
            }
        end
    end
})