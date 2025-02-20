SMODS.Joker {
    key = "garfielf",
    name = "Garfielf",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    rarity = 4,
    cost = 20,
    unlocked = false,
    discovered = false,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = true,
    pools = {["kity"] = true},
    config = {
        extra = {
            xmult = 1,
            xmultgain = 0.5,
            found = false
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmultgain,
            }
        }
    end,
    calculate = function(self, card, context)
        -- Calculation goes here
        if context.cardarea == G.play and context.individual then
            --sendDebugMessage("[Minty] Observing card")
            if context.other_card:is_3() then
                --sendDebugMessage("[Minty] 3 detected!")
                card.ability.extra.found = true
            end
        end

        if context.joker_main and context.scoring_hand then
            --sendDebugMessage("[Minty] xMult time :3")
            return {
                    xmult = card.ability.extra.xmult
            }
        end

        if context.destroying_card and context.cardarea == "unscored" and card.ability.extra.found == true then
            --sendDebugMessage("[Minty] Attempting to destroy card")
            if context.destroying_card.ability.eternal then 
                --sendDebugMessage("[Minty] Card is eternal, no destruaction")
                return false 
            elseif context.destroying_card:is_3() then
                --sendDebugMessage("[Minty] Card is a 3, no destruaction")
                return false
            end
            --sendDebugMessage("[Minty] Destruaction time >:3")
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultgain
            local multgain = card.ability.extra.xmultgain
            return {
                delay = 0.4,
                remove = true,
                message = localize('k_nommed_ex'),
                card = card,
            }
        end

        if context.after then
            --sendDebugMessage("[Minty] 3 forgotten")
            card.ability.extra.found = false
        end

    end
}