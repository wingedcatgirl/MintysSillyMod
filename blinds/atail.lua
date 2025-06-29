SMODS.Blind({
    key = "tail",
    atlas = 'blinds',
    pos = { x=0, y=7 },
    dollars = 5,
    mult = 1.5,
    big = { min = 1 },
    boss_colour = HEX("e778db"),
    config = {
        extra = {
            disc = 1
        },
    },
    loc_vars = function (self)
        return {
            vars = {
                self.config.extra.disc
            }
        }
    end,
    collection_loc_vars = function (self)
        return self:loc_vars()
    end,
    set_blind = function (self)
        G.GAME.round_resets.taildisc = true
        SMODS.change_discard_limit(-self.config.extra.disc)
    end,
    calculate = function (self, blind, context)
        if context.pre_discard and G.GAME.round_resets.taildisc then
            G.GAME.round_resets.taildisc = false
            SMODS.change_discard_limit(self.config.extra.disc)
            return {
                message = localize('k_reset'),
            }
        end
    end,
    disable = function (self)
        if G.GAME.round_resets.taildisc then
            G.GAME.round_resets.taildisc = false
            SMODS.change_discard_limit(self.config.extra.disc)
        end
    end,
    defeat = function (self)
        self:disable()
    end
})