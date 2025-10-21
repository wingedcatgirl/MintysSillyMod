SMODS.Consumable {
	object_type = "Consumable",
	set = "Spectral",
	name = "Ultimate Delicacy",
	key = "delicacy",
	config = {
	},
	loc_vars = function(self, info_queue, card)
		local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
		return {
			key = key,
			vars = {
            }
		}
	end,
	cost = 10,
	hidden = true,
	soul_set = 'minty_treat',
	soul_rate = 0.002,
	atlas = "spectrals",
    in_pool = function (self, args)
        return not G.GAME.minty_delicacy_consumed
    end,
	pos = { x = 3, y = 2 },
	use = function(self, card, area, copier)
        for i,v in ipairs(G.jokers.cards) do
            if not v.edition then
                v:set_edition("e_negative")
                v:juice_up(0.3,0.3)
            end
        end
        G.GAME.minty_delicacy_consumed = true
	end,
}