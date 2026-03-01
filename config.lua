local nomotion = G and G.SETTINGS and G.SETTINGS.reduced_motion or false
local dev = string.find(SMODS.current_mod.version, "~")

return {
    ["dev_mode"] = dev,
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
    no_dumbass_shit = false
}