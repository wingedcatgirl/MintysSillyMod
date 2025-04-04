SMODS.Enhancement({
    key = "marble",
    name = "Marble Card",
    atlas = "mintyenhance",
    set = "Enhanced",
    post = {
        x = 0,
        y = 0
    },
	object_type = "Enhancement",
	badge_colour = HEX("a3ecc0"), --Magic Mint, according to internet
    config = {
        p_dollars = 3,
        extra = {
            gymboost = "cash"
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.p_dollars,
            },
        }
    end,
    replace_base_card = true,
    no_rank = true,
    any_suit = true,
})