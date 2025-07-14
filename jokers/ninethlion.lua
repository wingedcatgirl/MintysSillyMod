FusionJokers.fusions:add_fusion("j_minty_ascetic", nil, false, "j_minty_sabertooth", nil, false, "j_minty_ninethlion", 12)

SMODS.Joker {
    key = "ninethlion",
    name = "Nineth Lion",
    atlas = 'ortalabplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 2,
        y = 0
    },
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    pools = {
        ["Ortalab"] = true, --Can appear on Ortalab Stakes; technically irrelevant as this can't naturally spawn anyway
        ["kity"] = true,
    },
    config = {
        extra = {
            odds = 3,
            suit = 'minty_3s',
            xmult = 2,
            again = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        local unluck, odds = SMODS.get_probability_vars(self, 1, card.ability.extra.odds, "minty_nineth_desc", false)
        return {
            key = key,
            vars = {
                unluck,
                odds,
                localize(card.ability.extra.suit, "suits_plural"),
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        -- Calculation goes here
    end
}