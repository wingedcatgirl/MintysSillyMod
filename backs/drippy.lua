SMODS.Back{
    key = "drippy",
    pos = { x = 0, y = 2 },
    atlas = "backs",
    unlocked = true,
    config = {},
    calculate = function (self, back, context)
        if context.modify_scoring_hand then
            return {
                add_to_hand = true,
            }
        end
    end
}

if (SMODS.Mods["CardSleeves"] or {}).can_load then
    CardSleeves.Sleeve({
        key = "drippysleeve",
        name = "Drippy Sleeve",
        atlas = "sleeves",
        pos = { x = 0, y = 2 },
        config = {},
        unlocked = false,
        check_for_unlock = function (self, args)
            if not (G and G.GAME) then return end
            if self.get_current_deck_key() ~= "b_minty_drippy" then return end
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
                localize{type = "name_text", set = "Back", key = "b_minty_drippy"},
                localize{type = "name_text", set = "Stake", key = stake_key},
                colours = {colours}
                }
            }
        end,
        loc_vars = function(self)
            MINTY.sleeveunlockcheck()
            local key, vars

            if self.get_current_deck_key() ~= "b_minty_drippy" then
                key = self.key
            else
                key = self.key.."_alt"
            end

            return { key = key, vars = vars }
        end,
        calculate = function (self, sleeve, context)
            if context.modify_scoring_hand then
                return {
                    add_to_hand = true,
                }
            end

            if self.get_current_deck_key() == "b_minty_drippy" and context.minty_omegasplash then
                return {
                    add_to_hand = true,
                }
            end
        end
    })
end