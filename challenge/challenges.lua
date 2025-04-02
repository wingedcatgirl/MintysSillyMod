SMODS.Rarity({
	key = "challenge",
	badge_colour = HEX("ca7ca7"),
	default_weight = 0,
})

SMODS.Challenge({
	key = "raidnight",
	rules = {
		custom = {
			{ id = "second_boss" },
			{ id = "disable_skipping" },
			{ id = "blind_scaling", value = 4},
		},
	},
	jokers = {
		{ id = "j_minty_theecho", eternal = true },
	}
})