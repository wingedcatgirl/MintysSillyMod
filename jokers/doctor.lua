local talisman = (SMODS.Mods.Talisman or {}).can_load

SMODS.Joker {
    key = "doctor",
    name = "Doctor",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 5,
        y = 5
    },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = true,
    demicoloncompat = true,
    config = {
        extra = {
            xmult = 12,
            emult = 3,
            countdown = 45,
            ready = false,
            talisman = talisman
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if card.ability.extra.countdown <= 0 then
            key = key.."_active"
        end
        local boost = card.ability.extra.talisman and "^"..card.ability.extra.emult or "X"..card.ability.extra.xmult
        local boostcol = card.ability.extra.talisman and G.C.DARK_EDITION or G.C.XMULT
        local s = card.ability.extra.countdown ~= 1 and "s" or ""
        if MINTY.config.flavor_text then
            key = key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.extra.countdown,
                boost,
                s,
                colours = {
                    boostcol
                }
            }
        }
    end,
    calculate = function(self, card, context)
        if context.forcetrigger then
            local ret = {}
            ret["xmult"] = (not talisman) and card.ability.extra.xmult or nil
            ret["emult"] = talisman and card.ability.extra.emult or nil
            ret["message"] = card.ability.extra.countdown > 0 and localize("k_minty_rescheduled") or nil
            card.ability.extra.countdown = card.ability.extra.countdown <= 0 and 0 or (30 + math.random(0, 30))
            return ret
        end

        if (context.after and not context.blueprint) and card.ability.extra.countdown > 0 then
            card.ability.extra.countdown = card.ability.extra.countdown - 1
            if card.ability.extra.countdown == 0 and not card.ability.extra.ready then
                card.ability.extra.ready = true
                return {
                    message = localize("k_minty_active"),
                    func = juice_card_until(
                        card,
                        function ()
                            return card.ability.extra.countdown > 0
                        end
                        )
                }
            end
        end

        if context.joker_main and card.ability.extra.countdown <= 0 then
            local ret = {}
            ret["xmult"] = (not talisman) and card.ability.extra.xmult or nil
            ret["emult"] = talisman and card.ability.extra.emult or nil
            return ret
        end

        if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
            local reschedule = SMODS.pseudorandom_probability(card, "minty_doctor_reschedule", card.ability.extra.countdown, 100, "minty_doctor_reschedule")
            if reschedule then
                card.ability.extra.countdown = card.ability.extra.countdown <= 0 and 0 or (30 + math.random(0, 30))
                return {
                    message = localize("k_minty_rescheduled")
                }
            end
        end
    end
}

-- See localization/en-us.lua to create joker text