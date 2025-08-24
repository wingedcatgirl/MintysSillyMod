local mf = (SMODS.Mods["MoreFluff"] or {}).can_load

SMODS.Enhancement({
    key = "pistol",
    name = "Pistol Card",
    atlas = "enhance",
    set = "Enhanced",
    pos = {
        x = 1,
        y = 1
    },
	object_type = "Enhancement",
	badge_colour = HEX("a3ecc0"), --Magic Mint, according to internet
    config = {
        x_mult = 2,
        extra = {
            odds = 10
        }
    },
    loc_vars = function(self, info_queue, card)
        local luck, odds = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "minty_pistol_desc", false)
        return {
            vars = {
                card.ability.x_mult,
                luck,
                odds,
            },
        }
    end,
    calculate = function (self, card, context)
        if context.forcetrigger then
            return {
                xmult = card.ability.x_mult
            }
        end

        if context.minty_pistolclick and (G.STATE == G.STATES.SELECTING_HAND or G.STATE == G.STATES.DRAW_TO_HAND) then
            if context.clicked_card ~= card then return end
            if not card.highlighted then return end
            --MINTY.say("Pistol card clicked, calculating!")
            local cards = {}
            local clicked = false
            for i = 1, #G.hand.highlighted do
                table.insert(cards, G.hand.highlighted[i])
                if G.hand.highlighted[i] == card then clicked = true end
            end
            if not clicked then return end
            if #cards > 0 and SMODS.pseudorandom_probability(card, 'minty_pistolshot', 1, card.ability.extra.odds, 'minty_pistolshot') then
                for i = 1, #cards do
                    if not cards[i].highlighted then
                        cards[i]:highlight()
                    end
                end
                if G.hand.highlighted then
                    G.FUNCS.play_cards_from_highlighted()
                end
                return {
                    message = localize('k_minty_bang'),
                    colour = G.C.RED,
                    func = function ()
                        play_sound("minty_gunshot")
                        card:juice_up(1,1)
                    end,
                    instant = true
                }
            end
        end
    end
})