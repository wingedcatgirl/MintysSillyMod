SMODS.Joker {
    key = "wildsupport",
    name = "Wild Support",
    atlas = 'jokerdoodles',
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
    demicoloncompat = true,
    config = {
        extra = {
            mult = 4,
            xmult = 1.2,
            chips = 45,
            cash = 3,
            odds = 4,
            multgain = 1,
            xmultgain = 0.1,
            chipsgain = 15,
            cashgain = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        local luck, odds = SMODS.get_probability_vars(self, 1, card.ability.extra.odds, "minty_wildsupport_desc", false)
        return {
            key = key,
            vars = {
                luck,
                card.ability.extra.mult,
                card.ability.extra.xmult,
                card.ability.extra.chips,
                card.ability.extra.cash,
                odds,
                card.ability.extra.multgain,
                card.ability.extra.xmultgain,
                card.ability.extra.chipsgain,
                card.ability.extra.cashgain
            }
        }
    end,
    calculate = function(self, card, context)
        if context.forcetrigger then
            local mult = pseudorandom('minty_wildmult', 1, card.ability.extra.mult)
            local xmult = pseudorandom('minty_wildxmult', 10, (card.ability.extra.xmult*10))/10
            local chips = pseudorandom('minty_wildchips', 1, card.ability.extra.chips)
            local cash = pseudorandom('minty_wildcash', 1, card.ability.extra.cash)
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_value = "multgain",
                scaling_message = {
                    message = localize('k_upgrade_ex')
                }
            })
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmultgain",
                scaling_message = {
                    message = localize('k_upgrade_ex')
                }
            })
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "chips",
                scalar_value = "chipsgain",
                scaling_message = {
                    message = localize('k_upgrade_ex')
                }
            })
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "cash",
                scalar_value = "cashgain",
                scaling_message = {
                    message = localize('k_upgrade_ex')
                }
            })
            return {
                mult = mult,
                xmult = xmult,
                chips = chips,
                dollars = cash,
            }
        end

        if context.individual then
            if context.cardarea == G.play then
                local luck, odds = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "minty_wildsupport_roll", true)
                if SMODS.has_any_suit(context.other_card) and (luck >= 1) then
                    local bonuses = {'mult', 'xmult', 'chips', 'cash'}
                    local result = {card = card}
                    luck = math.floor(luck)
                    --sendDebugMessage('[Minty] Luck = '..luck)
                    for go=1, math.min(luck, 4) do
                        local roll = pseudorandom_element(bonuses)
                        for i, v in ipairs(bonuses) do
                            if v == roll then
                                table.remove(bonuses, i) -- Remove the drawn element
                                break
                            end
                        end
                        if roll == "mult" then
                            result["mult"] = pseudorandom('minty_wildmult', 1, card.ability.extra.mult)
                            if SMODS.pseudorandom_probability(card, 'minty_wildmultgain', 1, card.ability.extra.odds, 'minty_wildmultgain') and not context.blueprint then
                                SMODS.scale_card(card, {
                                    ref_table = card.ability.extra,
                                    ref_value = "mult",
                                    scalar_value = "multgain",
                                    scaling_message = {
                                        message = localize('k_upgrade_ex')
                                    }
                                })
                            end
                        end
                        if roll == "xmult" then
                            result["xmult"] = pseudorandom('minty_wildxmult', 10, (card.ability.extra.xmult*10))/10
                            if SMODS.pseudorandom_probability(card, 'minty_wildxmultgain', 1, card.ability.extra.odds, 'minty_wildxmultgain') and not context.blueprint then
                                SMODS.scale_card(card, {
                                    ref_table = card.ability.extra,
                                    ref_value = "xmult",
                                    scalar_value = "xmultgain",
                                    scaling_message = {
                                        message = localize('k_upgrade_ex')
                                    }
                                })
                            end
                        end
                        if roll == "chips" then
                            result["chips"] = pseudorandom('minty_wildchips', 1, card.ability.extra.chips)
                            if SMODS.pseudorandom_probability(card, 'minty_wildchipsgain', 1, card.ability.extra.odds, 'minty_wildchipsgain') and not context.blueprint then
                                SMODS.scale_card(card, {
                                    ref_table = card.ability.extra,
                                    ref_value = "chips",
                                    scalar_value = "chips",
                                    scaling_message = {
                                        message = localize('k_upgrade_ex')
                                    }
                                })
                            end
                        end
                        if roll == "cash" then
                            result["dollars"] = pseudorandom('minty_wildcash', 1, card.ability.extra.cash)
                            if SMODS.pseudorandom_probability(card, 'minty_wildcashgain', 1, card.ability.extra.odds, 'minty_wildcashgain') and not context.blueprint then
                                SMODS.scale_card(card, {
                                    ref_table = card.ability.extra,
                                    ref_value = "cash",
                                    scalar_value = "cashgain",
                                    scaling_message = {
                                        message = localize('k_upgrade_ex')
                                    }
                                })
                            end
                        end
                    end
                    return result
                end
            end
        end
    end
}