local spectrum = false
for k,v in pairs(SMODS.PokerHands) do
	if string.find(k, "Spectrum") then
		spectrum = true
		break
	end
end

SMODS.Challenge({
	key = "backalley",
    button_colour = HEX("CA7CA7"),
	rules = {
		custom = {
			{ id = "minty_must_hand", value = "Straight Flush"},
			spectrum and { id = "minty_must_hand", value = "Straight Spectrum"} or nil,
		},
	},
	jokers = {
		{ id = "j_four_fingers", eternal = true, edition = "negative" },
		{ id = "j_shortcut", eternal = true, edition = "negative" },
		{ id = "j_smeared", eternal = true, edition = "negative" },
	},
	unlocked = function()
		return true
	end,
	calculate = function (self, context)
		if context.debuff_hand then
			local straight = false
			local specorflush = false
			for k,v in pairs(context.poker_hands) do
				if next(v or {}) and string.find(k, "Straight") then
					straight = true
				elseif next(v or {}) and (string.find(k, "Flush") or string.find(k, "Spectrum")) then
					specorflush = true
				end
				if straight and specorflush then return end
			end

			if not (straight and specorflush) then
				return {
					debuff = true,
					debuff_text = localize{type = "variable", key = "v_minty_not_permitted_hand", vars = {context.scoring_name}}
				}
			end
		end
	end
})

SMODS.Challenge({
	key = "evilbackalley",
    button_colour = HEX("CA7CA7"),
	rules = {
		custom = {
			{id = "minty_banned_hand", value = "Straight"},
			{id = "minty_banned_hand", value = "Flush"},
			spectrum and {id = "minty_banned_hand", value = "Spectrum"} or nil,
		},
	},
	jokers = {
		{ id = "j_four_fingers", eternal = true, edition = "negative" },
		{ id = "j_shortcut", eternal = true, edition = "negative" },
		{ id = "j_smeared", eternal = true, edition = "negative" },
	},
	unlocked = function()
		return G.PROFILES[G.SETTINGS.profile].challenge_progress.completed["c_minty_backalley"]
	end,
	calculate = function (self, context)
		if context.debuff_hand then
			local banned = false
			local name
			for k,v in pairs(context.poker_hands) do
				if next(v or {}) and string.find(k, "Straight") then
					banned = true
					name = localize("Straight", "poker_hands")
				elseif next(v or {}) and string.find(k, "Flush") then
					banned = true
					name = localize("Flush", "poker_hands")
				elseif next(v or {}) and string.find(k, "Spectrum") then
					banned = true
					name = localize("minty_spectrum", "poker_hands")
				end
				if banned then
					return {
						debuff = true,
						debuff_text = localize{type = "variable", key = "v_minty_forbidden_hand", vars = {name}}
					}
				end
			end
		end
	end
})