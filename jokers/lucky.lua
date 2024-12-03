
SMODS.Joker {
    key = "lucky",
    name = "Lucky",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 8
    },
    soul_pos = {
        x = 1,
        y = 8
    },
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    config = {extra = {temp = 0, kity = 1}},
    loc_txt = {
        name = "Lucky",
        text = {"Multiplies all {C:attention}listed",
                "{C:green,E:1,S:1.1}probabilities{} by {C:mult}33{}",
                "{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}33 in 3{C:inactive})",
                "{C:inactive}(Still functionally{}",
                "{C:inactive}capped at 100%, though.){}"}
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