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
        if context.cardarea == G.play and context.other_card:is_3() then
            local trycount = context.other_card:is_3()
            local repcount = 0
            local result = {card = card}
            for try=1,trycount do
                if pseudorandom('claw') < G.GAME.probabilities.normal/card.ability.extra.odds then 
                    repcount = repcount + 1
                end
            end
            if repcount >= 1 then
                result["x_mult"] = card.ability.extra.xmult
            end
            if repcount >= 2 then
                result["message"] = localize('k_again_ex')
                result["repetitions"] = repcount - 1
            end
            return result
        end
    end
}