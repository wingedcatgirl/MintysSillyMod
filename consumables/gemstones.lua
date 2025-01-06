SMODS.Atlas {
    key = 'mintygemcards',
    path = "gemstones.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'mintygemslots',
    path = "gemstickers.png",
    px = 71,
    py = 95
}


SMODS.Consumable{
    object_type = "Consumable",
    set = "Gemstone",
    name = "gem-Cat's Eye",
    key = "catseye",
    atlas = "mintygemcards",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 1 },
    cost = 3,
    should_apply = false,
    discovered = true,
    order = 1,
    config = {
        max_highlighted = 1,
        sticker_id = "gemslot_catseye"
    },

    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = { key = self.config.sticker_id, set = "Other", }
        return { vars = { self.config.max_highlighted } }
    end,

    can_use = function(self, card) 
        return 
        #G.hand.highlighted == self.config.max_highlighted
        and
        get_gemslot(G.hand.highlighted[1]) ~= nil 
    end,
    use = function(self, card, area, copier) use_gemstone_consumeable(self, card, area, copier, true) end,
}

SMODS.Sticker{
    key = "gemslot_catseye",
    badge_colour = HEX("e3394f"),
    prefix_config = { key = false },
    rate = 0.0,
    atlas = "mintygemslots",
    pos = { x = 0, y = 0 },
    config = {  },

    loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end,
	draw = function(self, card) --don't draw shine
		G.shared_stickers[self.key].role.draw_major = card
		G.shared_stickers[self.key]:draw_shader("dissolve", nil, nil, nil, card.children.center)
	end
}