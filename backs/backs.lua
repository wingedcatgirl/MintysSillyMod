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
        unlocked = false,
        unlock_condition = { deck = "b_minty_treat", stake = "stake_white" },
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

SMODS.Back({
    name = "Deck of the Heart",
    key = "hearts",
    pos = { x = 0, y = 1 },
    atlas = "mintybacks",
    unlocked = true,
    config = {},

    apply = function()
        local sleeveexist = (SMODS.Mods["CardSleeves"] or {}).can_load
        local fusionexist = (SMODS.Mods["FusionJokers"] or {}).can_load
        local heartsleeve = ((G.GAME.selected_sleeve or "sleeve_casl_none") == "sleeve_minty_heartsleeve")
        if not (sleeveexist and fusionexist and heartsleeve) then
            --sendDebugMessage('[Minty] Heart Deck creating Lusty')
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card = SMODS.create_card({
                      set = 'Joker',
                      area = G.jokers,
                      key = 'j_lusty_joker',
                      stickers = {'eternal'},
                    })
                    card:add_to_deck()
                    G.jokers:emplace(card)
                  return true
                end
              }))
        end
        G.E_MANAGER:add_event(Event({
            func = function()
                local tarot = SMODS.create_card({
                    set = 'Tarot',
                    area = G.consumeables,
                    key = 'c_sun',
                })
                tarot:add_to_deck()
                G.consumeables:emplace(tarot)
              return true
            end
          }))
    end,
})

if (SMODS.Mods["CardSleeves"] or {}).can_load then
    CardSleeves.Sleeve({
        key = "heartsleeve",
        name = "Sleeve of the Heart",
        atlas = "mintysleeves",
        pos = { x = 0, y = 1 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_minty_hearts", stake = "stake_white" },
        loc_vars = function(self)
            local key, vars

            if self.get_current_deck_key() ~= "b_minty_hearts" then
                key = self.key
            else
                if (SMODS.Mods["FusionJokers"] or {}).can_load then
                    key = self.key.."_fusionalt"
                else
                    key = self.key.."_alt"
                end
            end

            return { key = key, vars = vars }
        end,
        apply = function(self)
            if self.get_current_deck_key() ~= "b_minty_hearts" then
                --sendDebugMessage('[Minty] Heart Sleeve creating Lusty')
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card = SMODS.create_card({
                          set = 'Joker',
                          area = G.jokers,
                          key = 'j_lusty_joker',
                          stickers = {'eternal'},
                        })
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        local tarot = SMODS.create_card({
                            set = 'Tarot',
                            area = G.consumeables,
                            key = 'c_sun',
                        })
                        tarot:add_to_deck()
                        G.consumeables:emplace(tarot)
                      return true
                    end
                  }))
            elseif (SMODS.Mods["FusionJokers"] or {}).can_load then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card = SMODS.create_card({
                      set = 'Joker',
                      area = G.jokers,
                      key = 'j_heart_paladin',
                      stickers = {'eternal'},
                    })
                    card:add_to_deck()
                    G.jokers:emplace(card)
                  return true
                end
              }))
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card = SMODS.create_card({
                          set = 'Joker',
                          area = G.jokers,
                          key = 'j_bloodstone',
                          stickers = {'eternal'},
                        })
                        card:add_to_deck()
                        G.jokers:emplace(card)
                      return true
                    end
                  }))
            end
        end,
    })
end

SMODS.Back({
    name = "Deck of the Diamond",
    key = "diamonds",
    pos = { x = 1, y = 1 },
    atlas = "mintybacks",
    unlocked = true,
    config = {},

    apply = function()
        local sleeveexist = (SMODS.Mods["CardSleeves"] or {}).can_load
        local fusionexist = (SMODS.Mods["FusionJokers"] or {}).can_load
        local diamondsleeve = ((G.GAME.selected_sleeve or "sleeve_casl_none") == "sleeve_minty_diamondsleeve")
        if not (sleeveexist and fusionexist and diamondsleeve) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card = SMODS.create_card({
                      set = 'Joker',
                      area = G.jokers,
                      key = 'j_greedy_joker',
                      stickers = {'eternal'},
                    })
                    card:add_to_deck()
                    G.jokers:emplace(card)
                  return true
                end
              }))
        end
        G.E_MANAGER:add_event(Event({
            func = function()
                local tarot = SMODS.create_card({
                    set = 'Tarot',
                    area = G.consumeables,
                    key = 'c_star',
                })
                tarot:add_to_deck()
                G.consumeables:emplace(tarot)
              return true
            end
          }))
    end,
})

if (SMODS.Mods["CardSleeves"] or {}).can_load then
    CardSleeves.Sleeve({
        key = "diamondsleeve",
        name = "Sleeve of the Diamond",
        atlas = "mintysleeves",
        pos = { x = 1, y = 1 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_minty_diamonds", stake = "stake_white" },
        loc_vars = function(self)
            local key, vars

            if self.get_current_deck_key() ~= "b_minty_diamonds" then
                key = self.key
            else
                if (SMODS.Mods["FusionJokers"] or {}).can_load then
                    key = self.key.."_fusionalt"
                else
                    key = self.key.."_alt"
                end
            end

            return { key = key, vars = vars }
        end,
        apply = function(self)
            if self.get_current_deck_key() ~= "b_minty_diamonds" then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card = SMODS.create_card({
                          set = 'Joker',
                          area = G.jokers,
                          key = 'j_greedy_joker',
                          stickers = {'eternal'},
                        })
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        local tarot = SMODS.create_card({
                            set = 'Tarot',
                            area = G.consumeables,
                            key = 'c_star',
                        })
                        tarot:add_to_deck()
                        G.consumeables:emplace(tarot)
                      return true
                    end
                  }))
            elseif (SMODS.Mods["FusionJokers"] or {}).can_load then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card = SMODS.create_card({
                      set = 'Joker',
                      area = G.jokers,
                      key = 'j_diamond_bard',
                      stickers = {'eternal'},
                    })
                    card:add_to_deck()
                    G.jokers:emplace(card)
                  return true
                end
              }))
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card = SMODS.create_card({
                          set = 'Joker',
                          area = G.jokers,
                          key = 'j_rough_gem',
                          stickers = {'eternal'},
                        })
                        card:add_to_deck()
                        G.jokers:emplace(card)
                      return true
                    end
                  }))
            end
        end,
    })
end

SMODS.Back({
    name = "Deck of the Club",
    key = "clubs",
    pos = { x = 2, y = 1 },
    atlas = "mintybacks",
    unlocked = true,
    config = {},

    apply = function()
        local sleeveexist = (SMODS.Mods["CardSleeves"] or {}).can_load
        local fusionexist = (SMODS.Mods["FusionJokers"] or {}).can_load
        local clubssleeve = ((G.GAME.selected_sleeve or "sleeve_casl_none") == "sleeve_minty_clubssleeve")
        if not (sleeveexist and fusionexist and clubssleeve) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card = SMODS.create_card({
                      set = 'Joker',
                      area = G.jokers,
                      key = 'j_gluttenous_joker',
                      stickers = {'eternal'},
                    })
                    card:add_to_deck()
                    G.jokers:emplace(card)
                  return true
                end
              }))
        end
        G.E_MANAGER:add_event(Event({
            func = function()
                local tarot = SMODS.create_card({
                    set = 'Tarot',
                    area = G.consumeables,
                    key = 'c_moon',
                })
                tarot:add_to_deck()
                G.consumeables:emplace(tarot)
              return true
            end
          }))
    end,
})

if (SMODS.Mods["CardSleeves"] or {}).can_load then
    CardSleeves.Sleeve({
        key = "clubssleeve",
        name = "Sleeve of the Club",
        atlas = "mintysleeves",
        pos = { x = 2, y = 1 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_minty_clubs", stake = "stake_white" },
        loc_vars = function(self)
            local key, vars

            if self.get_current_deck_key() ~= "b_minty_clubs" then
                key = self.key
            else
                if (SMODS.Mods["FusionJokers"] or {}).can_load then
                    key = self.key.."_fusionalt"
                else
                    key = self.key.."_alt"
                end
            end

            return { key = key, vars = vars }
        end,
        apply = function(self)
            if self.get_current_deck_key() ~= "b_minty_clubs" then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card = SMODS.create_card({
                          set = 'Joker',
                          area = G.jokers,
                          key = 'j_gluttenous_joker',
                          stickers = {'eternal'},
                        })
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        local tarot = SMODS.create_card({
                            set = 'Tarot',
                            area = G.consumeables,
                            key = 'c_moon',
                        })
                        tarot:add_to_deck()
                        G.consumeables:emplace(tarot)
                      return true
                    end
                  }))
            elseif (SMODS.Mods["FusionJokers"] or {}).can_load then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card = SMODS.create_card({
                      set = 'Joker',
                      area = G.jokers,
                      key = 'j_club_wizard',
                      stickers = {'eternal'},
                    })
                    card:add_to_deck()
                    G.jokers:emplace(card)
                  return true
                end
              }))
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card = SMODS.create_card({
                          set = 'Joker',
                          area = G.jokers,
                          key = 'j_onyx_agate',
                          stickers = {'eternal'},
                        })
                        card:add_to_deck()
                        G.jokers:emplace(card)
                      return true
                    end
                  }))
            end
        end,
    })
end

SMODS.Back({
    name = "Deck of the Spade",
    key = "spades",
    pos = { x = 3, y = 1 },
    atlas = "mintybacks",
    unlocked = true,
    config = {},

    apply = function()
        local sleeveexist = (SMODS.Mods["CardSleeves"] or {}).can_load
        local fusionexist = (SMODS.Mods["FusionJokers"] or {}).can_load
        local spadessleeve = ((G.GAME.selected_sleeve or "sleeve_casl_none") == "sleeve_minty_spadessleeve")
        if not (sleeveexist and fusionexist and spadessleeve) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card = SMODS.create_card({
                      set = 'Joker',
                      area = G.jokers,
                      key = 'j_wrathful_joker',
                      stickers = {'eternal'},
                    })
                    card:add_to_deck()
                    G.jokers:emplace(card)
                  return true
                end
              }))
        end
        G.E_MANAGER:add_event(Event({
            func = function()
                local tarot = SMODS.create_card({
                    set = 'Tarot',
                    area = G.consumeables,
                    key = 'c_world',
                })
                tarot:add_to_deck()
                G.consumeables:emplace(tarot)
              return true
            end
          }))
    end,
})

if (SMODS.Mods["CardSleeves"] or {}).can_load then
    CardSleeves.Sleeve({
        key = "spadessleeve",
        name = "Sleeve of the Spade",
        atlas = "mintysleeves",
        pos = { x = 3, y = 1 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_minty_spades", stake = "stake_white" },
        loc_vars = function(self)
            local key, vars

            if self.get_current_deck_key() ~= "b_minty_spades" then
                key = self.key
            else
                if (SMODS.Mods["FusionJokers"] or {}).can_load then
                    key = self.key.."_fusionalt"
                else
                    key = self.key.."_alt"
                end
            end

            return { key = key, vars = vars }
        end,
        apply = function(self)
            if self.get_current_deck_key() ~= "b_minty_spades" then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card = SMODS.create_card({
                          set = 'Joker',
                          area = G.jokers,
                          key = 'j_wrathful_joker',
                          stickers = {'eternal'},
                        })
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        local tarot = SMODS.create_card({
                            set = 'Tarot',
                            area = G.consumeables,
                            key = 'c_world',
                        })
                        tarot:add_to_deck()
                        G.consumeables:emplace(tarot)
                      return true
                    end
                  }))
            elseif (SMODS.Mods["FusionJokers"] or {}).can_load then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card = SMODS.create_card({
                      set = 'Joker',
                      area = G.jokers,
                      key = 'j_spade_archer',
                      stickers = {'eternal'},
                    })
                    card:add_to_deck()
                    G.jokers:emplace(card)
                  return true
                end
              }))
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card = SMODS.create_card({
                          set = 'Joker',
                          area = G.jokers,
                          key = 'j_arrowhead',
                          stickers = {'eternal'},
                        })
                        card:add_to_deck()
                        G.jokers:emplace(card)
                      return true
                    end
                  }))
            end
        end,
    })
end

SMODS.Back({
    name = "Deck of the 3",
    key = "3suit",
    pos = { x = 4, y = 1 },
    atlas = "mintybacks",
    unlocked = true,
    config = {},

    apply = function()
        local sleeveexist = (SMODS.Mods["CardSleeves"] or {}).can_load
        local fusionexist = (SMODS.Mods["FusionJokers"] or {}).can_load
        local threesleeve = ((G.GAME.selected_sleeve or "sleeve_casl_none") == "sleeve_minty_3suitsleeve")
        if not (sleeveexist and fusionexist and threesleeve) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card = SMODS.create_card({
                      set = 'Joker',
                      area = G.jokers,
                      key = 'j_minty_hedonist',
                      stickers = {'eternal'},
                    })
                    card:add_to_deck()
                    G.jokers:emplace(card)
                  return true
                end
              }))
        end
        G.E_MANAGER:add_event(Event({
            func = function()
                local tarot = SMODS.create_card({
                    set = 'Tarot',
                    area = G.consumeables,
                    key = 'c_minty_cat',
                })
                tarot:add_to_deck()
                G.consumeables:emplace(tarot)
              return true
            end
          }))
    end,
})

if (SMODS.Mods["CardSleeves"] or {}).can_load then
    CardSleeves.Sleeve({
        key = "3suitsleeve",
        name = "Sleeve of the 3",
        atlas = "mintysleeves",
        pos = { x = 4, y = 1 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_minty_3suit", stake = "stake_white" },
        loc_vars = function(self)
            local key, vars

            if self.get_current_deck_key() ~= "b_minty_3suit" then
                key = self.key
            else
                if (SMODS.Mods["FusionJokers"] or {}).can_load then
                    key = self.key.."_fusionalt"
                else
                    key = self.key.."_alt"
                end
            end

            return { key = key, vars = vars }
        end,
        apply = function(self)
            if self.get_current_deck_key() ~= "b_minty_3suit" then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card = SMODS.create_card({
                          set = 'Joker',
                          area = G.jokers,
                          key = 'j_minty_hedonist',
                          stickers = {'eternal'},
                        })
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        local tarot = SMODS.create_card({
                            set = 'Tarot',
                            area = G.consumeables,
                            key = 'c_minty_cat',
                        })
                        tarot:add_to_deck()
                        G.consumeables:emplace(tarot)
                      return true
                    end
                  }))
            elseif (SMODS.Mods["FusionJokers"] or {}).can_load then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card = SMODS.create_card({
                      set = 'Joker',
                      area = G.jokers,
                      key = 'j_minty_threecats',
                      stickers = {'eternal'},
                    })
                    card:add_to_deck()
                    G.jokers:emplace(card)
                  return true
                end
              }))
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card = SMODS.create_card({
                          set = 'Joker',
                          area = G.jokers,
                          key = 'j_minty_claw',
                          stickers = {'eternal'},
                        })
                        card:add_to_deck()
                        G.jokers:emplace(card)
                      return true
                    end
                  }))
            end
        end,
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

