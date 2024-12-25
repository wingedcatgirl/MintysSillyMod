
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
            if context.other_card:is_suit('minty_3s') or context.other_card:get_id() == 3 then
                local result = {
                    mult = card.ability.extra.s_mult,
                    card = card
                }
                if context.other_card:is_suit('minty_3s') and context.other_card:get_id() == 3 then
                    result["message"] = localize('k_again_ex')
                    result["repetitions"] = 1
                end
                return result
            end
        end
    end
}