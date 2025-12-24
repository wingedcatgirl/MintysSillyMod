local dev = true

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