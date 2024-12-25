SMODS.Joker {
    key = "claw",
    name = "Fossilized Claw",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 7
        },
    soul_pos = {
        x = 1,
        y = 1
        },
    rarity = 2,
    cost = 7,
    config = {extra = {odds = 3, xmult = 3}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.xmult}
        }
    end,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.cardarea == G.play then
            local roll1 = pseudorandom('claw') < G.GAME.probabilities.normal/card.ability.extra.odds
            local roll2 = pseudorandom('claw') < G.GAME.probabilities.normal/card.ability.extra.odds
            if (context.other_card:is_suit('minty_3s') or context.other_card:get_id() == 3) and roll1 then
                local result = {
                    x_mult = card.ability.extra.xmult,
                    card = card
                }
                if context.other_card:is_suit('minty_3s') and context.other_card:get_id() == 3 and roll2 then
                    result["message"] = localize('k_again_ex')
                    result["repetitions"] = 1
                end
                return result
            end
        end
    end
}