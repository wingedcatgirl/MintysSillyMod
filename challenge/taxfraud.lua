SMODS.Challenge{
    key = "taxfraud",
    button_colour = HEX("CA7CA7"),
    rules = {
        custom = {
            {id = "all_minty_counterfeit"},
            {id = "minty_ante_dollarpenalty", value = "4"}
        }
    },
    jokers = {
        { id = "j_credit_card", edition = "negative", eternal = true }
    },
    apply = function (self)
        MINTY.event(function ()
            if not G.GAME.modifiers then return false end
            G.GAME.modifiers.all_minty_counterfeit = true
            return true
        end, {blockable = false, blocking = false})
    end,
    calculate = function (self, context)
        if G.GAME.round_resets.ante >= 4 and context.main_scoring then
            return {
                mult = -G.GAME.dollars
            }
        end
    end,
    unlocked = function (self)
        return true
    end,
}