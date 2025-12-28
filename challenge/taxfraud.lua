SMODS.Challenge{
    key = "taxfraud",
    button_colour = HEX("CA7CA7"),
    rules = {
        custom = {
            {id = "all_minty_counterfeit"},
            {id = "minty_ante_dollarpenalty", value = "4"},
            {id = "minty_showman", value = localize{key = "j_credit_card", type = "name_text", set = "Joker"}}
        }
    },
    jokers = {
        { id = "j_credit_card", edition = "negative", eternal = true }
    },
    apply = function (self)
        MINTY.event(function ()
            if not G.GAME.modifiers then return false end
            G.GAME.modifiers.enable_minty_counterfeit = true
            G.GAME.modifiers.all_minty_counterfeit = true
            G.GAME.modifiers.minty_infinite_j_credit_card = true
            return true
        end, {blockable = false, blocking = false})
    end,
    calculate = function (self, context)
        if G.GAME.round_resets.ante >= 4 and not G.GAME.modifiers.taxfraud_active then
            G.GAME.modifiers.taxfraud_active = true
            G.GAME.modifiers.minty_taxation = (G.GAME.modifiers.minty_taxation or 0) + 1
        end
    end,
    unlocked = function (self)
        return true
    end,
}