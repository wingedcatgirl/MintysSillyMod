SMODS.Consumable {
	object_type = "Consumable",
	set = "Spectral",
	name = "6 Years",
	key = "6years",
	config = {
		mod_conv = "minty_cement_seal",
		max_highlighted = 1,
        seal = {extra = {chips = 50}},
	},
	loc_vars = function(self, info_queue, center)
		-- Handle creating a tooltip with set args.
		info_queue[#info_queue + 1] =
			{ set = "Other", key = "minty_cement_seal", specific_vars = { self.config.seal.extra.chips } }
		return { vars = { center.ability.max_highlighted } }
	end,
    loc_txt = {
        name = "6 years",
        text = {"Add a {C:cement}Cement Seal{}",
                "to {C:attention}1{} selected",
                "card in your hand"}
    },
	cost = 4,
	atlas = "mintyjokerplaceholder",
	pos = { x = 0, y = 4 },
	use = function(self, card, area, copier) --Good enough
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("minty_cement")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}
