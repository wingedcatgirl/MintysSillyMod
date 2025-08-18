SMODS.Back({
    name = "Deck of the Club",
    key = "clubs",
    pos = { x = 2, y = 1 },
    atlas = "backs",
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
        atlas = "sleeves",
        pos = { x = 2, y = 1 },
        config = {},
        unlocked = false,
        check_for_unlock = function (self, args)
          if not (G and G.GAME) then return end
          if self.get_current_deck_key() ~= "b_minty_clubs" then return end
          local skey, scount = MINTY.sleeveunlockcheck()
          if args and args.type == 'win_custom' and G.GAME.stake == scount then
              G.PROFILES[G.SETTINGS.profile].mintysleeves[self.key] = skey
              unlock_card(self)
          end
        end,
        locked_loc_vars = function (self, info_queue, card)
          stake_key = MINTY.sleeveunlockcheck(self.key)
          local colours = G.C.GREY
          if stake_key ~= "stake_white" then
              colours = get_stake_col(SMODS.Stakes[stake_key].order)
          end
          return {
            key = "sleeve_locked",
            vars = {
              localize{type = "name_text", set = "Back", key = "b_minty_clubs"},
              localize{type = "name_text", set = "Stake", key = stake_key},
              colours = {colours}
            }
          }
        end,
        loc_vars = function(self)
            MINTY.sleeveunlockcheck()
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
                      key = 'j_fuse_club_wizard',
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