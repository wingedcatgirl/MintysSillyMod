SMODS.Blind {
    key = "thenip",
    dollars = 5,
    mult = 2,
    boss = { min = 3, max = 10 },
    boss_colour = HEX("CA7CA7"),
    atlas = 'blinds',
    pos = { x=0, y=0 },
    discovered = false,
    recalc_debuff = function(self, card, from_blind)
        local k = card:is_3()
        if k and k > 0 then
            return true
        end

        return false
    end
}