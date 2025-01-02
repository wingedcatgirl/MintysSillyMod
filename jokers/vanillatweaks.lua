SMODS.Joker:take_ownership('hack', {
	calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition then
            local count = 0
            if context.other_card:is_3() then
                count = context.other_card:is_3()
            end

            if (context.other_card:get_id() == 2 or 
            context.other_card:get_id() == 4 or 
            context.other_card:get_id() == 5) then
                count = count + 1
            end

            if count >= 1 then 
                return {
                    message = localize('k_again_ex'),
                    repetitions = count,
                    card = card
                }
            end
        end
    end
}, true)

SMODS.Joker:take_ownership('fibonacci', {
	calculate = function(self, card, context)
        if context.cardarea == G.play then
            local count = 0
            local result = {
                mult = card.ability.extra,
                card = card
            }
            if context.other_card:is_3() then
                count = context.other_card:is_3()
            end

            if (context.other_card:get_id() == 2 or 
            context.other_card:get_id() == 5 or 
            context.other_card:get_id() == 8 or 
            context.other_card:get_id() == 14) then
                count = count + 1
            end

            if count > 1 then 
                result["message"] = localize('k_again_ex')
                result["repetitions"] = count - 1 
            end

            if count >= 1 then
                return result
            end
        end
    end
}, true)