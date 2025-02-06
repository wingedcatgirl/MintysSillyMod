SMODS.Joker {
    key = "excited",
    name = "Overly Excited",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 2
    },
    rarity = 1,
    cost = 6,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = true,
    pools = {["Meme"] = true}, -- Cryptid compatibility for refactor
    config = {extra = {chips = 0, chipgain = 1, mult = 0, multgain = 1, odds = 32}},
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {card.ability.extra.chips, card.ability.extra.chipgain, card.ability.extra.mult, card.ability.extra.multgain, card.ability.extra.odds, ''..(G.GAME and G.GAME.probabilities.normal or 1)}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand then
            local result = {
                    card = card
                   }
            if (card.ability.extra.mult == 0 and card.ability.extra.chips == 0) then --Is this even possible?
                return
            end
            if card.ability.extra.mult ~= 0 then 
                result["mult"] = card.ability.extra.mult
            end
            if card.ability.extra.chips ~= 0 then 
                result["chips"] = card.ability.extra.chips
            end
            return result
        end
        if
			(-- Mostly copied from Cryptid's "sob" and "Duplicare"
                (context.post_trigger and context.other_card ~= card)
                or (context.cardarea == G.play and context.individual)
				or context.discard 
				or context.reroll_shop 
				or context.buying_card 
				or context.skip_blind 
				or context.using_consumeable
				or context.selling_card 
				or context.setting_blind 
				or context.skipping_booster 
				or context.open_booster 
			)
			and not context.retrigger_joker
			and not context.blueprint
		then
            roll = pseudorandom('excited')
            if roll > G.GAME.probabilities.normal/card.ability.extra.odds then 
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipgain
                return {
                    delay = 0.2,
                    colour = G.C.CHIPS,
                    message = localize {
                        type = 'variable',
                        key = 'a_chipgain',
                        vars = { card.ability.extra.chipgain },
                    },
                    message_card = card
                }
            else
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multgain
                return {
                    delay = 0.2,
                    colour = G.C.RED,
                    message = localize {
                        type = 'variable',
                        key = 'a_mult',
                        vars = { card.ability.extra.multgain },
                    },
                    message_card = card
                }
            end
		end
    end
}

if (SMODS.Mods["Cryptid"] or {}).can_load then
    table.insert(Cryptid.memepack, "j_minty_excited")
end