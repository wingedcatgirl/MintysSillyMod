SMODS.Joker {
    key = "chisel",
    name = "Chisel",
    atlas = 'jokerdoodles',
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
    demicoloncompat = false,
    config = {
        seal = {extra = {chips = 50}},
        stone = {extra = {chips = 50}}
    },
	loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
		-- Handle creating a tooltip with set args.
		info_queue[#info_queue + 1] = {
            set = "Other",
            key = "minty_stone_cards",
        }
		info_queue[#info_queue + 1] = { set = "Other", key = "minty_cement_seal", specific_vars = { self.config.seal.extra.chips } }
		return {
            key = key,
            vars = {
                localize{type = 'name_text', set = 'Other', key = "minty_stone_cards"}
            }
        }
	end,
    calculate = function(self, card, context)
        if context.before then
            for i = 1,#context.scoring_hand do
                local enh = context.scoring_hand[i].config.center.key
                if MINTY.rocks[enh] and not context.scoring_hand[i].seal then
                    context.scoring_hand[i]:set_ability(G.P_CENTERS.c_base, nil, true)
                    context.scoring_hand[i]:set_seal("minty_cement")
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            context.scoring_hand[i]:juice_up()
                            return true
                        end
                    }))
                end
            end
        end
    end
}