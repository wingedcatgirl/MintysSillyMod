SMODS.Joker {
    key = "chocobar",
    name = "Chocolate Bar",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 4,
        y = 3
    },
    rarity = 1, -- Wanted to make this increase in rarity when eaten but the game seems to crash if rarity is a function
    cost = 4,
    unlocked = true,
    discovered = false,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = true,
    pools = {["Food"] = true},
    in_pool = function(self, args)
        if not (G.GAME and G.GAME.choccy_bars_eaten) then return true end
        if SMODS.pseudorandom_probability(self, "choccy_chance", 1, G.GAME.choccy_bars_eaten, "choccy_chance") then return true else return false end
    end,
    config = {
        extra = {
            mult = 10,
            drop = 1,
            multrate = 5,
            droprate = 1,
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
            if (pseudorandom("choccyflavor") > 0.95) then
                key = key.."2"
            end
        end
        return {
            key = key,
            vars = {
                card.ability.extra.mult,
                card.ability.extra.drop,
            }
        }
    end,
    set_ability = function(self, card, initial, delay_sprites)
        local boost = G.GAME and G.GAME.choccy_bars_eaten or 0
        card.ability.extra.mult = card.ability.extra.mult + boost*card.ability.extra.multrate
        card.ability.extra.drop = card.ability.extra.drop + boost*card.ability.extra.droprate
    end,
    calculate = function(self, card, context)
        if ((context.individual and context.cardarea == G.play) or context.forcetrigger) and card.ability.extra.mult > 0 then
            local pmult = card.ability.extra.mult
            local ret = {
                mult = pmult,
                extra = {}
            }
            if not context.blueprint then
                card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.drop
                if card.ability.extra.mult >= 0 then
                    ret.extra = {
                        message = localize {
                            type = 'variable',
                            key = 'a_mult_minus',
                            vars = {card.ability.extra.drop}
                        },
                        message_card = card
                    }
                end
            end

            return ret
        end

        if context.after and card.ability.extra.mult <= 0 then
            G.E_MANAGER:add_event(Event({ -- eat choccy bar
                func = function()
                    G.GAME.choccy_bars_eaten = (G.GAME.choccy_bars_eaten or 0) + 1
                    play_sound("tarot1")
                    card:start_dissolve()
                    SMODS.add_card { -- create wrapper
                        key = 'j_minty_wrapper',
                        edition = card.edition,
                        --stickers = card.stickers
                    }
                    return true
                end,
            }))
            return {
                message = localize("k_eaten_ex"),
                message_card = card
            }
        end
    end
}

SMODS.Joker {
    key = "wrapper",
    name = "Crumpled Wrapper",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 5,
        y = 3
    },
    rarity = 1,
    cost = 1,
    in_pool = function ()
        return false
    end,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text and (pseudorandom("wrapperflavor") > 0.95) then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
            }
        }
    end,
    calculate = function(self, card, context)
        -- Feels like this should have a cool easter egg function but haven't come up with one yet
    end
}