SMODS.Joker {
    key = "newjoker",
    name = "New Joker",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {extra = {mult = 5}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.mult}
        }
    end,
    calculate = function(self, card, context)
        -- Calculation goes here
    end
}

-- See localization/en-us.lua to create joker text