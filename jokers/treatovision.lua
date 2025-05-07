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
        if MINTY.config.flavor_text then
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
            MINTY.reset_treat_card()
        end
    end
}

local issuitref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    if next(find_joker('Treat-o-vision')) then
        if (suit == "minty_3s" or suit == G.GAME.treatovision_suit) and (self.base.suit == "minty_3s" or self.base.suit == G.GAME.treatovision_suit) then
            return true
        end
    end
    return issuitref(self, suit, bypass_debuff, flush_calc)
end