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

if (SMODS.Mods["CardSleeves"] or {}).can_load then
    CardSleeves.Sleeve({
        key = "treatsleeve",
        name = "Sleeve With A Treat",
        atlas = "mintysleeves",
        pos = { x = 0, y = 0 },
        config = {start_with_3s = true},
        unlocked = true,
        unlock_condition = { name = "Deck With A Treat", stake = 1 },
        loc_vars = function(self)
            local key, vars

            if self.get_current_deck_key() ~= "b_minty_treat" then
                key = self.key
            else
                key = self.key.."_alt"
            end

            return { key = key, vars = vars }
        end,
        apply = function(self)
            if not exotic_in_pool() then enable_exotics() end
            G.GAME.starting_params.start_with_3s = true 
            --changing game starting params directly is inelegant but idk how to get sleeve config oopsie
            G.GAME.starting_params.easy_spectra = true
            if self.get_current_deck_key() ~= "b_minty_treat" then
            end
            if self.get_current_deck_key() == "b_minty_treat" then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for i = #G.playing_cards, 1, -1 do
                            if G.playing_cards[i]:get_id() == 3 then
                                SMODS.change_base(G.playing_cards[i], 'minty_3s', nil)
                            else 
                                if pseudorandom('treatsleevesuit') < 1/3 then
                                    SMODS.change_base(G.playing_cards[i], 'minty_3s', nil)
                                end
                                if pseudorandom('treatsleeverank') < 1/3 then
                                    SMODS.change_base(G.playing_cards[i], nil, "3")
                                end
                            end
                        end
        
                        return true
                    end
                }))
            end
        end,
        trigger_effect = function(self, args)
            -- what if anything should we do with this.
        end
    })
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