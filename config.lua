local nomotion = G and G.SETTINGS and G.SETTINGS.reduced_motion or false

return {
    ["dev_mode"] = false,
    ["flavor_text"] = true,
    ["stone_rename"] = true,
    ["include_crossover"] = false,
    ["three_lock"] = {
        current_option = 2,
        option_value = "Locked",
    },
    ["suppress_trace"] = false,
    ["ticking_splines"] = not nomotion,
    ["test_button"] = false,
}