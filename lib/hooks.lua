local issuitref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    if next(find_joker('Treat-o-vision')) then
        if (suit == "minty_3s" or suit == G.GAME.treatovision_suit) and (self.base.suit == "minty_3s" or self.base.suit == G.GAME.treatovision_suit) then
            return true
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