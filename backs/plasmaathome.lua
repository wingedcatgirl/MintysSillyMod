SMODS.Back{
    name = "We Have Plasma Deck At Home",
    key = "plasmaathome",
    atlas = "backs",
    pos = { x = 1, y = 2 },
    unlocked = false,
    check_for_unlock = function (self, args)
        if args and args.type == "win_custom" then
            if MINTY.at_least_stake(G.GAME.stake, "stake_minty_sky") then
                return true
            end
        end
    end,
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