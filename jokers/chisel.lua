SMODS.Joker {
    key = "chisel",
    name = "Chisel",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 2,
        y = 2
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        seal = {extra = {chips = 50}},
        stone = {extra = {chips = 50}}
    },
	loc_vars = function(self, info_queue, card)
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
		-- Handle creating a tooltip with set args.
		info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
		info_queue[#info_queue + 1] = { set = "Other", key = "minty_cement_seal", specific_vars = { self.config.seal.extra.chips } }
		return {
            key = key,
        }
	end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and context.other_card.ability.name == 'Stone Card' then
            context.other_card:set_ability(G.P_CENTERS.c_base, nil, true)
            context.other_card:set_seal("minty_cement")
        end
    end
}

-- See localization/en-us.lua to create joker text