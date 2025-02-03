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
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.Xmult, card.ability.extra.odds}
        }
    end,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.cardarea == G.play then
            if context.individual and context.other_card:is_3() then
                --this is a horrible mess oopsie! the intended outcome is that you get exactly 1 result without odds-fixing and exactly 2 with oops all 6s but i can't make it do that because i'm apparently bad at math
                local result = {card = card}
                local roll = pseudorandom('threecats')
                --sendDebugMessage("Playing "..#context.full_hand.." cards.")
                --sendDebugMessage("Roll value is: " .. tostring(roll))

                if (roll < G.GAME.probabilities.normal/card.ability.extra.odds) then 
                    --sendDebugMessage('[Minty] +Mult rolled for Three Cats '..roll)
                    result["mult"] = card.ability.extra.mult
                end
                if (roll > 2/3 and roll < (2/3 + G.GAME.probabilities.normal/card.ability.extra.odds)) or (roll < (G.GAME.probabilities.normal/card.ability.extra.odds - 1/3)) then 
                    --sendDebugMessage('[Minty] +Chips rolled for Three Cats '..roll)
                    result["chips"] = card.ability.extra.chips
                end
                if ((roll > 1/3) and roll < (1/3 + G.GAME.probabilities.normal/card.ability.extra.odds)) or (roll < (G.GAME.probabilities.normal/card.ability.extra.odds - 2/3)) then
                    --sendDebugMessage('[Minty] xMult rolled for Three Cats '..roll)
                    result["x_mult"] = card.ability.extra.Xmult
                end

                return result
            end
            if context.repetition and context.other_card:is_3() then
                local count = context.other_card:is_3()
                if count > 1 then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = count - 1
                    }
                end
            end
        end
    end
}
