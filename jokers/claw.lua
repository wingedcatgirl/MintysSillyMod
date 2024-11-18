SMODS.Joker {
    key = "claw",
    name = "Fossilized Claw",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
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
    loc_txt = {
        name = "Fossilized Claw",
        text = {
            "{C:green}#1# in #2#{} chance for",
            "played {C:minty_3s}3s{} to give",
            "{X:mult,C:white} X#3# {} Mult when scored",
                }
        },
    calculate = function(self, card, context)
        if context.cardarea == G.play then    
            if (context.other_card:is_suit("minty_3s") or context.other_card:get_id() == 3) and pseudorandom('claw') < G.GAME.probabilities.normal/card.ability.extra.odds then
                if (context.other_card:is_suit("minty_3s") and context.other_card:get_id() == 3) and pseudorandom('claw') < G.GAME.probabilities.normal/card.ability.extra.odds then
                    return {
                        x_mult = card.ability.extra.Xmult,
                        card = card
                        }
                else 
                    return {
                        x_mult = card.ability.extra.Xmult,
                        card = card
                        }
                    end
                end
            end
        end
}