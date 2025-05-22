SMODS.Enhancement({
    key = "garbled",
    name = "Garbled Card",
    atlas = "enhance",
    set = "Enhanced",
    pos = {
        x = 1,
        y = 0
    },
	object_type = "Enhancement",
	badge_colour = HEX("a3ecc0"), --Magic Mint, according to internet
    config = {
        extra = {
            gymboost = "random"
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            },
        }
    end,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    calculate = function (self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local mult = pseudorandom("minty_garbled", 0, 23)

            if mult > 0 then
                return {
                    mult = mult
                }
            end
        end
    end,
})