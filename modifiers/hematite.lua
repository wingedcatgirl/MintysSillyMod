SMODS.Enhancement({
    key = "hematite",
    name = "Hematite Card",
    atlas = "enhance",
    set = "Enhanced",
    minty_rock = true,
    pos = {
        x = 0,
        y = 1
    },
	object_type = "Enhancement",
	badge_colour = HEX("a3ecc0"), --Magic Mint, according to internet
    config = {
        bonus = 25,
        h_x_mult = 1.25,
        extra = {
            gymboost = "hxmult"
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.bonus,
                card.ability.h_x_mult,
            },
        }
    end,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    calculate = function (self, card, context)
        if context.forcetrigger then
            return {
                chips = card.ability.bonus,
                xmult = card.ability.h_x_mult
            }
        end
    end
})