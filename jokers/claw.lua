SMODS.Joker {
    key = "claw",
    name = "Fossilized Claw",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 1
        },
    soul_pos = {
        x = 1,
        y = 1
        },
    rarity = 2,
    cost = 7,
    config = {
        extra = {
            odds = 3,
            xmult = 3,
            again = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        local luck, odds = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "minty_claw_desc", false)
        return {
            key = key,
            vars = {
                luck,
                odds,
                card.ability.extra.xmult
            }
        }
    end,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = true,
    in_pool = function(self, args)
        return MINTY.threeSuit_in_pool()
    end,
    calculate = function(self, card, context)
        if context.forcetrigger then
            return {
                xmult = card.ability.extra.xmult,
                card = card
            }
        end

        if context.cardarea == G.play and context.individual and context.other_card:is_3() then
            local trycount = context.other_card:is_3()
            local repcount = 0
            for try=1,trycount do
                if SMODS.pseudorandom_probability(card, 'claw', 1, card.ability.extra.odds, 'claw') then
                    repcount = repcount + 1
                end
            end
            card.ability.extra.again = repcount
            --sendDebugMessage('Count (individual): '..card.ability.extra.again)
            if card.ability.extra.again ~= 0 then
                return {
                    xmult = card.ability.extra.xmult,
                    card = card
                }
            end
        end

        if context.retrigger_joker_check and card.ability.extra.again ~= 0 and context.other_card == card then
            local reps = card.ability.extra.again-1
            card.ability.extra.again = 0
            if reps >= 1 then
                return {
                    message = localize('k_again_ex'),
                    message_card = card,
                    repetitions = reps
                }
            end
        end
    end
}