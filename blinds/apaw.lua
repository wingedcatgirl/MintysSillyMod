SMODS.Blind({
    key = "paw",
    atlas = 'blinds',
    pos = { x=0, y=6 },
    dollars = 5,
    mult = 1.5,
    big = { min = 1 },
    boss_colour = HEX("82cfcb"),
    config = {
        extra = {
            play = 1
        },
    },
    loc_vars = function (self)
        return {
            vars = {
                self.config.extra.play
            }
        }
    end,
    collection_loc_vars = function (self)
        return self:loc_vars()
    end,
    calculate = function (self, blind, context)
        if context.setting_blind then
            G.GAME.round_resets.pawplay = true
            SMODS.change_play_limit(-self.config.extra.play)
        end
        if (context.after or context.selling_card) and G.GAME.round_resets.pawplay then
            G.GAME.round_resets.pawplay = false
            SMODS.change_play_limit(self.config.extra.play)
            if context.selling_card then
                return {
                    message = localize('k_reset'),
                    message_card = context.card
                }
            else
                return {
                    message = localize('k_reset'),
                }
            end
        end
    end,
    disable = function (self)
        if G.GAME.round_resets.pawplay then
            G.GAME.round_resets.pawplay = false
            SMODS.change_play_limit(self.config.extra.play)
        end
    end,
    defeat = function (self)
        self:disable()
    end
})