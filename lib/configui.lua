local exoticmod = (SMODS.Mods["Bunco"] or {}).can_load

local devonlytoggle = function(t)
    if MINTY.config.dev_mode then
        return create_toggle(t)
    end
end

local exoticonlytoggle = function(t)
    if exoticmod then
        return create_toggle(t)
    end
end

SMODS.current_mod.config_tab = function()
    return {n = G.UIT.ROOT, config = {r = 0.1, minw = 8, minh = 6, align = "tl", padding = 0.2, colour = G.C.BLACK}, nodes = {
        {n = G.UIT.C, config = {minw=1, minh=1, align = "tl", colour = G.C.CLEAR, padding = 0.15}, nodes = {
        create_toggle({
            label = "Flavor text",
            ref_table = MINTY.config,
            ref_value = 'flavor_text',
        }),
        exoticonlytoggle({
            label = "Enabling 3s enables all secret suits",
            ref_table = MINTY.config,
            ref_value = 'enable_3_enable_exotic',
        }),
        create_toggle({
            label = "Include (stable) crossover content",
            ref_table = MINTY.config,
            ref_value = 'include_crossover',
        }),
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