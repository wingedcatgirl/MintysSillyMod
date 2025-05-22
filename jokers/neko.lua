SMODS.Joker {
    key = "neko",
    name = "neko.exe",
    atlas = 'neko',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    rarity = 2,
    cost = 8,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    pools = {
        ["kity"] = true
    },
    config = {
        extra = {
            chips = 133,
            state = "wait",
            lastsprite = {
                "wait", 0
            },
            motion = {
                dir = "none",
                duration = 0
            }
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
                card.ability.extra.chips
            }
        }
    end,
    in_pool = function (self, args)
        if AKYRS and AKYRS.card_any_drag() then return false end --Aikoyori if you want to put in a PR to let the kitty run in all zones please do, because I do not know how to begin figuring that out 
        return true
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    update = function (self, card, dt)
        if true then return end --dummy out all this for now 
        G.nekoframe = (G.nekoframe or 0) + dt
        if G.nekoframe > (G.SETTINGS.GAMESPEED * 0.25) then
            G.nekoframe = 0
            card.ability.extra.motion.duration = card.ability.motion.duration + 1
        else
            return
        end
        local states = {
            --state name = soul x pos 
            wait = 1,
            wash = 2,
            scratchself = 3,
            yawn = 4,
            nap = 5,
            alert = 6,
            chasedown = 7,
            chasedownright = 8,
            chaseright = 9,
            chaseupright = 10,
            chaseup = 11,
            chaseupleft = 12,
            chaseleft = 13,
            chasedownleft = 14,
            scratchd = 15,
            scratchr = 16,
            scratchu = 17,
            scratchl = 18,
        }
        local jokerref = card.config.center


        -- locate position of mouse relative to joker sprite
        local mousepos = {}
        mousepos.x, mousepos.y = love.mouse.getPosition()
        local jokerpos = {}
        --get joker sprite pos with some love2d thing presumably
        --math out which 8-way direction it is
        

        -- update joker state based on this info 
        local joker_slot = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                joker_slot = i
                break
            end
        end
        local leftmost = (joker_slot == 1)
        local rightmost = (joker_slot == #G.jokers.cards)
        -- TBA

        -- update soul sprite based on state
        jokerref.soul_pos.x = states[card.ability.extra.state]

        if (card.ability.extra.state ~= "wait"
        and card.ability.extra.state ~= "yawn"
        and card.ability.extra.state ~= "alert")
        then
            jokerref.soul_pos.y = math.fmod(jokerref.soul_pos.y+1, 2)
        end
        --MINTY.say(tostring(jokerref.soul_pos.y), "TRACE")

        -- move joker to left or right if it's been in one of the lateral chase states long enough
        local lastdir = card.ability.extra.motion.dir
        --get current direction and reset tracking if it's changed
        if string.find(card.ability.extra.state, "left") then
            if lastdir ~= "left" then card.ability.extra.motion = {
                dir = "left",
                duration = 0
            }
            end
        elseif string.find(card.ability.extra.state, "right") then
            if lastdir ~= "right" then card.ability.extra.motion = {
                dir = "right",
                duration = 0
            }
            end
        else
            if lastdir ~= "none" then
                card.ability.extra.motion = {
                    dir = "none",
                    duration = 0
                }
            end
        end

        if card.ability.extra.motion.duration == 5 and lastdir ~= "none" then --it's been running long enough
            if not leftmost and lastdir == "left" then
                G.jokers.cards[joker_slot-1], G.jokers.cards[joker_slot] = G.jokers.cards[joker_slot], G.jokers.cards[joker_slot-1]
            elseif not rightmost and lastdir == "right" then
                G.jokers.cards[joker_slot], G.jokers.cards[joker_slot-1] = G.jokers.cards[joker_slot-1], G.jokers.cards[joker_slot]
            end
        end

        if card.ability.extra.lastsprite ~= {card.ability.extra.state, jokerref.soul_pos.y} then
            card.ability.extra.lastsprite = {card.ability.extra.state, jokerref.soul_pos.y}
            card:set_sprites(jokerref)
        end
    end
}

-- See localization/en-us.lua to create joker text