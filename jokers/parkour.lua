FusionJokers.fusions:add_fusion("j_shortcut", nil, false, "j_runner", "chips", true, "j_minty_parkour", 12)

SMODS.Joker {
    key = "parkour",
    name = "Parkour",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 5
    },
    soul_pos = {
        x = 1,
        y = 5
    },
    rarity = "fuse_fusion",
    cost = 12,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = true,
    demicoloncompat = true,
    config = {
        extra = {
            chips = 0,
            chipgain = 15,
            chipgain_base = 5,
            chipgain_gain = 5,
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = 'Joker', key = 'j_shortcut', config = {} }
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chipgain,
                card.ability.extra.chipgain_gain,
                localize{type = 'name_text', key = "j_shortcut", set = 'Joker'},
                localize{type = 'name_text', key = "j_runner", set = 'Joker'},
            }
        }
    end,
    calculate = function(self, card, context)
        if context.forcetrigger then
            local chipgain = card.ability.extra.chipgain
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipgain
            card.ability.extra.chipgain = card.ability.extra.chipgain + card.ability.extra.chipgain_gain
            return {
                message = localize{
                    type='variable',
                    key='a_minty_chipgain',
                    vars={chipgain}
                },
                colour = G.C.CHIPS,
                card = card,
                extra = {
                    message = localize {
                        type = 'variable',
                        key = 'a_chips',
                        vars = {card.ability.extra.chips}
                    },
                    chip_mod = card.ability.extra.chips,
                    colour = G.C.CHIPS
                }
            }
        end

        if context.before and not context.blueprint then
            if next(context.poker_hands['Straight']) then
                local chipgain = card.ability.extra.chipgain
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipgain
                card.ability.extra.chipgain = card.ability.extra.chipgain + card.ability.extra.chipgain_gain
                return {
                    message = localize{
                        type='variable',
                        key='a_minty_chipgain',
                        vars={chipgain}
                    },
                    colour = G.C.CHIPS,
                    card = card
                }
            else
                card.ability.extra.chipgain = card.ability.extra.chipgain_base
                return {
                    message = localize('k_minty_stopped'),
                    colour = G.C.CHIPS,
                    card = card
                }
            end
        end

        if context.joker_main then
            return {
                message = localize {
                    type = 'variable',
                    key = 'a_chips',
                    vars = {card.ability.extra.chips}
                },
                chip_mod = card.ability.extra.chips,
                colour = G.C.CHIPS
            }
        end
    end
}

local getstraightref = get_straight
function get_straight(hand, min_length, skip, wrap)
    skip = skip or (not not next(SMODS.find_card('j_minty_parkour')))
    return getstraightref(hand, min_length, skip, wrap)
end
-- See localization/en-us.lua to create joker text