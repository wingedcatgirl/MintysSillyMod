SMODS.Joker {
    key = "wildsupport",
    name = "Wild Support",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 4,
        y = 2
    },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {extra = {mult = 4, xmult = 1.2, chips = 45, cash = 3, odds = 4, multgain = 1, xmultgain = 0.1, chipsgain = 15, cashgain = 1}},
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.mult, card.ability.extra.xmult, card.ability.extra.chips, card.ability.extra.cash, card.ability.extra.odds, card.ability.extra.multgain, card.ability.extra.xmultgain, card.ability.extra.chipsgain, card.ability.extra.cashgain}
        }
    end,
    calculate = function(self, card, context)
        if context.individual then
            if context.cardarea == G.play then
                if SMODS.has_any_suit(context.other_card) and (G.GAME.probabilities.normal >= 1) then
                    local bonuses = {'mult', 'xmult', 'chips', 'cash'}
                    local result = {card = card}
                    local luck = math.floor(G.GAME.probabilities.normal)
                    sendDebugMessage('[Minty] Luck = '..luck)
                    for go=1, math.min(luck, 4) do
                        local roll = pseudorandom_element(bonuses)
                        for i, v in ipairs(bonuses) do
                            if v == roll then
                                table.remove(bonuses, i) -- Remove the drawn element
                                break
                            end
                        end
                        if roll == "mult" then
                            result["mult"] = pseudorandom('wildmult', 1, card.ability.extra.mult)
                            if pseudorandom('wildmultgain') < G.GAME.probabilities.normal/card.ability.extra.odds then
                                result["message"] = localize('k_upgrade_ex')
                                result["message_card"] = card
                                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multgain
                            end
                        end
                        if roll == "xmult" then
                            result["xmult"] = pseudorandom('wildxmult', 10, (card.ability.extra.xmult*10))/10
                            if pseudorandom('wildxmultgain') < G.GAME.probabilities.normal/card.ability.extra.odds then
                                result["message"] = localize('k_upgrade_ex')
                                result["message_card"] = card
                                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultgain
                            end
                        end
                        if roll == "chips" then
                            result["chips"] = pseudorandom('wildchips', 1, card.ability.extra.chips)
                            if pseudorandom('wildchipsgain') < G.GAME.probabilities.normal/card.ability.extra.odds then
                                result["message"] = localize('k_upgrade_ex')
                                result["message_card"] = card
                                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsgain
                            end
                        end
                        if roll == "cash" then
                            result["dollars"] = pseudorandom('wildcash', 1, card.ability.extra.cash)
                            if pseudorandom('wildcashgain') < G.GAME.probabilities.normal/card.ability.extra.odds then
                                result["message"] = localize('k_upgrade_ex')
                                result["message_card"] = card
                                card.ability.extra.cash = card.ability.extra.cash + card.ability.extra.cashgain
                            end
                        end
                    end
                    return result
                end
            end
        end
    end
}