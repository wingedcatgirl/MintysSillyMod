SMODS.Enhancement({
    key = "crystal",
    name = "Crystal Card",
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
        chips = 50,
        p_dollars = 3,
        extra = {
            odds = 2,
            gymboost = "cash"
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.chips,
                card.ability.p_dollars,
                G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1,
                card.ability.extra.odds,
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
                chips = card.ability.chips,
                dollars = card.ability.p_dollars,
                remove = true
            }
        end

        if context.main_scoring and context.cardarea == G.play then
            return {
                chips = card.ability.chips,
                dollars = card.ability.p_dollars,
            }
        end

        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card then
            if pseudorandom("Crystal Destroy Chance") < G.GAME.probabilities.normal / card.ability.extra.odds then
                return {
                    remove = true
                }
            end
        end
    end
})