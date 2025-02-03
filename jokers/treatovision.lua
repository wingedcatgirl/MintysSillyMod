SMODS.Joker {
    key = "treatovision",
    name = "Treat-o-vision",
    atlas = 'mintyjokeratlas',
    pos = {
        x = 0,
        y = 0
    },
    rarity = 2,
    cost = 8,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {extra = {}},
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
				localize(
					G.GAME.treatovision_suit or "Spades",
					"suits_singular"
				),
				colours = {
					G.C.SUITS[G.GAME.treatovision_suit or "Spades"],
				},
				localize(
					"minty_3s",
					"suits_singular"
				),
			},
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
            reset_treat_card()
        end        
    end
}

function reset_treat_card()
    G.GAME.treatovision_suit = 'Spades'
    local valid_treat_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if v.ability.effect ~= 'Stone Card' and v.base.suit ~= 'minty_3s' then
            valid_treat_cards[#valid_treat_cards+1] = v
        end
    end
    if valid_treat_cards[1] then 
        local treat_card = pseudorandom_element(valid_treat_cards, pseudoseed('treat'..G.GAME.round_resets.ante))
        G.GAME.treatovision_suit = treat_card.base.suit
    end
    --sendDebugMessage('[Minty] Treat-o-vision suit reset to '..G.GAME.treatovision_suit)
end

local issuitref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    if next(find_joker('Treat-o-vision')) then
        if (suit == "minty_3s" or suit == G.GAME.treatovision_suit) and (self.base.suit == "minty_3s" or self.base.suit == G.GAME.treatovision_suit) then
            return true
        end
    end
    if self.base.suit ~= "spectrum_fakewild" and not SMODS.has_any_suit(self) and (suit == "minty_3s" or self.base.suit == "minty_3s") then
        if suit == "minty_3s" and not self:is_3() then
            return false
        end
        if suit ~= "minty_3s" and self.base.suit == "minty_3s" then
            return false
        end
    end
    return issuitref(self, suit, bypass_debuff, flush_calc)
end