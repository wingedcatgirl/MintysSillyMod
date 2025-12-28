local issuitref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    if next(find_joker('Treat-o-vision')) then
        if (suit == "minty_3s" or suit == G.GAME.treatovision_suit) and (self.base.suit == "minty_3s" or self.base.suit == G.GAME.treatovision_suit) then
            suit = self.base.suit
        end
    end
    return issuitref(self, suit, bypass_debuff, flush_calc)
end

local isfaceref = Card.is_face
function Card:is_face(from_boss)
    if self.debuff and not from_boss then return end
    if next(find_joker("Prosopagnosia")) and not next(find_joker("Pareidolia")) then
        return false
    end
	return isfaceref(self, from_boss)
end

---Slapdash patch for #CA7CA7 stake name; replaces "<hash>" with "#"
local oldparser = loc_parse_string
loc_parse_string = function (line)
    local parsed = oldparser(line)
    if parsed then
        for _, segment in ipairs(parsed) do
            for i, part in ipairs(segment.strings) do
                if type(part) == "string" then
                    segment.strings[i] = part:gsub("<hash>", "#")
                end
            end
        end
    end
    return parsed
end

local showman = SMODS.showman
SMODS.showman = function (key)
    if G.GAME.modifiers["minty_infinite_"..key] then return true end
    return showman(key)
end



local cube_forbidden = false
local blackjack_forbidden = false
local debuff_hand_ref = Blind.debuff_hand

function Blind:debuff_hand(cards, hand, handname, check)
	if next(SMODS.find_card('j_minty_cube')) then
		if #cards ~= 4 then
			cube_forbidden = true
            return true
		end
		cube_forbidden = false
	end
    if G.GAME.modifiers.minty_blackjack then
        G.GAME.minty_blackjack_count = G.GAME.minty_blackjack_count or 0
        local _,_,_,scoring_hand = G.FUNCS.get_poker_hand_info(cards)
        local target, total, aces = G.GAME.modifiers.minty_blackjack, 0, 0
        for _, card in ipairs(scoring_hand) do
            total = total + (card:is_face() and 10 or card.base.nominal)
            if card.base.value == "Ace" then
                aces = aces + 1
            end
        end
        while (total > target) and (aces > 0) do
            total = total - 10
            aces = aces - 1
        end
        G.GAME.minty_blackjack_count = total
        if total ~= target then blackjack_forbidden = true; return true else blackjack_forbidden = false end
    end
	return debuff_hand_ref(self, cards, hand, handname, check)
end

local get_loc_debuff_textref = Blind.get_loc_debuff_text
function Blind:get_loc_debuff_text()
	if cube_forbidden then
        if (G.GAME.blind.config.blind.debuff ~= {}) and (G.GAME.blind.config.blind.debuff.h_size_ge and G.GAME.blind.config.blind.debuff.h_size_ge >= 5) or (G.GAME.blind.config.blind.debuff.h_size_le and G.GAME.blind.config.blind.debuff.h_size_le <= 3) then
		    return localize("k_minty_psycube")
        end
		return localize("k_minty_cube")
	end
    if blackjack_forbidden then
        return localize{type = "variable", key = "v_minty_blackjack", vars = {G.GAME.modifiers.minty_blackjack, G.GAME.minty_blackjack_count}}
    end
	return get_loc_debuff_textref(self)
end