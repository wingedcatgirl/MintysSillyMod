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
    config = {extra = {odds = 3, Xmult = 3}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.Xmult}
        }
    end,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.cardarea == G.play then    
            if context.other_card:is_suit("minty_3s") or context.other_card:get_id() == 3 then
                local roll1 = pseudorandom('claw') < G.GAME.probabilities.normal/card.ability.extra.odds
                local roll2 = pseudorandom('claw') < G.GAME.probabilities.normal/card.ability.extra.odds
                if (context.other_card:is_suit("minty_3s") and context.other_card:get_id() == 3) then
                    if roll1 and roll2 then
                        return {
                            x_mult = card.ability.extra.Xmult,
                            card = card,
                            message = localize('k_again_ex'),
                            repetitions = 1
                            }
                    elseif roll1 or roll2 then
                        return {
                            x_mult = card.ability.extra.Xmult,
                            card = card
                            }
                    end
                elseif roll1 then
                    return {
                        x_mult = card.ability.extra.Xmult,
                        card = card
                        }
                    end
                end
            end
        end
}