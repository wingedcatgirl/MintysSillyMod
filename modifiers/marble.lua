SMODS.Enhancement({
    key = "marble",
    name = "Marble Card",
    atlas = "enhance",
    set = "Enhanced",
    pos = {
        x = 0,
        y = 0
    },
	object_type = "Enhancement",
	badge_colour = HEX("a3ecc0"), --Magic Mint, according to internet
    config = {
        p_dollars = 1,
        bonus = 15,
        mult = 1,
        extra = {
            gymboost = "cash"
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.p_dollars,
                card.ability.bonus,
                card.ability.mult,
            },
        }
    end,
    replace_base_card = true,
    no_rank = true,
    any_suit = true,
})

local debuffcardref = Card.set_debuff
function Card:set_debuff(should_debuff)
    if self.ability.name == "m_minty_marble" then
        self.debuff = false
        return
    end
        return debuffcardref(self, should_debuff)
end