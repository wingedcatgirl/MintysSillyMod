
SMODS.Joker {
    key = "lucky",
    name = "Lucky",
    atlas = 'mintylegends',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 0,
        y = 1
    },
    rarity = 4,
    cost = 20,
    unlocked = false,
    unlock_condition = {type = '', extra = '', hidden = true},
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    config = {extra = {temp = 0, kity = true}},
    loc_txt = {
        name = "Lucky",
        text = {"Multiplies all {C:attention}listed",
                "{C:green,E:1,S:1.1}probabilities{} by {C:mult}33{}",
                "{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}33 in 3{C:inactive})"},
        unlock = {"Find this Joker",
                  "from the {C:spectral}Soul{} card"}
    },
    add_to_deck = function(self, from_debuff)
        self.added_to_deck = true
		for k, v in pairs(G.GAME.probabilities) do 
            self.config.extra.temp = v
			G.GAME.probabilities.normal = v*33
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