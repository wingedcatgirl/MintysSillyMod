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
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.Xmult}
        }
    end,
    config = {extra = {Xmult = 5}},
    loc_txt = {
        name = "Prosopagnosia",
        text = {"{X:mult,C:white} X#1# {} Mult if hand",
                "contains {C:attention}face{} cards,",
                "but {C:attention}no{} cards are",
                "considered face cards.",
                " ",
                "{C:inactive}You don't know what it's",
                "{C:inactive}like to spend every day",
                "{C:inactive}surrounded by monkeys."}
    },
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