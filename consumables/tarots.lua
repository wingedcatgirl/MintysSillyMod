SMODS.Consumable{ -- The Cat
    set = 'Tarot',
    key = 'cat',
    atlas = 'mintytarot',
    pos = {
        x = 0,
        y = 0
    },
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge("Tarot?", get_type_colour(self or card.config, card), nil, 1.2)
    end,

    config = {max_highlighted = 3, suit_conv = 'minty_3s'},

    loc_vars = function(self)
		local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {self.config.max_highlighted}
        }
    end,

    use = function(self)
        if not exotic_in_pool() then enable_exotics() end

        local function event(config)
            local e = Event(config)
            G.E_MANAGER:add_event(e)
            return e
        end

        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end })
        end
        delay(0.2)
        for i=1, #G.hand.highlighted do
            event({trigger = 'after', delay = 0.1, func = function()
                G.hand.highlighted[i]:change_suit(self.config.suit_conv);
            return true end })
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + ( i - 0.999 ) / ( #G.hand.highlighted - 0.998 ) * 0.3
            event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip(); play_sound('tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end })
        end
        event({trigger = 'after', delay = 0.2, func = function()
            G.hand:unhighlight_all();
        return true end })
        delay(0.5)
    end,

    in_pool = true
}

SMODS.Consumable{ -- The Bored Child
    set = 'Tarot',
    key = 'boredkid',
    atlas = 'mintytarot',
    pos = {
        x = 1,
        y = 0
    },
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge("Tarot?", get_type_colour(self or card.config, card), nil, 1.2)
    end,

    config = {max_highlighted = 1, enh_conv = 'm_minty_marble'},

    loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_minty_marble
		local key = self.key
        local plural = false
        if self.config.max_highlighted ~= 1 then plural = true end
        local s = plural and "s" or ""
        local a = plural and "" or "a "
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                self.config.max_highlighted,
                s,
                a,
            }
        }
    end,

    use = function(self)
        local function event(config)
            local e = Event(config)
            G.E_MANAGER:add_event(e)
            return e
        end

        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end })
        end
        delay(0.2)
        for i=1, #G.hand.highlighted do
            event({trigger = 'after', delay = 0.1, func = function()
                G.hand.highlighted[i]:set_ability(G.P_CENTERS.m_minty_marble, nil, true);
            return true end })
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + ( i - 0.999 ) / ( #G.hand.highlighted - 0.998 ) * 0.3
            event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip(); play_sound('tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end })
        end
        event({trigger = 'after', delay = 0.2, func = function()
            G.hand:unhighlight_all();
        return true end })
        delay(0.5)
    end,

    in_pool = true
}

--[[SMODS.Consumable{ -- The Geologist
    set = 'Tarot', atlas = 'mintyplaceholder',
    key = 'geologist',
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge("Tarot?", get_type_colour(self or card.config, card), nil, 1.2)
    end,

    config = {max_highlighted = 3},
    pos = {
        x = 0,
        y = 9
    },
    soul_pos = {
        x = 1,
        y = 0
    },

    loc_vars = function(self)
		local key = self.key
        local plural = false
        if self.config.max_highlighted ~= 1 then plural = true end
        local s = plural and "s" or ""
        local a = plural and "" or "a "
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                self.config.max_highlighted,
                s,
                a,
            }
        }
    end,

    use = function(self)
        local function event(config)
            local e = Event(config)
            G.E_MANAGER:add_event(e)
            return e
        end

        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end })
        end
        delay(0.2)
        for i=1, #G.hand.highlighted do
            event({trigger = 'after', delay = 0.1, func = function()
                G.hand.highlighted[i]:set_ability(G.P_CENTERS.m_minty_marble, nil, true);
            return true end })
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + ( i - 0.999 ) / ( #G.hand.highlighted - 0.998 ) * 0.3
            event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip(); play_sound('tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end })
        end
        event({trigger = 'after', delay = 0.2, func = function()
            G.hand:unhighlight_all();
        return true end })
        delay(0.5)
    end,

    in_pool = true
}--]]