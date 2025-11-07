local mf = (SMODS.Mods["MoreFluff"] or {}).can_load

SMODS.Enhancement({
    key = "garbled",
    name = "Garbled Card",
    atlas = "enhance",
    set = "Enhanced",
    pos = {
        x = 1,
        y = 0
    },
	object_type = "Enhancement",
	badge_colour = HEX("a3ecc0"), --Magic Mint, according to internet
    config = {
        extra = {
            min = 0,
            max = 23,
            gymboost = "mult"
        },
    },
    valk_hand_buff = {
        title = "fB*&@@Pe%$3%%", --todo, dynatext this misprint style?
        colour = HEX("3cb342"),
        scoring_func = function (power)
            local mult = pseudorandom(pseudoseed("minty_garbled_handbuff"), power, power * 100)

            return {
                mult = mult
            }
        end
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            },
        }
    end,
    get_weight = function (self)
        local default = 5
        return mf and default or default/2
    end,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    calculate = function (self, card, context)
        if (context.main_scoring and context.cardarea == G.play) or context.forcetrigger then
            local mult = pseudorandom("minty_garbled", card.ability.extra.min, card.ability.extra.max)

            if mult > 0 then
                return {
                    mult = mult
                }
            end
        end
    end,
})