SMODS.Joker {
    key = "treatovision",
    name = "Treat-o-vision",
    atlas = 'jokers',
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