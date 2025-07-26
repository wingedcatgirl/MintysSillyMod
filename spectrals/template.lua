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
	atlas = "placeholder", --TODO move spectral art to a dedicated atlas
	pos = { x = 2, y = 9 },
	--soul_pos = { x = 1, y = 0},
	use = function(self, card, area, copier)

	end,
}