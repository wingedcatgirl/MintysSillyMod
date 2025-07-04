SMODS.Joker {
    key = "garfielf",
    name = "Garfielf",
    atlas = 'legends',
    pos = {
        x = 0,
        y = 2
    },
    soul_pos = {
        x = 0,
        y = 3
    },
    rarity = 4,
    cost = 20,
    unlocked = false,
    discovered = false,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = true,
    pools = {
        ["kity"] = true
    },
    config = {
        extra = {
            xmult = 1,
            xmultgain = 0.5,
            found = false
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        local rank = pseudorandom_element({
            "Aces", "Kings", "Queens", "Jacks", "10s", "9s", "8s", "7s", "6s", "5s", "4s", "2s"
        })
        local suit = pseudorandom_element({
            "Heart", "Spade", "Club", "Diamond"
        })
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmultgain,
                rank,
                suit,
            }
        }
    end,
    in_pool = function(self, args)
        return MINTY.threeSuit_in_pool()
    end,
    calculate = function(self, card, context)
        -- Calculation goes here
        if context.cardarea == G.play and context.individual then
            --MINTY.say("Observing card")
            if context.other_card:is_3() then
                --MINTY.say("3 detected!")
                card.ability.extra.found = true
            end
        end

        if context.joker_main and context.scoring_hand then
            --MINTY.say("xMult time :3")
            return {
                    xmult = card.ability.extra.xmult
            }
        end

        if context.destroy_card and context.cardarea == "unscored" and card.ability.extra.found == true and not context.blueprint then
            --MINTY.say("Attempting to destroy card")
            if context.destroy_card.ability.eternal then
                --MINTY.say("Card is eternal, no destruaction")
                return false
            elseif context.destroy_card:is_3() then
                --MINTY.say("Card is a 3, no destruaction")
                return false
            end
            --MINTY.say("Destruaction time >:3")
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultgain
            return {
                delay = 0.4,
                remove = true,
                message = localize('k_nommed_ex'),
                card = card,
            }
        end

        if context.after then
            --MINTY.say("3 forgotten")
            card.ability.extra.found = false
        end

    end
}