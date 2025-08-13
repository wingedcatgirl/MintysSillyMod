

--[[
if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
    G.GAME.chips = 0
    G.E_MANAGER:add_event(Event({
        func = function()
            G.GAME.blind:juice_up()
            return true
        end
    }))
end
-- This if clause should make the reset happen (doesn't check anything else e.g. Is It A Boss)]]