SMODS.Back({
    name = "Deck of the Spade",
    key = "spades",
    pos = { x = 3, y = 1 },
    atlas = "backs",
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
        atlas = "sleeves",
        pos = { x = 3, y = 1 },
        config = {},
        unlocked = false,
        check_for_unlock = function (self, args)
          if not (G and G.GAME) then return end
          if self.get_current_deck_key() ~= "b_minty_spades" then return end
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
              localize{type = "name_text", set = "Back", key = "b_minty_spades"},
              localize{type = "name_text", set = "Stake", key = stake_key},
              colours = {colours}
            }
          }
        end,
        loc_vars = function(self)
            MINTY.sleeveunlockcheck()
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
                      key = 'j_fuse_spade_archer',
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