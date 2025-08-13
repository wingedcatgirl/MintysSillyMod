SMODS.Enhancement({
    key = "microcline",
    name = "Microcline Card",
    atlas = "enhance",
    set = "Enhanced",
    minty_rock = true,
    pos = {
        x = 2,
        y = 0
    },
	object_type = "Enhancement",
	badge_colour = HEX("a3ecc0"), --Magic Mint, according to internet
    config = {
        h_chips = 100,
        extra = {
            gymboost = "hchips"
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.h_chips,
            },
        }
    end,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    calculate = function (self, card, context)
        if context.forcetrigger then
            return {
                chips = card.ability.h_chips
            }
        end
    end
})