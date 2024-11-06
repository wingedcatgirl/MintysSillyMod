
SMODS.Joker {
    key = "hedonist",
    name = "Hedonist Joker",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
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
            suit = 'Minty_3s'
        }
    },
    loc_txt = {
        name = "Hedonist Joker",
        text = {"Played {C:Minty_3s}3s{} give",
                "{C:mult}+#1#{} Mult when scored"}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.s_mult, card.ability.extra.suit}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play then
            if context.other_card:is_suit('Minty_3s') and context.other_card:get_id() == 3 then
                return {
                    mult = card.ability.extra.s_mult,
                    card = card,
                    message = localize('k_again_ex'),
                    repetitions = 1
                } end
            if context.other_card:is_suit('Minty_3s') or context.other_card:get_id() == 3 then
                return {
                    mult = card.ability.extra.s_mult,
                    card = card
                } end
            end
    end
}