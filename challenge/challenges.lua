SMODS.Rarity({
	key = "challenge",
	badge_colour = HEX("ca7ca7"),
	default_weight = 0,
})

SMODS.Challenge({
	key = "raidnight",
	rules = {
		modifiers = {
			{ id = "dollars", value = 6},
			{ id = "hands", value = 5},
			{ id = "discards", value = 4},
			{ id = "hand_size", value = 9},
		},
		custom = {
			{ id = "second_boss" },
			{ id = "disable_skipping" },
			{ id = "blind_scaling", value = 4},
		},
	},
	jokers = {
		{ id = "j_minty_theecho", eternal = true, edition = "negative" },
	},
	consumeables = {
		{ id = "c_devil" },
		{ id = "c_devil" },
	}
})

SMODS.Challenge({
	key = "raidnightsavage",
	rules = {
		custom = {
			{ id = "second_boss" },
			{ id = "disable_skipping" },
			{ id = "blind_scaling", value = 5},
		},
	},
	jokers = {
		{ id = "j_minty_theecho", eternal = true },
	}
})