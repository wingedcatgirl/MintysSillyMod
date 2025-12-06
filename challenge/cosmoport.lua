if not (SMODS.Mods["ChDp"] or {}).can_load then
    return nil
end

SMODS.Challenge({
	key = "cosmoport",
    button_colour = HEX("CA7CA7"),
	rules = {
		custom = {
			{ id = "blackjack", value = 21 },
			{ id = 'no_reward' },
			{ id = 'no_extra_hand_money' },
		},
	},
	jokers = {
		{ id = "j_to_the_moon" },
		{ id = "j_rocket" },
		{ id = "j_lusty_joker" },
	},
	consumeables = {
		{ id = "c_sun" },
	},
	unlocked = function()
		return true
	end
})