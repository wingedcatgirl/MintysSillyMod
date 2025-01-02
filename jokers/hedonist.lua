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
        if context.cardarea == G.play and context.other_card:is_3() then
            local count = context.other_card:is_3()
            local result = {
                mult = card.ability.extra.s_mult,
                card = card
            }
            if count > 1 then
                result["message"] = localize('k_again_ex')
                result["repetitions"] = count - 1
            end
            return result
        end
    end
}