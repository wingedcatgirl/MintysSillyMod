SMODS.Joker {
    key = "youtube",
    name = "YouTube",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 2,
        y = 6
    },
    rarity = 3,
    cost = 9,
    unlocked = false,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = false,
    config = {
        extra = {
            min = 12,
            max = 500,
            xmult = 12, --Placeholder value, should get overwritten immediately,
            req = 1000
        }
    },
    set_ability = function (self, card, initial, delay_sprites)
        card.ability.extra.xmult = pseudorandom("minty_youtube_value", card.ability.extra.min, card.ability.extra.max)
    end,
    check_for_unlock = function (self, args)
        if args and args.type == "round_win" then
            if G.GAME.blind:get_type() == "Boss" and to_big(G.GAME.chips) >= to_big(G.GAME.blind.chips * self.config.extra.req) then
                unlock_card(self)
                return true
            end
        end
    end,
    locked_loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.req
            }
        }
    end,
    loc_vars = function(self, info_queue, card)
        local key = self.key
        local luck, odds = SMODS.get_probability_vars("minty_youtube_desc", 1, card.ability.extra.xmult, "minty_youtube_desc", false)
        local ev = ((card.ability.extra.xmult-1) * (luck/odds)) + 1
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
            if ev > 9 then key = key.."_alt" end
        end
        return {
            key = key,
            vars = {
                luck, odds,
                card.ability.extra.xmult,
                ev
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and SMODS.pseudorandom_probability(card, "minty_youtube", 1, card.ability.extra.xmult, "minty_youtube") then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}

-- See localization/en-us.lua to create joker text