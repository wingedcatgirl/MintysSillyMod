SMODS.Back({
    name = "Deck With A Treat",
    key = "treat",
    pos = { x = 0, y = 0 },
    atlas = "mintybacks",
    unlocked = true,
    config = {start_with_3s = true},

    apply = function()
        enable_exotics()
        G.GAME.starting_params.easy_spectra = true
    end,
})

local BackApply_to_run_ref = Back.apply_to_run
function Back.apply_to_run(self)
    BackApply_to_run_ref(self)

    if self.effect.config.start_with_3s then
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.start_with_3s = true
                return true
            end
        }))
    end
end

if (SMODS.Mods["Cryptid"] or {}).can_load then
    SMODS.Back({
        name = "Deck of the Cat",
        key = "catdeck",
        pos = { x = 1, y = 0 },
        atlas = "mintybacks",
        config = { cry_force_suit = "minty_3s", cry_boss_blocked = {"bl_minty_thenip"}, start_with_3s = true },
        unlocked = true,
    })

    SMODS.Back({
        name = "Deck of 6 Years",
        key = "cementdeck",
        pos = { x = 0, y = 0 },
        atlas = "mintybacks",
        config = { cry_force_seal = "minty_cement" },
        unlocked = true,
    })

end