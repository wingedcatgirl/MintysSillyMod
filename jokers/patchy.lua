SMODS.Joker {
    key = "patchy",
    name = "Patchy",
    atlas = 'mintylegends',
    pos = {
        x = 2,
        y = 0
        },
    soul_pos = {
        x = 2,
        y = 1
        },
    rarity = 4,
    cost = 20,
    unlocked = false,
    discovered = false,
    config = {extra = {xmult = 3, kity = true}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.xmult}
        }
    end,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.cardarea == G.play then
            if context.individual and context.other_card:is_3() then
                return {
                    xmult = card.ability.extra.xmult,
                    card = card
                }
            end
            if context.repetition and context.other_card:is_3() then
                local count = context.other_card:is_3()
                return {
                    message = localize('k_again_ex'),
                    repetitions = count,
                    card = card
                }
            end
        end
    end
}