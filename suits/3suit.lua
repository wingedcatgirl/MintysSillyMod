SMODS.Suit{ -- 3s
    key = '3s',
    card_key = 'THREE',

    lc_atlas = '3s',   --Face art by Pentzal https://discord.com/channels/1116389027176787968/1308185262664450068/1400944242167251016
    hc_atlas = '3shc', --... should probably make a proper credits tab soon tbh...

    lc_ui_atlas = '3suiticon',
    hc_ui_atlas = '3suiticon',

    pos = { x = 0, y = 0 },
    ui_pos = { x = 0, y = 0 },

    lc_colour = HEX('86B723'),
    hc_colour = HEX('86B723'),

    in_pool = function(self, args)
        return MINTY.threeSuit_in_pool()
    end,
    --[[ loc_vars doesn't happen in the customize menu; unsure where better to put this info 
    loc_vars = function (self, info_queue, card)
        MINTY.say("loc_vars is being calculated for this 3 lol", "TRACE")
        if G.STAGE == G.STAGES.MAIN_MENU then
            info_queue[#info_queue+1] = {
            set = "Other",
            key = "minty_3credit",
        }
        end
    end,
    --]]
}

if (SMODS.Mods["paperback"] or {}).can_load then
    table.insert(PB_UTIL.light_suits, 'minty_3s')
end

if AKYRS_CROSSMOD then
    AKYRS_CROSSMOD.suit_to_atlas_map["minty_3s"] = {
        "minty_pure3", {x=0, y=0}
    }
end