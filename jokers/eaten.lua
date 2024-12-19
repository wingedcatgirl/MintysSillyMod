
SMODS.Joker {
    key = "eaten",
    name = "Eaten Joker",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {extra = {mult = 7, chips = 17, odds = 7}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.odds, ''..(G.GAME and G.GAME.probabilities.normal or 1)}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play then
            if context.other_card:get_id() == 7 then
                return {
                    mult = card.ability.extra.mult,
                    chips = card.ability.extra.chips,
                    card = card
                }
            end
        end
        if context.after then  --pseudorandom('eaten') < G.GAME.probabilities.normal/card.ability.extra.odds
            for index,thecard in ipairs(G.play.cards) do


            return {
                message = localize('k_drowned_ex'),
                colour = G.C.RED,
                delay = 0.45, 
                remove = true,
                card = card
            }
            end
        end
    end
}