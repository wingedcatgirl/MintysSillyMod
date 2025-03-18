SMODS.Joker {
    key = "catpicmachine",
    name = "ilo pi sitelen soweli",
    atlas = 'mintyjokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 2,
        y = 3
    },
    rarity = 2,
    cost = 11,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            number = 3,
            reps = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {card.ability.extra.number}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand and #G.GAME.tags ~= 0 then
            --mintySay("score time", "TRACE")
            local result = {}
            local l1, l2, l3, l4, lwhat = 0, 0, 0, 0, 0
            --count cat tags and their level
            for meow = 1, #G.GAME.tags do
                --mintySay("Tag #"..meow..":"..G.GAME.tags[meow].key, "TRACE")
                if G.GAME.tags[meow].key == "tag_cry_cat" then
                    --mintySay("kity found :3", "TRACE")
                    local level = G.GAME.tags[meow].ability.level or 1
                    if level == 1 then l1 = l1 + 1
                    elseif level == 2 then l2 = l2 + 1
                    elseif level == 3 then l3 = l3 + 1
                    elseif level == 4 then l4 = l4 + 1
                    elseif level >= 5 then
                        l4 = l4 + 1
                        lwhat = lwhat + (2^(level-5)) -- l5 == 2^0 == 1, l6 == 2^1 == 2, l7 == 2^2 == 4, etc
                    end
                end
            end
            local levels = {l1, l2, l3, l4}
            local keys = {"mult", "emult", "eemult", "eeemult"}
            for i, level in ipairs(levels) do
                if level ~= 0 then
                    result[keys[i]] = card.ability.extra.number * level
                end
            end
            card.ability.extra.reps = lwhat

            return result
        end

        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card == card and card.ability.extra.reps >= 1 then
            local reps = card.ability.extra.reps
            card.ability.extra.reps = 0
            return {
                repetitions = reps,
                card = card,
            }
        end
    end
}