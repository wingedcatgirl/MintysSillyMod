if not SMODS.find_mod("ChDp")[1] then
    return nil
end

SMODS.Challenge({
	key = "raidnight",
    button_colour = HEX("CA7CA7"),
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
		{ id = "j_minty_theecho", eternal = true, singular = true, edition = "negative" },
	},
	consumeables = {
		{ id = "c_devil" },
		{ id = "c_devil" },
	},
	unlocked = function()
		return true
	end
})

SMODS.Challenge({
	key = "raidnightsavage",
    button_colour = HEX("CA7CA7"),
	rules = {
		custom = {
			{ id = "second_boss" },
			{ id = "disable_skipping" },
			{ id = "blind_scaling", value = 5},
		},
	},
	jokers = {
		{ id = "j_minty_theecho", eternal = true, singular = true },
	},
	unlocked = function()
		return G.PROFILES[G.SETTINGS.profile].challenge_progress.completed["c_minty_raidnight"]
	end
})