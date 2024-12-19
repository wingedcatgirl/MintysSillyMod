SMODS.Joker {
    key = "proso",
    name = "Prosopagnosia",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 3,
        y = 1
    },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.Xmult}
        }
    end,
    config = {extra = {Xmult = 5}},
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand then
            local faces = 0
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_face() then
                    faces = 1
                end
            end

            if faces == 1 then
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
    end
}

local isfaceref = Card.is_face

function Card:is_face(from_boss)
    if self.debuff and not from_boss then return end
    if next(find_joker("Prosopagnosia")) and not next(find_joker("Pareidolia")) then 
        return false 
    end
	return isfaceref(self, from_boss)
end