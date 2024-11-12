SMODS.Joker {
    key = "proso",
    name = "Prosopagnosia",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.Xmult}
        }
    end,
    config = {extra = {Xmult = 5}},
    loc_txt = {
        name = "Prosopagnosia",
        text = {"{C:attention}No{} cards are considered",
                "{C:attention}face{} cards. {C:inactive}(K = 13,",
                "{C:inactive}Q = 12, J = 11)"}
    },
    calculate = function(self, card, context)
        
    end
}
