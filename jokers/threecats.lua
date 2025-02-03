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
    config = {
        extra = {
            chips = 33,
            mult = 13,
            xmult = 3,
            again = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        local luck = math.min((G.GAME and G.GAME.probabilities.normal or 1), 3)
        return {
            key = key,
            vars = {luck, card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult}
        }
    end,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and context.other_card:is_3() then
            local count = context.other_card:is_3()
            card.ability.extra.again = count - 1
            local bonuses = {'mult', 'xmult', 'chips'}
            local result = {card = card}
            local luck = math.floor(G.GAME.probabilities.normal)
            for go=1, math.min(luck, 3) do
                local roll = pseudorandom_element(bonuses)
                for i, v in ipairs(bonuses) do
                    if v == roll then
                        table.remove(bonuses, i) -- Remove the drawn element
                        break
                    end
                end
                if roll == "mult" then
                    result["mult"] = card.ability.extra.mult
                end
                if roll == "xmult" then
                    result["xmult"] = card.ability.extra.xmult
                end
                if roll == "chips" then
                    result["chips"] = card.ability.extra.chips
                end
            end
            return result
        end

        if context.retrigger_joker_check and card.ability.extra.again ~= 0 and context.other_card == card then
            local again = card.ability.extra.again
            card.ability.extra.again = 0
            return {
                message = localize("k_again_ex"),
                message_card = card,
                repetitions = again,
            }
        end
    end
}
