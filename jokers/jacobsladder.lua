SMODS.Joker {
    key = "jacobsladder",
    name = "Jacob's Ladder",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 3,
        y = 4
    },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        immutable = {
            req = 5
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.immutable.req
            },
        }
    end,
    in_pool = function (self, args)
        if G and (G.GAME.selected_back.effect.center.key == "b_plasma") then return false else return true end
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step and context.cardarea == G.jokers then
            MINTY.say("joekr")
            local suits = {}
            for _,v in ipairs(SMODS.Suit.obj_buffer) do
                suits[v] = false
            end
            for i = 1, #context.scoring_hand do
                local looking = context.scoring_hand[i]
                if not SMODS.has_any_suit(looking) then
                    for k,_ in pairs(suits) do
                        if looking:is_suit(k) and suits[k] == false then
                            suits[k] = true
                            break
                        end
                    end
                end
            end
            for i = 1, #context.scoring_hand do
                local looking = context.scoring_hand[i]
                if SMODS.has_any_suit(looking) then
                    for k,_ in pairs(suits) do
                        if suits[k] == false then
                            suits[k] = true
                            break
                        end
                    end
                end
            end
            local count = 0
            for k,_ in pairs(suits) do
                if suits[k] then count = count+1 end
            end
            MINTY.say(tostring(count))
            if count >= card.ability.immutable.req then
                return {
                    balance = true
                }
            end
        end
    end
}