SMODS.Sticker{
    key = "hooked",
    name = "Hooked",
    atlas = "stickers",
    pos = {
        x = 1,
        y = 0,
    },
    badge_colour = HEX("CA7CA7"),
    default_compat = true,
    sets = {
        Default = true,
        Enhanced = true
    },
    rate = 0.3,
    should_apply = function (self, card, center, area, bypass_roll)
        if bypass_roll or G.GAME.modifiers.all_minty_hooked == "absolute" then return true end
        if not G.GAME.modifiers.enable_minty_hooked then return false end
        if self.sets[center.set] then
            if G.GAME.modifiers.all_minty_hooked then return true end
            if pseudorandom("minty_hooked") <= self.rate then return true end
        end
        return false
    end,
    apply = function (self, card, val)
        card.ability.minty_hooked = val or nil
    end
}

local bpp = Blind.press_play
function Blind:press_play()
    local any_selected = false
    local hooked = {}
    for k, v in ipairs(G.hand.cards) do
        if not v.highlighted and v.ability.minty_hooked then
            hooked[#hooked+1] = v
            any_selected = true
        end
    end
    if any_selected then
        G.E_MANAGER:add_event(Event({ func = function()
            for k, v in ipairs(hooked) do
                G.hand:add_to_highlighted(v, true)
                play_sound('card1', 1)
            end
            G.FUNCS.discard_cards_from_highlighted(nil, true)
        return true end }))
        self.triggered = true
        delay(0.7)
    end
    local ret = bpp(self)
    return ret or any_selected or nil
end