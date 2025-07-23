SMODS.Consumable {
	object_type = "Consumable",
	set = "Spectral",
	name = "Dekaja",
	key = "dekaja",
	effect = "Dispel",
	config = {},
	loc_vars = function(self, info_queue, card)
		local key = self.key
        if MINTY.config.flavor_text then
            --key = self.key.."_flavor"
        end
		return {
			key = key,
		}
	end,
	cost = 4,
	hidden = true,
	soul_set = 'Tarot',
	soul_rate = 0.003,
	atlas = "placeholder",
	pos = { x = 2, y = 9 },
	soul_pos = { x = 2, y = 8},
	can_use = function(self, card)
        local total = (#G.jokers.highlighted + #G.hand.highlighted)
        return total <= self.config.max_highlighted and total ~= 0
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		local count1 = 0
		local count2 = 0
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("tarot1")
				used_consumable:juice_up(0.3, 0.5)
				return true
			end,
		}))
		if #G.hand.highlighted > 0 then
			for i = 1, #G.hand.highlighted do
				count1 = count1 + 1
				local percent = 1.15 - (i - 0.999) / (count1 - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("card1", percent)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		end
		if #G.jokers.highlighted > 0 then
			for i = 1, #G.jokers.highlighted do
				count1 = count1 + 1
				local percent = 1.15 - (i - 0.999) / (count1 - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.jokers.highlighted[i]:flip()
						play_sound("card1", percent)
						G.jokers.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		end
		delay(0.2)
		if G.hand.highlighted > 0 then
			for i = 1, #G.hand.highlighted do
				count2 = count2 + 1
				local CARD = G.hand.highlighted[i]
				local percent = 0.85 + (i - 0.999) / (#count2 - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						CARD:flip()
						CARD:set_ability(G.P_CENTERS.c_base, true, nil)
						CARD:set_edition(nil, true)
						CARD:set_seal(nil, true)
						play_sound("tarot2", percent)
						CARD:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		end
		if G.jokers.highlighted > 0 then
			for i = 1, #G.jokers.highlighted do
				count2 = count2 + 1
				local CARD = G.jokers.highlighted[i]
				local percent = 0.85 + (i - 0.999) / (#count2 - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						CARD:flip()
						CARD:set_edition(nil, true)
						play_sound("tarot2", percent)
						CARD:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		end

	end,
}