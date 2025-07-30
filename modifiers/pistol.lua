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
        if MINTY.in_collection(card) and not (mf or MINTY.config.dev_mode) then
            info_queue[#info_queue+1] = { set = "Other", key = "minty_disabled_object", specific_vars = { "Mod", "More Fluff" } }
        end
        return {
            vars = {
                card.ability.x_mult,
                luck,
                odds,
            },
        }
    end,
    in_pool = function (self, args)
        return (mf or MINTY.config.dev_mode)
    end,
    calculate = function (self, card, context)
        if context.forcetrigger then
            return {
                xmult = card.ability.x_mult
            }
        end

        if context.minty_pistolclick and (G.STATE == G.STATES.SELECTING_HAND or G.STATE == G.STATES.DRAW_TO_HAND) then
            --MINTY.say("Pistol card clicked, calculating!")
            local cards = {}
            for i = 1, #G.hand.highlighted do
                table.insert(cards, G.hand.highlighted[i])
            end
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