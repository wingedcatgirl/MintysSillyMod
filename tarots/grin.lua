SMODS.Consumable{
    set = 'Tarot',
    key = 'grin',
    name = "The Grin",
    atlas = 'tarots',
    pos = {
        x = 0,
        y = 0
    },
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge("Tarot?", get_type_colour(self or card.config, card), nil, 1.2)
    end,

    config = {max_highlighted = 2, mod_conv = 'randomize_rank'},

    loc_vars = function(self, info_queue, card)
		local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {self.config.max_highlighted}
        }
    end,

    use = function(self)
        local function event(config)
            local e = Event(config)
            G.E_MANAGER:add_event(e)
            return e
        end

        local ranks = {}
        for k,v in pairs(SMODS.Ranks) do
            if v.face then
                table.insert(ranks,k)
            end
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
                assert(SMODS.change_base(G.hand.highlighted[i], nil, pseudorandom_element(ranks, pseudoseed("minty_grin"))))
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

    in_pool = function()
        return true
    end
}