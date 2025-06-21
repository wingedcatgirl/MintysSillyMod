SMODS.Enhancement({
    key = "Spline",
    name = "Spline Card",
    atlas = "enhance",
    set = "Enhanced",
    pos = {
        x = 2,
        y = 0
    },
	object_type = "Enhancement",
	badge_colour = HEX("a3ecc0"), --Magic Mint, according to internet
    config = {
        extra = {
            hmult = 20,
            gymboost = "hmult"
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hmult,
            },
        }
    end,
    calculate = function (self, card, context)
        if (context.main_scoring and context.cardarea == G.hand) or context.forcetrigger then
            return {
                mult = card.ability.extra.hmult,
                remove = true
            }
        end
    end
})