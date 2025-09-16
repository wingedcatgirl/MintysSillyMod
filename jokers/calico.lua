local finity = (SMODS.Mods["finity"] or {}).can_load
local crossover = MINTY.config.include_crossover
local rarity = finity and "finity_showdown" or 4

SMODS.Joker {
    key = "finity_calico",
    name = "Calico on the Counter",
    atlas = 'legends',
    pos = {
        x = 1,
        y = 2
    },
    soul_pos = {
        x = 1,
        y = 3
    },
    credit = {
        art = "JPenguin", --https://discord.com/channels/1116389027176787968/1308185262664450068/1405665038571929760
        code = "wingedcatgirl",
        concept = "wingedcatgirl",
    },
    rarity = rarity,
    cost = 10,
    pools = {
        ["kity"] = true,
    },
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = true,
    config = {
        extra = {
            base_luck = 1,
            base_odds = 5,
            flipped_mult = 20,
            debuffed_xmult = 2,
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        local luck, odds = SMODS.get_probability_vars(card, card.ability.extra.base_luck, card.ability.extra.base_odds, "minty_finity_calico_desc", false)
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        if not (finity or crossover) then
            info_queue[#info_queue+1] = { set = "Other", key = "minty_disabled_object", specific_vars = { "Mod", "Finity" } }
        end
        return {
            key = key,
            vars = {
                luck,
                odds,
                card.ability.extra.flipped_mult,
                card.ability.extra.debuffed_xmult,
            }
        }
    end,
    in_pool = function (self, args)
        local calico_defeated = G.GAME.blinds_defeated_list and G.GAME.blinds_defeated_list.bl_minty_calico_counter

        return finity or (crossover and calico_defeated)
    end,
    calculate = function(self, card, context)
        if context.forcetrigger then
            return {
                mult = card.ability.extra.flipped_mult,
                xmult = card.ability.extra.debuffed_xmult,
            }
        end

        if context.stay_flipped and not context.blueprint then
            if context.to_area == G.hand then
                --1 in 5 base chance of toggling Calico's debuff
                if context.other_card.ability.calico_debuffed or SMODS.pseudorandom_probability(card, "minty_finity_calico_debuff", card.ability.extra.base_luck, card.ability.extra.base_odds, "minty_finity_calico_debuff") then
                    context.other_card.ability.calico_debuffed = not context.other_card.ability.calico_debuffed
                    SMODS.debuff_card(context.other_card, context.other_card.ability.calico_debuffed, "minty_finity_calico_debuff")
                end

                --1 in 5 chance of toggling Calico's flip
                if SMODS.pseudorandom_probability(card, "minty_finity_calico_flip", card.ability.extra.base_luck, card.ability.extra.base_odds, "minty_finity_calico_flip") then
                    context.other_card.ability.calico_flipped = not context.other_card.ability.calico_flipped
                end
            end

            if context.to_area == G.hand then
                return {
                    stay_flipped = context.other_card.ability.calico_flipped
                }
            end

            if context.to_area == G.play then
                return {
                    stay_flipped = context.other_card.facing == "back"
                }
            end
        end

        --Force flipped and debuffed cards into play
        if context.modify_scoring_hand and not context.blueprint and context.other_card and (context.other_card.debuff or context.other_card.facing == "back") then
            return {
                add_to_hand = true,
            }
        end

        if context.cardarea == G.play and context.individual and context.other_card then
            local ret = {}
            if context.other_card.facing == "back" then
                ret.mult = card.ability.extra.flipped_mult
            end
            if context.other_card.debuff then
                ret.xmult = card.ability.extra.debuffed_xmult
            end
            if ret ~= {} then return ret end
        end
    end
}

if FinisherBossBlindStringMap then
    FinisherBossBlindStringMap["bl_minty_calico_counter"] = { "j_minty_finity_calico", "Calico on the Counter" }
end