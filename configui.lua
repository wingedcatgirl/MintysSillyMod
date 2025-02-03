SMODS.current_mod.config_tab = function()
    return {n = G.UIT.ROOT, config = {r = 0.1, minw = 8, minh = 6, align = "tl", padding = 0.2, colour = G.C.BLACK}, nodes = {
        {n = G.UIT.C, config = {minw=1, minh=1, align = "tl", colour = G.C.CLEAR, padding = 0.15}, nodes = {
        create_toggle({
            label = "Dev mode",
            ref_table = minty_config,
            ref_value = 'dev_mode',
        }),
        create_toggle({
            label = "Flavor text",
            ref_table = minty_config,
            ref_value = 'flavor_text',
        }),
        }}
    }}
end