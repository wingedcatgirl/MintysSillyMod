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