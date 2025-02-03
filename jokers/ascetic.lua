SMODS.Joker {
    key = "ascetic",
    name = "Ascetic Joker",
    atlas = 'mintyortalabplaceholder',
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
    effect = "Suit Chips",
    cost_mult = 1.0,
    config = {
        extra = {
            s_chips = 30,
            suit = 'minty_3s'
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {card.ability.extra.s_chips, card.ability.extra.suit}
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
                        chips = card.ability.extra.s_chips,
                        card = card
                    }
                end
            end
        end
    end
}