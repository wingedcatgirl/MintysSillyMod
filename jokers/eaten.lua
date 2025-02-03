SMODS.Joker {
    key = "eaten",
    name = "Eaten Joker",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 5,
        y = 1
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
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.odds, ''..(G.GAME and G.GAME.probabilities.normal or 1)}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if context.other_card:get_id() == 7 then
                return {
                    mult = card.ability.extra.mult,
                    chips = card.ability.extra.chips,
                    card = card
                }
            end
        end
        if context.destroying_card and not context.destroying_card.ability.eternal and context.destroying_card:get_id() ~= 7 and pseudorandom('eaten') < G.GAME.probabilities.normal/card.ability.extra.odds then
            return {
                remove = true,
                message = localize('k_drowned_ex'),
                card = card
            }
        end
    end
}