SMODS.Back{
    name = "We Have Plasma Deck At Home",
    key = "plasmaathome",
    atlas = "backs",
    pos = { x = 1, y = 2 },
    apply = function (self, back)
        MINTY.event(function ()
            if not (G.GAME and G.HUD) then return false end
            G.GAME.blind_size_exponent = 0.5
            G.GAME.starting_params.ante_scaling = 2
            SMODS.set_scoring_calculation("add")
            return true
        end, {blocking = false, blockable = false})
    end
}