SMODS.Enhancement({
    key = "crystal",
    name = "Crystal Card",
    atlas = "enhance",
    set = "Enhanced",
    minty_rock = true,
    pos = {
        x = 3,
        y = 0
    },
	object_type = "Enhancement",
	badge_colour = HEX("a3ecc0"), --Magic Mint, according to internet
    config = {
        bonus = 50,
        p_dollars = 3,
        extra = {
            odds = 2,
            gymboost = "cash"
        },
    },
    loc_vars = function(self, info_queue, card)
        local luck, odds = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "minty_crystal_desc", false)
        return {
            vars = {
                card.ability.bonus,
                card.ability.p_dollars,
                luck,
                odds,
            },
        }
    end,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    shatters = true,
    calculate = function (self, card, context)
        if context.forcetrigger then
            return {
                chips = card.ability.bonus,
                dollars = card.ability.p_dollars,
                remove = true
            }
        end

        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card then
            if SMODS.pseudorandom_probability(card, 'minty_crystalshatter', 1, card.ability.extra.odds, 'minty_crystalshatter') then
                return {
                    remove = true
                }
            end
        end
    end
})