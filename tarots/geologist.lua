SMODS.Consumable{
    set = 'Tarot', atlas = 'tarots',
    key = 'geologist',
    name = "The Geologist",
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge("Tarot?", get_type_colour(self or card.config, card), nil, 1.2)
    end,

    config = {max_highlighted = 3},
    pos = {
        x = 0,
        y = 1
    },

    loc_vars = function (self, info_queue, card)
		info_queue[#info_queue + 1] = {
            set = "Other",
            key = "minty_stone_cards",
        }
        key = self.key
        local plural = false
        if card.ability.max_highlighted ~= 1 then plural = true end
        local s = plural and "s" or ""
        local a = plural and "" or "a "
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                self.config.max_highlighted,
                s,
                a,
                localize{type = 'name_text', set = 'Other', key = "minty_stone_cards"}
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
            local _, enh = pseudorandom_element(MINTY.rocks, pseudoseed("minty_geologist"))
            event({trigger = 'after', delay = 0.1, func = function()
                G.hand.highlighted[i]:set_ability(G.P_CENTERS[enh], nil, true);
            return true end })
        end
        delay(0.2)
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

    in_pool = function ()
        return true
    end
}