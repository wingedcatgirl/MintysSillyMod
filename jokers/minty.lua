SMODS.Joker {
    key = "minty",
    name = "Minty",
    atlas = 'mintylegends',
    pos = {
        x = 3,
        y = 0
    },
    soul_pos = {
        x = 3,
        y = 1
    },
    rarity = 4,
    cost = 20,
    unlocked = false,
    discovered = false,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = true,
    config = {
        extra = {
            powmult = 1.3,
            scored = 0,
            target = 3,
            reps = 0,
            moving = 3,
            upgraded = false
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
                card.ability.extra.powmult,
                card.ability.extra.scored,
                card.ability.extra.target,
                card.ability.extra.reps + 1,
                card.ability.extra.moving
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and context.other_card:is_3() and not (context.retrigger_joker or context.retrigger_joker_check) then
            local count = context.other_card:is_3()
            card.ability.extra.scored = card.ability.extra.scored + count
            if card.ability.extra.scored >= card.ability.extra.target then
                card.ability.extra.scored = card.ability.extra.scored - card.ability.extra.target
                card.ability.extra.target = card.ability.extra.target + card.ability.extra.moving
                card.ability.extra.reps = card.ability.extra.reps + 1
                card.ability.extra.upgraded = true
                return {
                    message = localize("k_upgrade_ex"),
                    message_card = card,
                }
            end
        end

        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card == card and card.ability.extra.reps >= 1 then
            if card.ability.extra.upgraded == true then
                card.ability.extra.upgraded = false --Probably-bad hack to prevent erroneous "Again!" on upgrade
                return
            end
            return {
                repetitions = card.ability.extra.reps,
                card = card,
            }
        end

        if context.joker_main and context.scoring_hand then
            return {
                emult = card.ability.extra.powmult,
                card = card
            }
        end
    end
}