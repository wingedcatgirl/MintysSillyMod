if not (SMODS.Mods["UnStable"] or {}).can_load then --UnStable tweaks all these for its own ranks, 3petition will have to be reimplemented entirely to combine with that
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
                if context.repetition then 
                    local count = 0
                    if context.other_card:is_3() then
                        count = context.other_card:is_3()
                    else return end
                    if (context.other_card:get_id() == 2 or 
                    context.other_card:get_id() == 5 or 
                    context.other_card:get_id() == 8 or 
                    context.other_card:get_id() == 14) then
                        count = count + 1
                    end
                    if count > 1 then
                        --sendDebugMessage('Count (repetitions): '..count)
                        return {
                            message = localize('k_again_ex'),
                            repetitions = count - 1
                        }
                    end
                end
                if context.individual then
                    if (context.other_card:get_id() == 2 or 
                    context.other_card:get_id() == 5 or 
                    context.other_card:get_id() == 8 or 
                    context.other_card:get_id() == 14) or context.other_card:is_3() then
                        return {
                            mult = card.ability.extra,
                            card = card
                        }
                    end
                end
            end
        end
    }, true)

    SMODS.Joker:take_ownership('even_steven', {
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.individual then
                if context.other_card:is_even()
                then
                    return {
                        mult = card.ability.extra,
                        card = card
                    }
                end
            end
        end
    }, true)

    SMODS.Joker:take_ownership('odd_todd', {
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.individual then
                if context.other_card:is_odd() or context.other_card:is_3()
                then
                    return {
                        chips = card.ability.extra,
                        card = card
                    }
                end
            end
            if context.repetition then 
                local count = 0
                if context.other_card:is_3() then
                    count = context.other_card:is_3()
                else return end
                if context.other_card:is_odd() and not (context.other_card:get_id() == 3) then
                    count = count + 1
                end
                if count > 1 then
                    --sendDebugMessage('Count (repetitions): '..count)
                    return {
                        message = localize('k_again_ex'),
                        repetitions = count - 1
                    }
                end
            end
        end
    }, true)
end

function Card:is_numbercard(bypass_debuff)
    if self.debuff and not bypass_debuff then return false end
    if SMODS.has_no_rank(self) then return false end
    local id = self:get_id()
    local face = self:is_face()
    if face then return false end
    if id > 0 then return true end 
end

function Card:is_odd(bypass_debuff)
    if self.debuff and not bypass_debuff then return false end
    if not self:is_numbercard() then return false end
    local id = self:get_id()
    if (id == 14) or (id%2 == 1) then return true end
    return false
end

function Card:is_even(bypass_debuff)
    if self.debuff and not bypass_debuff then return false end
    if not self:is_numbercard() then return false end
    local id = self:get_id()
    if (id ~= 14) and (id%2 == 0) then return true end
    return false
end