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

--[[if minty_config.dev_mode then
    SMODS.Back({
        name = "Deck of the Heart",
        key = "heart",
        pos = { x = 0, y = 1 },
        atlas = "mintybacks",
        unlocked = true,
        config = {},

        apply = function()
            if not ((SMODS.Mods["Cardsleeves"] or {}).can_load and (SMODS.Mods["FusionJokers"] or {}).can_load and (G.GAME.selected_sleeve or "sleeve_casl_none") == "sleeve_minty_heartsleeve") then
                G.E_MANAGER:add_event(Event({
                  func = function()
                    local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_lusty', nil)
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    return true
                  end
                }))
            end
        end,
    })

    SMODS.Back({
        name = "Deck of the Diamond",
        key = "diamond",
        pos = { x = 1, y = 1 },
        atlas = "mintybacks",
        unlocked = true,
        config = {},

        apply = function()
            if not ((SMODS.Mods["Cardsleeves"] or {}).can_load and (SMODS.Mods["FusionJokers"] or {}).can_load and (G.GAME.selected_sleeve or "sleeve_casl_none") == "sleeve_minty_diamondsleeve") then
                G.E_MANAGER:add_event(Event({
                  func = function()
                    local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_greedy', nil)
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    return true
                  end
                }))
            end
        end,
    })

    SMODS.Back({
        name = "Deck of the Club",
        key = "club",
        pos = { x = 2, y = 1 },
        atlas = "mintybacks",
        unlocked = true,
        config = {},

        apply = function()
            if not ((SMODS.Mods["Cardsleeves"] or {}).can_load and (SMODS.Mods["FusionJokers"] or {}).can_load and (G.GAME.selected_sleeve or "sleeve_casl_none") == "sleeve_minty_clubsleeve") then
                G.E_MANAGER:add_event(Event({
                  func = function()
                    local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_gluttonous', nil)
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    return true
                  end
                }))
            end
        end,
    })

    SMODS.Back({
        name = "Deck of the Spade",
        key = "spade",
        pos = { x = 3, y = 1 },
        atlas = "mintybacks",
        unlocked = true,
        config = {},

        apply = function()
            if not ((SMODS.Mods["Cardsleeves"] or {}).can_load and (SMODS.Mods["FusionJokers"] or {}).can_load and (G.GAME.selected_sleeve or "sleeve_casl_none") == "sleeve_minty_spadesleeve") then
                G.E_MANAGER:add_event(Event({
                  func = function()
                    local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_wrathful', nil)
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    return true
                  end
                }))
            end
        end,
    })

    SMODS.Back({
        name = "Deck of the 3",
        key = "3suit",
        pos = { x = 4, y = 1 },
        atlas = "mintybacks",
        unlocked = true,
        config = {},

        apply = function()
            if not ((SMODS.Mods["Cardsleeves"] or {}).can_load and (SMODS.Mods["FusionJokers"] or {}).can_load and (G.GAME.selected_sleeve or "sleeve_casl_none") == "sleeve_minty_3suitsleeve") then
                G.E_MANAGER:add_event(Event({
                  func = function()
                    local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_minty_hedonist', nil)
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    return true
                  end
                }))
            end
        end,
    })


    if (SMODS.Mods["CardSleeves"] or {}).can_load then
        CardSleeves.Sleeve({
            key = "heartsleeve",
            name = "Sleeve of the Heart",
            atlas = "mintysleeves",
            pos = { x = 0, y = 1 },
            config = {},
            unlocked = true,
            unlock_condition = { name = "Deck of the Heart", stake = 1 },
            loc_vars = function(self)
                local key, vars
    
                if self.get_current_deck_key() ~= "b_minty_heart" then
                    key = self.key
                else
                    if (SMODS.Mods["CardSleeves"] or {}).can_load then
                        key = self.key.."_fusionalt"
                    else
                        key = self.key.."_alt"
                    end
                end
    
                return { key = key, vars = vars }
            end,
            apply = function(self)
                if self.get_current_deck_name() ~= "Deck of the Heart" then
                    G.E_MANAGER:add_event(Event({
                      func = function()
                        local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_lusty', nil)
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        return true
                    end
                    }))
                elseif SMODS.Mods["FusionJokers"] or {}).can_load
                    G.E_MANAGER:add_event(Event({
                      func = function()
                        local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_heart_paladin', nil)
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        return true
                    end
                    }))
                else
                    G.E_MANAGER:add_event(Event({
                      func = function()
                        local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_bloodstone', nil)
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        return true
                    end
                    }))
                end
            end,
        })

        CardSleeves.Sleeve({
            key = "diamondsleeve",
            name = "Sleeve of the Diamond",
            atlas = "mintysleeves",
            pos = { x = 1, y = 1 },
            config = {},
            unlocked = true,
            unlock_condition = { name = "Deck of the Diamond", stake = 1 },
            loc_vars = function(self)
                local key, vars
    
                if self.get_current_deck_key() ~= "b_minty_diamond" then
                    key = self.key
                else
                    if (SMODS.Mods["CardSleeves"] or {}).can_load then
                        key = self.key.."_fusionalt"
                    else
                        key = self.key.."_alt"
                    end
                end
    
                return { key = key, vars = vars }
            end,
            apply = function(self)
                
            end,
            trigger_effect = function(self, args)
                -- what if anything should we do with this.
            end
        })

        CardSleeves.Sleeve({
            key = "clubsleeve",
            name = "Sleeve of the Club",
            atlas = "mintysleeves",
            pos = { x = 2, y = 1 },
            config = {},
            unlocked = true,
            unlock_condition = { name = "Deck of the Club", stake = 1 },
            loc_vars = function(self)
                local key, vars
    
                if self.get_current_deck_key() ~= "b_minty_club" then
                    key = self.key
                else
                    if (SMODS.Mods["CardSleeves"] or {}).can_load then
                        key = self.key.."_fusionalt"
                    else
                        key = self.key.."_alt"
                    end
                end
    
                return { key = key, vars = vars }
            end,
            apply = function(self)
                
            end,
            trigger_effect = function(self, args)
                -- what if anything should we do with this.
            end
        })

        CardSleeves.Sleeve({
            key = "spadesleeve",
            name = "Sleeve of the Spade",
            atlas = "mintysleeves",
            pos = { x = 3, y = 1 },
            config = {},
            unlocked = true,
            unlock_condition = { name = "Deck of the Spade", stake = 1 },
            loc_vars = function(self)
                local key, vars
    
                if self.get_current_deck_key() ~= "b_minty_spade" then
                    key = self.key
                else
                    if (SMODS.Mods["CardSleeves"] or {}).can_load then
                        key = self.key.."_fusionalt"
                    else
                        key = self.key.."_alt"
                    end
                end
    
                return { key = key, vars = vars }
            end,
            apply = function(self)
                
            end,
            trigger_effect = function(self, args)
                -- what if anything should we do with this.
            end
        })

        CardSleeves.Sleeve({
            key = "3suitsleeve",
            name = "Sleeve of the 3",
            atlas = "mintysleeves",
            pos = { x = 4, y = 1 },
            config = {},
            unlocked = true,
            unlock_condition = { name = "Deck of the 3", stake = 1 },
            loc_vars = function(self)
                local key, vars
    
                if self.get_current_deck_key() ~= "b_minty_3suit" then
                    key = self.key
                else
                    if (SMODS.Mods["CardSleeves"] or {}).can_load then
                        key = self.key.."_fusionalt"
                    else
                        key = self.key.."_alt"
                    end
                end
    
                return { key = key, vars = vars }
            end,
            apply = function(self)
                
            end,
            trigger_effect = function(self, args)
                -- what if anything should we do with this.
            end
        })
    end
end]]