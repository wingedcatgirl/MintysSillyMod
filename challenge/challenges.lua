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

local wlbuncspec = next(SMODS.find_mod('Bunco')) and {id = 'whitelist_hand', value = 'Straight Spectrum', hand = 'bunc_Straight Spectrum'} or nil
local wlpapspec = next(SMODS.find_mod('paperback')) and SMODS.Mods.paperback.config.suits_enabled and {id = 'whitelist_hand', value = 'Straight Spectrum', hand = 'paperback_Straight Spectrum'} or nil
local wlspecspec = next(SMODS.find_mod('SpectrumFramework')) and {id = 'whitelist_hand', value = 'Straight Spectrum', hand = 'spectrum_Straight Spectrum'} or nil
local wlsixspec = next(SMODS.find_mod('SixSuits')) and {id = 'whitelist_hand', value = 'Straight Spectrum', hand = 'six_Straight Spectrum'} or nil
local wlspec = wlbuncspec or wlpapspec or wlspecspec or wlsixspec or nil

SMODS.Challenge({
	key = "backalley",
	rules = {
		custom = {
			{ id = "whitelist_hand", value = "Straight Flush", hand = "Straight Flush"},
			wlspec or { id = "whitelist_info" },
			wlspec and { id = "whitelist_info" },
		},
	},
	jokers = {
		{ id = "j_four_fingers", eternal = true, edition = "negative" },
		{ id = "j_shortcut", eternal = true, edition = "negative" },
		{ id = "j_smeared", eternal = true, edition = "negative" },
	}
})

local blbuncspec = next(SMODS.find_mod('Bunco')) and { id = "disable_hand_containing", value = "Spectrum", hand = "bunc_Spectrum" } or nil
local blpapspec = next(SMODS.find_mod('paperback')) and { id = "disable_hand_containing", value = "Spectrum", hand = "paperback_Spectrum" } or nil
local blspecspec = next(SMODS.find_mod('SpectrumFramework')) and { id = "disable_hand_containing", value = "Spectrum", hand = "spectrum_Spectrum" } or nil
local blsixspec = next(SMODS.find_mod('SixSuits')) and { id = "disable_hand_containing", value = "Spectrum", hand = "six_Spectrum" } or nil
local blspec = blbuncspec or blpapspec or blspecspec or blsixspec or nil

SMODS.Challenge({
	key = "evilbackalley",
	rules = {
		custom = {
			{ id = "disable_hand_containing", value = "Straight", hand = "Straight" },
			{ id = "disable_hand_containing", value = "Flush", hand = "Flush" },
			blspec
		},
	},
	jokers = {
		{ id = "j_four_fingers", eternal = true, edition = "negative" },
		{ id = "j_shortcut", eternal = true, edition = "negative" },
		{ id = "j_smeared", eternal = true, edition = "negative" },
	}
})