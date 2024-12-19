FusionJokers.fusions:add_fusion("j_minty_hedonist", nil, false, "j_minty_claw", nil, false, "j_minty_threecats", 12)


SMODS.Joker {
    dependencies = "FusionJokers",
    key = "threecats",
    name = "Three Cats!",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
        },
    soul_pos = {
        x = 2,
        y = 1
        },
    rarity = 'fusion',
    cost = 12,
    config = {extra = {chips = 33, mult = 13, odds = 3, Xmult = 3}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.Xmult}
        }
    end,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.cardarea == G.play then   
            if context.other_card:is_suit("minty_3s") or context.other_card:get_id() == 3 then
                    local roll = pseudorandom_element({'amult', 'chips', 'xmult'})
                    if context.other_card:is_suit("minty_3s") and context.other_card:get_id() == 3 then
                        if roll == 'amult' then
                            return {
                                mult = card.ability.extra.mult,
                                card = card,
                                message = localize('k_again_ex'),
                                repetitions = 1
                            }
                        elseif roll == 'chips' then
                            return {
                                chips = card.ability.extra.chips,
                                card = card,
                                message = localize('k_again_ex'),
                                repetitions = 1
                            }
                        elseif roll == 'xmult' then
                            return {
                                x_mult = card.ability.extra.Xmult,
                                card = card,
                                message = localize('k_again_ex'),
                                repetitions = 1
                            }
                        end
                    else
                        if roll == 'amult' then
                            return {
                                mult = card.ability.extra.mult,
                                card = card
                            }
                        elseif roll == 'chips' then
                            return {
                                chips = card.ability.extra.chips,
                                card = card
                            }
                        elseif roll == 'xmult' then
                            return {
                                x_mult = card.ability.extra.Xmult,
                                card = card
                            }
                        end
                    end
                end
            end
        end
}
