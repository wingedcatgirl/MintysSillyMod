
SMODS.PokerHandPart{ -- Spectrum base (Referenced from SixSuits)
    key = 'spectrum',
    func = function(hand)
        local suits = {}
        for _, v in ipairs(SMODS.Suit.obj_buffer) do
            suits[v] = 0
        end
        if #hand < 5 then return {} end
        for i = 1, #hand do
            if hand[i].ability.name ~= 'Wild Card' then
                for k, v in pairs(suits) do
                    if hand[i]:is_suit(k, nil, true) and v == 0 then
                        suits[k] = v + 1; break
                    end
                end
            end
        end
        for i = 1, #hand do
            if hand[i].ability.name == 'Wild Card' then
                for k, v in pairs(suits) do
                    if hand[i]:is_suit(k, nil, true) and v == 0 then
                        suits[k] = v + 1; break
                    end
                end
            end
        end
        local num_suits = 0
        for _, v in pairs(suits) do
            if v > 0 then num_suits = num_suits + 1 end
        end
        return (num_suits >= 5) and {hand} or {}
    end
}

SMODS.PokerHand{ -- Spectrum (Referenced from SixSuits)
    key = 'Spectrum',
    visible = false,
    chips = 50,
    mult = 6,
    l_chips = 25,
    l_mult = 3,
    example = {
        { 'S_2',    true },
        { 'D_7',    true },
        { 'C_3', true },
        { 'Minty_THREE_5', true },
        { 'D_K',    true },
    },
    loc_txt = loc.spectrum,
    evaluate = function(parts)
        return parts.Minty_spectrum
    end
}

SMODS.PokerHand{ -- Straight Spectrum (Referenced from SixSuits)
    key = 'Straight Spectrum',
    visible = false,
    chips = 120,
    mult = 10,
    l_chips = 35,
    l_mult = 5,
    example = {
        { 'S_Q',    true },
        { 'Minty_THREE_J', true },
        { 'C_T',    true },
        { 'D_9', true },
        { 'H_8',    true }
    },
    loc_txt = loc.straight_spectrum,
    process_loc_text = function(self)
        SMODS.PokerHand.process_loc_text(self)
        SMODS.process_loc_text(G.localization.misc.poker_hands, self.key..'_2', self.loc_txt, 'extra')
    end,
    evaluate = function(parts)
        if not next(parts.Minty_spectrum) or not next(parts._straight) then return {} end
        return { SMODS.merge_lists (parts.Minty_spectrum, parts._straight) }
    end,
    modify_display_text = function(self, _cards, scoring_hand)
        local royal = true
		for j = 1, #scoring_hand do
			local rank = SMODS.Ranks[scoring_hand[j].base.value]
			royal = royal and (rank.key == 'Ace' or rank.key == '10' or rank.face)
		end
		if royal then
			return self.key..'_2'
		end
    end
}

SMODS.PokerHand{ -- Spectrum House (Referenced from SixSuits)
    key = 'Spectrum House',
    above_hand = 'Flush House',
    visible = false,
    chips = 150,
    mult = 15,
    l_chips = 50,
    l_mult = 5,
    example = {
        { 'S_Q',    true },
        { 'Minty_THREE_Q', true },
        { 'C_Q',    true },
        { 'D_8',    true },
        { 'H_8',    true }
    },
    loc_txt = loc.spectrum_house,
    evaluate = function(parts)
        if #parts._3 < 1 or #parts._2 < 2 or not next(parts.Minty_spectrum) then return {} end
        return {SMODS.merge_lists (parts._all_pairs, parts.Minty_spectrum)}
    end
}

SMODS.PokerHand{ -- Spectrum Five (Referenced from SixSuits)
    key = 'Spectrum Five',
    above_hand = 'Flush Five',
    visible = false,
    chips = 180,
    mult = 18,
    l_chips = 60,
    l_mult = 5,
    example = {
        { 'S_7',    true },
        { 'D_7', true },
        { 'Minty_THREE_7',    true },
        { 'H_7',    true },
        { 'C_7',    true }
    },
    loc_txt = loc.spectrum_five,
    evaluate = function(parts)
        if not next(parts._5) or not next(parts.Minty_spectrum) then return {} end
        return {SMODS.merge_lists (parts._5, parts.Minty_spectrum)}
    end
}