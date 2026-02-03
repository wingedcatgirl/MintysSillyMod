local dev = not not string.find(SMODS.current_mod.version, "~")

SMODS.Achievement{
    key = "leftstakes",
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = true,
    reset_on_startup = dev,
    unlock_condition = function (self, args)
        if args and args.type == 'win_stake' then
            return MINTY.at_least_stake(G.GAME.stake, "stake_minty_scarlet")
        end
    end
}

SMODS.Achievement{
    key = "lefterstakes",
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = true,
    reset_on_startup = dev,
    unlock_condition = function (self, args)
        if args and args.type == 'win_stake' then
            return MINTY.at_least_stake(G.GAME.stake, "stake_minty_void")
        end
    end
}

SMODS.Achievement{
    key = "lefteststakes",
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = true,
    reset_on_startup = dev,
    unlock_condition = function (self, args)
        if args and args.type == 'win_stake' then
            return MINTY.at_least_stake(G.GAME.stake, "stake_minty_catcat")
        end
    end
}

SMODS.Achievement{
    key = "conqueror_of_hell",
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = true,
    reset_on_startup = dev,
    unlock_condition = function (self, args)
        if args and args.type == 'win_stake' then
            return MINTY.at_least_stake(G.GAME.stake, "stake_minty_rose_gold")
        end
    end
}

SMODS.Achievement{
    key = "template",
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = true,
    reset_on_startup = dev,
    unlock_condition = function (self, args)
        if args and args.type == "hand" then
            if args.handname == 'Full House' and args.scoring_hand then
                local _w = 0
                for k, v in ipairs(args.scoring_hand) do
                    if v:get_id() == SMODS.Ranks["minty_face"].id or v:get_id() == SMODS.Ranks["minty_number"].id then
                        _w = _w + 1
                    end
                end
                if _w == #args.scoring_hand then
                    return true
                end
            end
        end
    end
}