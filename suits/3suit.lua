SMODS.Suit{ -- 3s
    key = '3s',
    card_key = 'THREE',

    lc_atlas = '3s',
    hc_atlas = '3s',

    lc_ui_atlas = '3suiticon',
    hc_ui_atlas = '3suiticon',

    pos = { x = 0, y = 0 },
    ui_pos = { x = 0, y = 0 },

    lc_colour = HEX('86B723'),
    hc_colour = HEX('86B723'),

    in_pool = function(self, args)
        if G.GAME.starting_params.start_with_3s then
            return true
        end
        return MINTY.threeSuit_in_pool()
    end
}

if (SMODS.Mods["paperback"] or {}).can_load then
    table.insert(PB_UTIL.light_suits, 'minty_3s')
end