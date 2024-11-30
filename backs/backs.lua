SMODS.Back({
    name = "Deck With A Treat",
    key = "treat",
    pos = { x = 0, y = 0 },
    atlas = "mintybacks",
    loc_txt = {
        name = 'Deck With a Treat',
        text = { 'Starts with a',
                 'full set of 13 {C:minty_3s}3s{}'},
    },
    unlocked = true,
    config = {treat_Deck = true},

    apply = function()
        enable_exotics()
    end,
})

local BackApply_to_run_ref = Back.apply_to_run
function Back.apply_to_run(self)
    BackApply_to_run_ref(self)

    if self.effect.config.treat_Deck then
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.treat_Deck = true
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
        config = { cry_force_suit = "minty_3s", cry_boss_blocked = {"bl_minty_thenip"} },
        loc_txt = {
            name = 'Deck of the Cat',
            text = { 'All playing cards are {C:minty_3s}3s{}',
                    'and cannot change suits.',
                    '{C:attention}The Nip{} cannot appear',
                    ' ',
                    '{C:inactive}The suit, not the rank!' },
        },
        unlocked = true,
    })

    if minty_config.dev_mode then
        SMODS.Back({
            name = "Deck of 6 Years",
            key = "cementdeck",
            pos = { x = 0, y = 0 },
            atlas = "mintybacks",
            config = { cry_force_seal = "minty_cement" },
            loc_txt = {
                name = 'Deck of the 6th Year',
                text ={ 					
                "All cards have a {C:minty_cement}Cement Seal{}",
                "Cards cannot change seals"}
            },
            unlocked = true,
        })
    end
end