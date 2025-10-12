SMODS.Tag{
    key = "goading",
    atlas = "tags",
    pos = {
        x = 0,
        y = 0,
    },
    in_pool = function (self, args)
        return true
    end,
    apply = function (self, tag, context)
        --MINTY.say("Goading Tag trying to activate...")
        if not (context and context.type == "blind_defeated_check") then return end
        --MINTY.say("Context check passed...")
        if G.GAME.blind:get_type() ~= "Boss" then return end
        if to_number(G.GAME.current_round.hands_left) == 0 then
            tag:nope()
            return
        end
        --MINTY.say("Boss check passed...")
        local lock = tag.ID

        if to_big(G.GAME.chips) >= to_big(G.GAME.blind.chips) then
            G.CONTROLLER.locks[lock] = true
            G.hand_text_area.game_chips:juice_up()
            G.GAME.chips = 0
            tag:yep("!!!", G.C.PURPLE, function()
                card_eval_status_text(G.GAME.blind, 'extra', nil, percent, nil, { message = localize("k_again_ex")})
                --play revival sound. i'm imagining ripping it from xiv but lel
                MINTY.event(function ()
                    SMODS.add_card{
                        set = "minty_treat",
                        key_append = "minty_goaded"
                    }
                    return true
                end)
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}