SMODS.Challenge({
	key = "cosmoport",
    button_colour = HEX("CA7CA7"),
	rules = {
		custom = {
			{ id = "minty_blackjack", value = 21 },
			{ id = "minty_blackjack2" },
			{ id = 'no_reward' },
			{ id = 'no_extra_hand_money' },
		}
	},
	jokers = {
		{ id = "j_to_the_moon" },
		{ id = "j_rocket" },
		{ id = "j_lusty_joker" },
	},
	consumeables = {
		{ id = "c_sun" },
	},
	apply = function (self)
		G.GAME.modifiers.minty_blackjack = 21
	end,
	unlocked = function()
		return true
	end
})