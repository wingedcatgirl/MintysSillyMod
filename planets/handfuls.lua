SMODS.Consumable{
    set = 'Planet',
    cost = 3,
    unlocked = true,
    atlas = 'placeholder',
    key = 'rockplanet',
    name = "Rock Planets",
    effect = 'Hand Upgrade',
    config = {hand_type = 'minty_Handful', softlock = true},
    process_loc_text = function(self)
        --use another planet's loc txt instead
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key] = G.localization.descriptions[self.set][self.key] or {}
        G.localization.descriptions[self.set][self.key].text = target_text
    end,
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge("Planet???", get_type_colour(self or card.config, card), nil, 1.2)
    end,
	loc_vars = function(self, info_queue, card)
        local hand = card.ability.hand_type
		return {
			vars = {
				G.GAME.hands[hand].level,
				localize(hand, "poker_hands"),
				G.GAME.hands[hand].l_mult,
				G.GAME.hands[hand].l_chips,
				colours = {
					(
						to_big(G.GAME.hands[hand].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_number(to_big(math.min(7, G.GAME.hands[hand].level)))]
					),
				},
			},
		}
	end,
    pos = {x=2, y=9},
}

SMODS.Consumable{
    set = 'Planet',
    cost = 3,
    unlocked = true,
    atlas = 'placeholder',
    key = 'twinrockplanet',
    name = "Twin Rock Planets",
    effect = 'Hand Upgrade',
    config = {hand_type = 'minty_flush_handful', softlock = true},
    process_loc_text = function(self)
        --use another planet's loc txt instead
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key] = G.localization.descriptions[self.set][self.key] or {}
        G.localization.descriptions[self.set][self.key].text = target_text
    end,
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge("Planet???", get_type_colour(self or card.config, card), nil, 1.2)
    end,
	loc_vars = function(self, info_queue, card)
        local hand = card.ability.hand_type
		return {
			vars = {
				G.GAME.hands[hand].level,
				localize(hand, "poker_hands"),
				G.GAME.hands[hand].l_mult,
				G.GAME.hands[hand].l_chips,
				colours = {
					(
						to_big(G.GAME.hands[hand].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_number(to_big(math.min(7, G.GAME.hands[hand].level)))]
					),
				},
			},
		}
	end,
    pos = {x=2, y=9},
}

SMODS.Consumable{
    set = 'Planet',
    cost = 3,
    unlocked = true,
    atlas = 'placeholder',
    key = 'diffrockplanet',
    name = "Different Rock Planets",
    effect = 'Hand Upgrade',
    config = {hand_type = 'minty_spec_handful', softlock = true},
    process_loc_text = function(self)
        --use another planet's loc txt instead
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key] = G.localization.descriptions[self.set][self.key] or {}
        G.localization.descriptions[self.set][self.key].text = target_text
    end,
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge("Planet???", get_type_colour(self or card.config, card), nil, 1.2)
    end,
	loc_vars = function(self, info_queue, card)
        local hand = card.ability.hand_type
		return {
			vars = {
				G.GAME.hands[hand].level,
				localize(hand, "poker_hands"),
				G.GAME.hands[hand].l_mult,
				G.GAME.hands[hand].l_chips,
				colours = {
					(
						to_big(G.GAME.hands[hand].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_number(to_big(math.min(7, G.GAME.hands[hand].level)))]
					),
				},
			},
		}
	end,
    pos = {x=2, y=9},
}