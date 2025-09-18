SMODS.Tag{
    key = "goading",
    in_pool = function (self, args)
        return MINTY.config.dev_mode
    end,
    apply = function (self, tag, context)
        if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
            G.GAME.chips = 0
            G.E_MANAGER:add_event(Event({
                func = function()
                    tag:yep()
                    G.GAME.blind:juice_up()
                    return true
                end
            }))
            MINTY.event(
                function ()
                    --create a random treat card
                    return true
                end
            )
        end
    end
}