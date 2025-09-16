SMODS.Joker {
    key = "bigpockets",
    name = "Big Pockets",
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
    cost = 6,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = false,
    config = {
        extra = {
            capacity = 3
        },
        immutable = {
            capacity_change = 0
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
                card.ability.extra.capacity
            }
        }
    end,
    add_to_deck = function (self, card, from_debuff)
        MINTY.event(
            function ()
                card.ability.immutable.capacity_change = card.ability.extra.capacity
                G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.immutable.capacity_change
                return true
            end
        )
    end,
    remove_from_deck = function (self, card, from_debuff)
        MINTY.event(
            function ()
                G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.immutable.capacity_change
                card.ability.immutable.capacity_change = 0
                return true
            end
        )
    end,
    calculate = function(self, card, context)
        -- Calculation goes here
    end
}

-- See localization/en-us.lua to create joker text