SMODS.Joker {
    key = "hedonist",
    name = "Hedonist Joker",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 0,
        y = 1
    },
    rarity = 1,
    cost = 3,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    effect = "Suit Mult",
    cost_mult = 1.0,
    config = {
        extra = {
            s_mult = 3,
            suit = 'minty_3s'
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.s_mult, card.ability.extra.suit}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play then
            if context.repetition then 
                local count = 0
                if context.other_card:is_3() then
                    count = context.other_card:is_3()
                else return end
                if count > 1 then
                    --sendDebugMessage('Count (repetitions): '..count)
                    return {
                        message = localize('k_again_ex'),
                        repetitions = count - 1
                    }
                end
            end
            if context.individual then
                if context.other_card:is_3() then
                    local count = context.other_card:is_3()
                    --sendDebugMessage('Count (individual): '..count)
                    return {
                        mult_mod = card.ability.extra.s_mult,
                        message = localize {
                            type = 'variable',
                            key = 'a_mult',
                            vars = { card.ability.extra.s_mult }
                        },
                        card = card
                    }
                end
            end
        end
    end
}