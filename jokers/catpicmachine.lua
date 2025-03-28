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
    in_pool = function()
        if not G.GAME or (#G.GAME.tags == 0) then return false end
        for meow = 1, #G.GAME.tags do
            if G.GAME.tags[meow].key == "tag_cry_cat" then
                return true
            end
        end
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand and #G.GAME.tags ~= 0 then
            --mintySay("score time", "TRACE")
            local result = {}
            local l1, l2, l3, l4, l5, lwhat = 0, 0, 0, 0, 0, 0
            --count cat tags and their level
            for meow = 1, #G.GAME.tags do
                --mintySay("Tag #"..meow..":"..G.GAME.tags[meow].key, "TRACE")
                if G.GAME.tags[meow].key == "tag_cry_cat" then
                    --mintySay("kity found :3", "TRACE")
                    local level = G.GAME.tags[meow].ability.level or 1
                    if level == 1 then l1 = l1 + 1
                    elseif level == 2 or level == 3 then l2 = l2 + 1
                    elseif level == 4 or level == 5 then l3 = l3 + 1
                    elseif level == 6 or level == 7 then l4 = l4 + 1
                    elseif level == 8 or level == 9 then l5 = l5 + 1
                    elseif level >= 10 then
                        l5 = l5 + 1
                        lwhat = lwhat + (2^(level-10)) -- l5 == 2^0 == 1, l6 == 2^1 == 2, l7 == 2^2 == 4, etc
                    end
                end
            end
            local levels = {l1, l2, l3, l4, l5}
            local keys = {"mult", "xmult", "emult", "eemult", "eeemult"}
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