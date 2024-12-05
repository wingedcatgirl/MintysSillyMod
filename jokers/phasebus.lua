SMODS.Joker {
    key = "phasebus",
    name = "Phase Bus",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    config = { extra = {status = 'Active', lastround = 0} },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.status} }
    end,
    loc_txt = {
        name = "Phase Bus",
        text = {
            "At end of round,",
            "create a {C:spectral}Spectral{} card",
            "if no {C:attention}face cards{}",
            "were played that round.",
            "{C:inactive}(Must have room){}",
            " ",
            "{C:inactive}(Currently: #1#!){}"}
    },
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand and card.ability.extra.status == 'Active' and not context.blueprint and not context.end_of_round then
            local faces = 0
            if not context.end_of_round then
                if type(context.scoring_hand) == 'table' then
                    for i = 1, #context.scoring_hand do
                        if context.scoring_hand[i]:is_face() then
                            faces = 1
                        end
                    end
                end
            end

            if faces == 1 then
                card.ability.extra.status = 'Inactive'
                return {
                    message = 'Stopped!',
                    colour = G.C.MONEY,
                    card = card,
                } 
            end
            return
        end


        if context.end_of_round and not context.blueprint and card.ability.extra.lastround ~= G.GAME.round then
            card.ability.extra.lastround = G.GAME.round
            if card.ability.extra.status == 'Active' then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                                local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'sea')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                                G.GAME.consumeable_buffer = 0
                            return true
                        end)}))
                    return {
                        message = localize('k_plus_spectral'),
                        colour = G.C.SECONDARY_SET.Spectral,
                        card = card
                    }
                end
            else 
                card.ability.extra.status = 'Active'
                return {
                    message = localize('k_reset'),
                    card = card
                }
            end
        end                  
    end
}