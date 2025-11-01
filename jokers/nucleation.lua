SMODS.Joker {
    key = "nucleation",
    name = "Nucleation",
    --pronouns = "",
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
    cost = 7,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = true,
    demicoloncompat = false,
    config = {
        extra = {
            chips = 50,
            count = 0
        }
    },
    in_pool = function (self, args)
        return MINTY.find_enhancement("m_minty_crystal", true)
    end,
    loc_vars = function(self, info_queue, card)
        local key = self.key
        local cryscount = MINTY.find_enhancement("m_minty_crystal", true, true)
        local total = cryscount * card.ability.extra.chips
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.extra.chips,
                total
            }
        }
    end,
    calculate = function(self, card, context)
        -- Calculation goes here
    end
}

-- See localization/en-us.lua to create joker text