local devonlytoggle = function(t)
    if MINTY.config.dev_mode then
        return create_toggle(t)
    end
end

G.FUNCS.minty_optcycle = function(args)
    local refval = args.cycle_config.ref_value
    MINTY.config[refval].current_option = args.cycle_config.current_option
    MINTY.config[refval].option_value = args.to_val
end

G.FUNCS.minty_gameset_optcycle = function(args)
    local refval = args.cycle_config.ref_value
    G.PROFILES[G.SETTINGS.profile][refval].current_option = args.cycle_config.current_option
    G.PROFILES[G.SETTINGS.profile][refval].option_value = args.to_val
end

G.FUNCS.minty_testbutton = function ()
    return nil
end

SMODS.current_mod.config_tab = function()
    --[[ Fallback for in case the funky intro thing doesn't work whenever I do this for real
    G.PROFILES[G.SETTINGS.profile].minty_balance_level = G.PROFILES[G.SETTINGS.profile].minty_balance_level or {
        current_option = 2,
        option_value = "Regular"
    }
    --]]
    return {n = G.UIT.ROOT, config = {r = 0.1, minw = 8, minh = 6, align = "tl", padding = 0.2, colour = G.C.BLACK}, nodes = {
        {n = G.UIT.C, config = {minw=1, minh=1, align = "tl", colour = G.C.CLEAR, padding = 0.15}, nodes = {
            --[[
            UIBox_button({
                button = "minty_testbutton",
                label = {"Test button lol"},
                colour = G.C.GREY
            }),
            --]]
        --[[
        create_option_cycle {
            label = "Balance Level",
            options = {'Restrained', "Regular", "Ridiculous"},
            current_option = G.PROFILES[G.SETTINGS.profile].minty_balance_level.current_option,
            ref_table = G.PROFILES[G.SETTINGS.profile],
            ref_value = "minty_balance_level",
            opt_callback = 'minty_gameset_optcycle',
            w = 5.5
            },
        --]]
        create_toggle({
            label = "Flavor text",
            ref_table = MINTY.config,
            ref_value = 'flavor_text',
        }),
        create_toggle({
            label = "Include (stable) crossover content",
            ref_table = MINTY.config,
            ref_value = 'include_crossover',
        }),
        create_toggle({
            label = "Rename Stone to Slate",
            ref_table = MINTY.config,
            ref_value = 'stone_rename',
        }),
        create_option_cycle {
            label = "3 availability",
            options = {'Unlocked', "Locked", "Sealed"},
            current_option = MINTY.config.three_lock.current_option,
            ref_table = MINTY.config,
            ref_value = "three_lock",
            opt_callback = 'minty_optcycle',
            w = 5.5
            },
        create_toggle({
            label = "Dev mode",
            ref_table = MINTY.config,
            ref_value = 'dev_mode',
        }),
        devonlytoggle({
            label = "Suppress trace messages",
            ref_table = MINTY.config,
            ref_value = "suppress_trace",
        }),
        devonlytoggle({
            label = "Test option",
            ref_table = MINTY.config,
            ref_value = "test_button",
        }),
        }}
    }}
end