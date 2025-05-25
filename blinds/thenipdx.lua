SMODS.Blind {
    key = "thenipdx",
    dollars = 5,
    mult = 2,
    boss = { min = 9, max = 10, showdown = true },
    boss_colour = HEX("CA7CA7"),
    atlas = 'blinds',
    pos = { x=0, y=3 },
    discovered = false,
    debuff = {
        superboss = true,
        akyrs_blind_difficulty = "dx",
        akyrs_cannot_be_disabled = true,
    },
    recalc_debuff = function(self, card, from_blind)
        if not G.GAME.blind.disabled and card.area ~= G.jokers then
            local k = card:is_3()
            if k and k > 0 then
                return false
            end

            return true
        end
    end
}