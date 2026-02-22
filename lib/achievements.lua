local dev = not not string.find(SMODS.current_mod.version, "~")
local modid = SMODS.current_mod.id --A surprise tool that will help us later

---@param t SMODS.Achievement
---@return SMODS.Achievement
local function cheevo (t)
    for _,v in ipairs{"bypass_all_unlocked", "hidden_name", "hidden_text"} do
        if t[v] == nil then t[v] = true end
    end
    if t.reset_on_startup == nil then t.reset_on_startup = dev end

    return SMODS.Achievement{
        key = t.key,
        atlas = t.atlas or "cheevo",
        pos = t.pos or {x=0,y=0},
        hidden_pos = t.hidden_pos or {x=1, y=0},
        bypass_all_unlocked = t.bypass_all_unlocked,
        hidden_name = t.hidden_name,
        hidden_text = t.hidden_text,
        reset_on_startup = t.reset_on_startup,
        unlock_condition = t.unlock_condition
    }
end

cheevo{
    key = "leftstakes",
    unlock_condition = function (self, args)
        if args and args.type == 'win_stake' then
            return MINTY.at_least_stake(G.GAME.stake, "stake_minty_scarlet")
        end
    end
}

cheevo{
    key = "lefterstakes",
    unlock_condition = function (self, args)
        if args and args.type == 'win_stake' then
            return MINTY.at_least_stake(G.GAME.stake, "stake_minty_void")
        end
    end
}

cheevo{
    key = "lefteststakes",
    unlock_condition = function (self, args)
        if args and args.type == 'win_stake' then
            return MINTY.at_least_stake(G.GAME.stake, "stake_minty_catcat")
        end
    end
}

cheevo{
    key = "conqueror_of_hell",
    unlock_condition = function (self, args)
        if args and args.type == 'win_stake' then
            return MINTY.at_least_stake(G.GAME.stake, "stake_minty_rose_gold")
        end
    end
}

cheevo{
    key = "template",
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

cheevo{
    key = "nyanpletionist",
    bypass_all_unlocked = false,
    hidden_text = false,
    unlock_condition = function (self, args)
        if args and args.type == "discover_amount" then
            local items = {
                "Centers", "Tags", "Blinds"
            }

            for _,item in ipairs(items) do
                for k,v in pairs(SMODS[item]) do
                    if v.original_mod and v.original_mod.id == modid then
                        if not v.discovered and not v.no_collection then
                            return false
                        end
                    end
                end
            end
            return true
        end
    end
}

cheevo{
    key = "nyanpletionist_plus",
    bypass_all_unlocked = false,
    hidden_text = false,
    unlock_condition = function (self, args)
        if args and args.type == "win_stake" then
            for k,v in pairs(SMODS.Centers) do
                if v.original_mod and v.original_mod.id == modid and v.set == "Back" then
                    local sticker = get_deck_win_sticker(v)
                    if not sticker then return false end
                    if not MINTY.at_least_stake("stake_"..sticker, "stake_minty_catcat") then return false end
                end
            end
            return true
        end
    end
}

cheevo{
    key = "nyanpletionist_plusplus",
    bypass_all_unlocked = false,
    hidden_text = false,
    unlock_condition = function (self, args)
        if args and args.type == "win_stake" then
            for k,v in pairs(SMODS.Centers) do
                if v.original_mod and v.original_mod.id == modid and v.set == "Joker" then
                    local sticker = get_joker_win_sticker(v)
                    if not sticker then return false end
                    if not MINTY.at_least_stake("stake_"..sticker, "stake_minty_catcat") then return false end
                end
            end
            return true
        end
    end
}