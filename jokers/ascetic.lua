local ortalab = (SMODS.Mods.ortalab or {}).can_load

SMODS.Joker {
    key = "ascetic",
    name = "Ascetic Joker",
    atlas = 'ortalabdoodles',
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
    demicoloncompat = true,
    pools = {
        ["Ortalab"] = true, --Can appear on Ortalab Stakes
    },
    effect = "Suit Chips",
    cost_mult = 1.0,
    config = {
        extra = {
            s_chips = 30,
            suit = 'minty_3s',
            again = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.in_collection(card) and not (ortalab or MINTY.config.dev_mode or MINTY.config.include_crossover) then
            info_queue[#info_queue+1] = { set = "Other", key = "minty_disabled_object", specific_vars = { "Mod", "Ortalab" } }
        end
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {card.ability.extra.s_chips, card.ability.extra.suit}
        }
    end,
    in_pool = function(self, args)
        return (ortalab or MINTY.config.dev_mode or MINTY.config.include_crossover) and MINTY.threeSuit_in_pool()
    end,
    calculate = function(self, card, context)
        if context.forcetrigger then
            return {
                chips = card.ability.extra.s_chips,
                card = card
            }
        end

        if context.cardarea == G.play and context.individual and context.other_card:is_3() then
            local count = context.other_card:is_3()
            card.ability.extra.again = count - 1
            --sendDebugMessage('[Minty] Count set to '..count)
            return {
                chips = card.ability.extra.s_chips,
                card = card
            }
        end
        if context.retrigger_joker_check and card.ability.extra.again ~= 0 and context.other_card == card then
            local again = card.ability.extra.again
            card.ability.extra.again = 0
            return {
                message = localize("k_again_ex"),
                message_card = card,
                repetitions = again,
            }
        end
    end
}