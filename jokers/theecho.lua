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
    calculate = function(self, card, context)
        if context.game_over and card.ability.extra.charges > 0 then
            if G.GAME.blind:get_type() == 'Boss' and G.GAME.round_resets.blind ~= G.P_BLINDS[G.GAME.last_chdp_blind] then --if we just lost to the second boss
                card.ability.extra.charges = card.ability.extra.charges - 1
                card.ability.extra.ante = G.GAME.round_resets.ante
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if (card.ability.extra.ante == G.GAME.round_resets.ante) and (G.GAME.round_resets.ante ~= G.GAME.win_ante) then return false end
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
            local message = "k_forward_ex"
            if card.ability.extra.charges == 0 then
                message = "k_abandon_ex"
            end
			return {
				message = localize("k_wiped_ex"),
				saved = message,
				colour = G.C.RED,
			}
		end
        if context.end_of_round and not context.game_over and G.GAME.blind:get_type() == 'Boss' and (G.GAME.round_resets.ante >= G.GAME.win_ante) and context.cardarea == G.jokers then
			G.E_MANAGER:add_event(Event({
				func = function()
					G.hand_text_area.blind_chips:juice_up()
					G.hand_text_area.game_chips:juice_up()
					play_sound("tarot1")
                    card:start_dissolve()
					return true
				end,
			}))
			return {
				message = localize("k_victory_ex"),
				colour = G.C.RED,
                card = card,
			}
        end
    end
}