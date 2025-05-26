SMODS.Back({
    name = "Deck With A Treat",
    key = "treat",
    pos = { x = 0, y = 0 },
    atlas = "backs",
    unlocked = true,
    config = {start_with_3s = true},

    apply = function()
        MINTY.enable_threeSuit()
        G.GAME.starting_params.easy_spectra = true
    end,
})


if (SMODS.Mods["CardSleeves"] or {}).can_load then
    CardSleeves.Sleeve({
        key = "treatsleeve",
        name = "Sleeve With A Treat",
        atlas = "sleeves",
        pos = { x = 0, y = 0 },
        config = {start_with_3s = true},
        unlocked = false,
        check_for_unlock = function (self, args)
          if not (G and G.GAME) then return end
          if self.get_current_deck_key() ~= "b_minty_treat" then return end
          local skey, scount = MINTY.sleeveunlockcheck()
          if args and args.type == 'win_custom' and G.GAME.stake == scount then
              MINTY.nextSleeveUnlock[self.key] = skey
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
              localize{type = "name_text", set = "Back", key = "b_minty_treat"},
              localize{type = "name_text", set = "Stake", key = stake_key},
              colours = {colours}
            }
          }
        end,
        loc_vars = function(self)
            MINTY.sleeveunlockcheck()
            local key, vars

            if self.get_current_deck_key() ~= "b_minty_treat" then
                key = self.key
            else
                key = self.key.."_alt"
            end

            return { key = key, vars = vars }
        end,
        apply = function(self)
            if not MINTY.threeSuit_in_pool() then MINTY.enable_threeSuit() end
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