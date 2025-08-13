SMODS.Consumable {
	object_type = "Consumable",
	set = "Tarot",
	name = "The Bitz",
	key = "bitz",
	effect = "Random Joker",
	config = {},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Other", key = "normal_jokers", specific_vars = { } }
		local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
		return {
			key = key,
		}
	end,
	cost = 4,
	atlas = "tarots",
	pos = { x = 2, y = 0 },
	can_use = function(self, card)
		if #G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers then
			return true
		else
			return false
		end
	end,
    in_pool = function (self, args) --Make this artificially rarer until we have more kity jokers for it to summon
        if pseudorandom("bitzchance") > 1/3 then return false end
        return true
    end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
			play_sound('timpani')
			local card = SMODS.add_card({
				set = "kity",
				area = G.jokers,
				key_append = "minty_bitz",
			})
			return true end }))
		delay(0.6)
	end,
}