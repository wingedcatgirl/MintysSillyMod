SMODS.Challenge({
	key = "cosmoport",
    button_colour = HEX("CA7CA7"),
	blackjack = 21,
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
	calculate = function (self, context)
		if context.debuff_hand then
			local target, total, aces = self.blackjack, 0, 0
			for _, card in ipairs(context.scoring_hand) do
				total = total + (card:is_face() and 10 or card.base.nominal)
				if card.base.value == "Ace" then
					aces = aces + 1
				end
			end
			while (total > target) and (aces > 0) do
				total = total - 10
				aces = aces - 1
			end
			if total ~= target then
				return {
					debuff = true,
					debuff_text = localize{type = "variable", key = "v_minty_blackjack", vars = {self.blackjack, total}},
				}
			end
		end
	end,
	unlocked = function()
		return true
	end
})