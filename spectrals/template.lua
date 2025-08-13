SMODS.Consumable {
	object_type = "Consumable",
	set = "Spectral",
	name = "SPECTRAL",
	key = "SPECTRAL",
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
	cost = 4,
	atlas = "spectrals",
	pos = { x = 3, y = 2 },
	use = function(self, card, area, copier)

	end,
}