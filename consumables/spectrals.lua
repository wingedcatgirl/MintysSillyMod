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
	loc_vars = function(self, info_queue, card)
		local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
		-- Handle creating a tooltip with set args.
		info_queue[#info_queue + 1] =
			{ set = "Other", key = "minty_cement_seal", specific_vars = { self.config.seal.extra.chips } }
		return { 
			key = key,
			vars = { card.ability.max_highlighted } 
		}
	end,
	cost = 4,
	atlas = "mintyjokerplaceholder",
	pos = { x = 2, y = 9 },
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

SMODS.Consumable {
	object_type = "Consumable",
	set = "Spectral",
	name = "The Wand",
	key = "wand",
	effect = "Unlocker",
	config = {},
	loc_vars = function(self, info_queue, card)
		local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
		return { 
			key = key,
		}
	end,
	cost = 4,
	hidden = true,
	soul_set = 'Tarot',
	soul_rate = 0.003,
	atlas = "mintyjokerplaceholder",
	pos = { x = 2, y = 9 },
	can_use = function(self, card)
		if #G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers then
			return true
		else
			return false
		end
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
			play_sound('timpani')
			local card = create_card(
				"kity",
				G.jokers,
				nil,
				nil,
				nil,
				nil,
				nil,
				"minty_wand"
			)
			card:add_to_deck()
			G.jokers:emplace(card)
			return true end }))
		delay(0.6)
	end,
}