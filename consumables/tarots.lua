SMODS.Consumable{ -- The Cat
    set = 'Tarot', atlas = 'mintyjokerplaceholder',
    key = 'cat', 
    loc_txt = 
        {
            ['en-us'] = {
                ['name'] = 'The Cat',
                ['text'] = {
                    [1] = 'Converts up to',
                    [2] = '{C:attention}#1#{} selected cards',
                    [3] = 'to {C:minty_3s}3s{}',
                }
            },
        },
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge("Tarot?", get_type_colour(self or card.config, card), nil, 1.2)
    end,

    config = {max_highlighted = 3, suit_conv = 'minty_3s'},
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 3,
        y = 0
    },

    loc_vars = function(self) return {vars = {self.config.max_highlighted}} end,

    use = function(self)
        enable_exotics()

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