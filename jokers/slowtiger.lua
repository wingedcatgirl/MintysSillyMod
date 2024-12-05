SMODS.Joker {
    key = "slowtiger",
    name = "Slow Tiger",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 4,
        y = 1
    },
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = true,
    config = { extra = {mult = 1, lastround = 0, multgain = 1} },
    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.mult = G.GAME.round or 1
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.extra.multgain} }
    end,
    loc_txt = {
        name = "Slow Tiger",
        text = {
            "{C:mult}+#2#{} Mult",
            "per round",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult){}"}
    },
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand then
            return {
                    mult_mod = card.ability.extra.mult,
                    message = localize {
                        type = 'variable',
                        key = 'a_mult',
                        vars = { card.ability.extra.mult }
                    },
                    card = card
                   }
        end


        if context.end_of_round and not context.blueprint and card.ability.extra.lastround ~= G.GAME.round then
            card.ability.extra.lastround = G.GAME.round
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multgain
            return {
                message = localize {
                    type = 'variable',
                    key = 'a_mult',
                    vars = { card.ability.extra.multgain }
                },
            }
        end                  
    end
}