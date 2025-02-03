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
    config = {extra = {odds = 3, xmult = 3, temp = 0}},
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
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
            if context.individual and context.other_card:is_3() then
                local trycount = context.other_card:is_3()
                local repcount = 0
                for try=1,trycount do
                    if pseudorandom('claw') < G.GAME.probabilities.normal/card.ability.extra.odds then 
                        repcount = repcount + 1
                    end
                end
                card.ability.extra.temp = repcount
                --sendDebugMessage('Count (individual): '..card.ability.extra.temp)
                if card.ability.extra.temp ~= 0 then
                    return {
                        Xmult_mod = card.ability.extra.xmult,
                        message = localize {
                            type = 'variable',
                            key = 'a_xmult',
                            vars = { card.ability.extra.xmult }
                        },
                        card = card
                    }
                end
            end
            if context.repetition and context.other_card:is_3() then 
                --sendDebugMessage('Count (repetitions): '..card.ability.extra.temp)
                local reps = card.ability.extra.temp-1
                card.ability.extra.temp = 0
                if reps >= 1 then 
                    return {
                        message = localize('k_again_ex'),
                        repetitions = reps
                    }
                end
            end
        end
    end
}