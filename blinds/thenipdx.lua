SMODS.Blind {
    key = "thenipdx",
    dollars = 5,
    mult = 2,
    boss = { min = 9, max = 10 },
    boss_colour = HEX("CA7CA7"),
    atlas = 'mintyblinds',
    pos = { x=0, y=0 },
    discovered = false,
    debuff = {
        superboss = true,
        akyrs_blind_difficulty = "dx",
        akyrs_cannot_be_disabled = true,
    },
    recalc_debuff = function(self, card, from_blind)
        local k = card:is_3()
        if k and k > 0 then
            return false
        end

        return true
    end
}