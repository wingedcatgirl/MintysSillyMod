SMODS.Joker {
    key = "theecho",
    name = "The Echo",
    atlas = 'mintyjokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 3,
        y = 3
    },
    rarity = "minty_challenge",
    cost = 0,
    unlocked = true,
    discovered = false,
    no_collection = true,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = false,
    config = {
        extra = {
            charges = 3,
            ante = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.extra.charges,
            }
        }
    end,
	add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + 1
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - 1
	end,
    calculate = function(self, card, context)
        if context.game_over and card.ability.extra.charges > 0 then
            if G.GAME.blind:get_type() == 'Boss' and G.GAME.round_resets.blind ~= G.P_BLINDS[G.GAME.last_chdp_blind] then --if we just lost to the second boss
                card.ability.extra.charges = card.ability.extra.charges - 1
                card.ability.extra.ante = G.GAME.round_resets.ante
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if card.ability.extra.ante == G.GAME.round_resets.ante then return false end
                        ease_ante(-1)
                        return true
                    end,
                    blocking = false,
                }))
            end
			G.E_MANAGER:add_event(Event({
				func = function()
					G.hand_text_area.blind_chips:juice_up()
					G.hand_text_area.game_chips:juice_up()
					play_sound("tarot1")
                    if card.ability.extra.charges == 0 then
                        card:start_dissolve()
                    end
					return true
				end,
			}))
            local message = localize("k_forward_ex")
            if card.ability.extra.charges == 0 then
                message = localize("k_abandon_ex")
            end
			return {
				message = message,
				saved = true,
				colour = G.C.RED,
			}
		end
    end
}