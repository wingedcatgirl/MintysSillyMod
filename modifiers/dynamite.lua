SMODS.Enhancement({
    key = "dynamite",
    name = "Dynamite Card",
    atlas = "enhance",
    set = "Enhanced",
    pos = {
        x = 3,
        y = 1
    },
	object_type = "Enhancement",
	badge_colour = HEX("a3ecc0"), --Magic Mint, according to internet
    config = {
        extra = {
            percent = 20,
            gymboost = "random"
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percent
            },
        }
    end,
    calculate = function (self, card, context)
        if (context.main_scoring and context.cardarea == G.play) or context.forcetrigger then
            card.kablooied = true
            return {
                remove = true,
                message = localize("k_minty_kaboom"),
                sound = "minty_explosion",
                func = function ()
                    local final_chips = to_big((G.GAME.blind.chips / 100) * (100 - card.ability.extra.percent))
                    G.GAME.blind.chips = final_chips
                    G.E_MANAGER:add_event(Event({trigger = 'after', blocking = true, func = function()
                        G.GAME.blind:juice_up()
                        G.GAME.blind.chip_text = number_format(final_chips)
                        return true
                    end}))
                end
            }
        end

        if context.destroy_card and context.destroy_card == card and card.kablooied then
            return {
                remove = true
            }
        end
    end
})