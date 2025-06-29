SMODS.Joker {
    key = "newjoker",
    name = "New Joker",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    rarity = 2,
    cost = 5,
    pools = {
        ["Food"] = true,
    },
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = false,
    config = {
        extra = {
            basepct = 35,
            percent = 35,
            fallpct = 5,
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.extra.percent,
                card.ability.extra.fallpct,
            }
        }
    end,
    calculate = function(self, card, context)
        local final_chips = to_big((G.GAME.blind.chips / 100) * (100 - card.ability.extra.percent))
        if (context.setting_blind or context.forcetrigger) and not context.blueprint then
            G.E_MANAGER:add_event(Event({trigger = 'after', blocking = true, func = function()
                play_sound('minty_swordnoise', 1)
                G.GAME.blind.chips = final_chips
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                return true
            end}))

            card.ability.extra.percent = card.ability.extra.percent - card.ability.extra.fallpct

            return {
                    message = localize("k_again_ex"),
                    message_card = card,
            }
        end
    end
}

-- See localization/en-us.lua to create joker text