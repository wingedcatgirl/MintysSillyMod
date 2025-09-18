SMODS.Consumable{
    set = 'Tarot',
    key = 'focus',
    name = "The Focus",
    atlas = 'tarots',
    pos = {
        x = 1,
        y = 2
    },
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge("Tarot?", get_type_colour(self or card.config, card), nil, 1.2)
    end,

    config = {max_highlighted = 3},

    loc_vars = function(self, info_queue, card)
		local key = self.key
        local plural = false
        if card.ability.consumeable.max_highlighted ~= 1 then plural = true end
        local s = plural and "s" or ""
        local suit
        if G.GAME.minty_focussuit == nil then --TODO localizify this
            suit = "first played suit"
        elseif G.GAME.minty_focussuit == "suitless" then
            suit = "Stone Card"
        elseif G.GAME.minty_focussuit == "all-suit" then
            suit = "Wild Card"
        else
            suit = localize(G.GAME.minty_focussuit, "suits_plural").." suit"
        end
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        local suitcolor = G.C.SUITS[G.GAME.minty_focussuit] or G.C.IMPORTANT
        return {
            key = key,
            vars = {
                card.ability.consumeable.max_highlighted,
                s,
                suit,
                colours = {
                    suitcolor
                }
            }
        }
    end,

    can_use = function (self, card)
        return (not not G.GAME.minty_focussuit) and (#G.hand.highlighted > 0) and (#G.hand.highlighted <= card.ability.consumeable.max_highlighted)
    end,

    use = function(self, card, area, copier)
        local used_tarot = copier or card

        if G.GAME.minty_focussuit == "suitless" then
            MINTY.tarotflip(used_tarot, { enh = "m_stone" })
        elseif G.GAME.minty_focussuit == "all-suit" then
            MINTY.tarotflip(used_tarot, { enh = "m_wild" })
        else
            MINTY.tarotflip(used_tarot, { suit = G.GAME.minty_focussuit })
        end
    end,

    in_pool = function()
        return not not G.GAME.minty_focussuit
    end
}