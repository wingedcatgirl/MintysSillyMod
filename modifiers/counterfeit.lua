SMODS.Sticker{
    key = "counterfeit",
    name = "Counterfeit",
    atlas = "stickers",
    pos = {
        x = 0,
        y = 0,
    },
    badge_colour = HEX("CA7CA7"),
    default_compat = true,
    compat_exceptions = {
        ["j_egg"] = true,
        ["j_paperback_wish_you_were_here"] = true,
    },
    sets = {
        Joker = true,
    },
    should_apply = function (self, card, center, area, bypass_roll)
        if G.GAME.modifiers.all_minty_counterfeit == "absolute" then return true end
        if not G.GAME.modifiers.enable_minty_counterfeit then return false end
        if center.minty_counterfeit_compat == false then return false end
        if self.compat_exceptions[center.key] then return false end
        if not ((area == G.shop_jokers) or (area == G.pack_cards)) then
            return false
        end
        if (center.set == "Joker") or (G.GAME.modifiers.enable_minty_counterfeit_consumeables and SMODS.ConsumableTypes[center.set]) then
            if G.GAME.modifiers.all_minty_counterfeit then return true end
            if bypass_roll or pseudorandom("minty_counterfeit") <= 0.3 then return true end
        end
        return false
    end,
    apply = function (self, card, val)
        card.ability.minty_counterfeit = val
        card.prev_sell_cost = card.sell_cost
        if card.sell_cost > 0 == val then
            card.sell_cost = -card.sell_cost
        end
        if not val then card.prev_sell_cost = nil end
    end,
    calculate = function (self, card, context)
        if card.sell_cost > (card.prev_sell_cost or 0) then
            card.sell_cost = math.min(-card.sell_cost, (card.prev_sell_cost or 0))
        end
        card.prev_sell_cost = card.sell_cost
    end
}