
SMODS.Joker {
    key = "lune",
    name = "Lune",
    atlas = 'mintyortalabplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 2,
        y = 0
    },
    rarity = 4,
    cost = 20,
    unlocked = false,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    pools = {["kity"] = true},
    config = {extra = {temp = 0}},
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
        }
    end,
    add_to_deck = function(self, from_debuff)
        self.added_to_deck = true
		for k, v in pairs(G.GAME.probabilities) do 
            self.config.extra.temp = v
			G.GAME.probabilities[k] = v/33
		end
    end,
    remove_from_deck = function(self, from_debuff)
        self.added_to_deck = false
		for k, v in pairs(G.GAME.probabilities) do 
			G.GAME.probabilities[k] = self.config.extra.temp
		end
    end,
    calculate = function(self, card, context)
    end
}