SMODS.Joker {
    key = "catnipfields",
    name = "Catnip Fields",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 5,
        y = 2
    },
    rarity = 1,
    cost = 6,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {extra = {
        xmult = 1.05,
        xmultgain = 0.05,
        xmultbase = 1.05
      }},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.xmult, card.ability.extra.xmultgain, card.ability.extra.xmultbase}
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
                -- Reset the xMult if the current card is not a 3
                if not context.other_card:is_3() then
                    card.ability.extra.xmult = card.ability.extra.xmultbase
                    return
                end
        
                -- Give the xMult if the current card is a 3
                if context.other_card:is_3() then
                -- Upgrade the xMult
                    local xmult = card.ability.extra.xmult
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultgain
        
                    return {
                        xmult = xmult,
                        card = card
                    }
                end
            end
        end
    
        -- Quietly reset the xMult for the card at the end of played hand
        if context.after and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmultbase
        end
    end
}