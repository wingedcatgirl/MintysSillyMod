FusionJokers.fusions:add_fusion("j_minty_hedonist", nil, false, "j_minty_claw", nil, false, "j_minty_threecats", 12)


SMODS.Joker {
    dependencies = "FusionJokers",
    key = "threecats",
    name = "Three Cats!",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
        },
    soul_pos = {
        x = 2,
        y = 1
        },
    rarity = 'fusion',
    cost = 12,
    config = {extra = {chips = 33, mult = 13, odds = 3, Xmult = 3}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.Xmult, card.ability.extra.odds}
        }
    end,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and (context.other_card:is_suit('minty_3s') or context.other_card:get_id() == 3) then  
            local result = {card = card}
            local roll = pseudorandom('threecats')
            sendDebugMessage("Playing "..#context.full_hand.." cards.")
            sendDebugMessage("Roll value is: " .. tostring(roll))

            if (roll < G.GAME.probabilities.normal/card.ability.extra.odds) then 
                sendDebugMessage('[Minty] +Mult rolled for Three Cats'..roll)
                result["mult"] = card.ability.extra.mult
            end
            if (roll > (1 - G.GAME.probabilities.normal/card.ability.extra.odds)) then 
                sendDebugMessage('[Minty] +Chips rolled for Three Cats'..roll)
                result["chips"] = card.ability.extra.chips
            end
            if ((.5 - (G.GAME.probabilities.normal/card.ability.extra.odds)/2) < roll and roll < (.5 + (G.GAME.probabilities.normal/card.ability.extra.odds)/2)) then
                sendDebugMessage('[Minty] xMult rolled for Three Cats'..roll)
                result["x_mult"] = card.ability.extra.Xmult
            end
            if context.other_card:is_suit('minty_3s') and context.other_card:get_id() == 3 then
                result["message"] = localize('k_again_ex')
                result["repetitions"] = 1
            end

            return result
        end
    end
}
