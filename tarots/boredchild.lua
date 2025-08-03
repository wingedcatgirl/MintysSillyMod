SMODS.Consumable{
    set = 'Tarot',
    key = 'boredkid',
    name = "The Bored Child",
    atlas = 'tarots',
    pos = {
        x = 1,
        y = 0
    },
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge("Tarot?", get_type_colour(self or card.config, card), nil, 1.2)
    end,

    config = {max_highlighted = 1, enh_conv = 'm_minty_marble'},

    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.enh_conv]
		local key = self.key
        local plural = false
        if card.ability.consumeable.max_highlighted ~= 1 then plural = true end
        local s = plural and "s" or ""
        local a = plural and "" or "a "
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.consumeable.max_highlighted,
                s,
                a,
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_tarot = copier or card

        MINTY.tarotflip(used_tarot, { enh = card.ability.enh_conv })

        --[[
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end }))
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            local target = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    target:flip()
                    play_sound('card1', percent)
                    target:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i=1, #G.hand.highlighted do
            local target = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    target:set_ability(G.P_CENTERS[card.ability.enh_conv])
                    return true
                end
            }))
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + ( i - 0.999 ) / ( #G.hand.highlighted - 0.998 ) * 0.3
            local target = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    target:flip()
                    play_sound('tarot2', percent, 0.6)
                    target:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
        ]]
    end,

    in_pool = function ()
        return true
    end
}