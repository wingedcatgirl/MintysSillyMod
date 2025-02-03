SMODS.Joker {
    key = "bucket",
    name = "Bucket of Cement",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 3,
        y = 2
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {},
	loc_vars = function(self, info_queue, card)
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
		info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
		return {
            key = key,
        }
	end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            context.other_card:set_ability(G.P_CENTERS.m_stone, nil, true)
        end
    end
}

-- See localization/en-us.lua to create joker text