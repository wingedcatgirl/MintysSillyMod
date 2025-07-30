SMODS.Consumable {
	object_type = "Consumable",
	set = "Spectral",
	name = "The Wand",
	key = "wand",
	effect = "Unlocker",
	config = {},
	loc_vars = function(self, info_queue, card)
		local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
		return {
			key = key,
		}
	end,
	cost = 4,
	hidden = true,
	soul_set = 'Tarot',
	soul_rate = 0.0015, --Half the Soul's rate cause we don't want to flood the pool with these things
	atlas = "placeholder",
	pos = { x = 2, y = 9 },
	soul_pos = { x = 2, y = 8},
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
			local card = SMODS.add_card({
				set = "kity",
				area = G.jokers,
				legendary = true,
				key_append = "minty_wand",
			})
			return true end }))
		delay(0.6)
	end,
}