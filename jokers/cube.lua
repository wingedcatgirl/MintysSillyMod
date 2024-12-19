
SMODS.Joker {
    key = "cube",
    name = "Cube Joker",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 5,
        y = 0
    },
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {extra = {Xmult = 4}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.Xmult}
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand then
            return {
                message = localize {
                    type = 'variable',
                    key = 'a_xmult',
                    vars = { card.ability.extra.Xmult }
                },
                colour = G.C.RED,
                Xmult_mod = card.ability.extra.Xmult
            }
        end
    end
}

local debuff_hand_ref = Blind.debuff_hand

function Blind:debuff_hand(cards, hand, handname, check)
    debuff_hand_ref(self, cards, hand, handname, check)
    if next(find_joker('Cube Joker')) then
        if #cards ~= 4 then
            return true
        end
    end
	return debuff_hand_ref(self, cards, hand, handname, check)
end