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
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            chips = 333,
            state = "wait",
            lastsprite = {
                "wait", 0
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
            scratchdown = 15,
            scratchright = 16,
            scratchup = 17,
            scratchleft = 18,
        }
        local jokerref = card.config.center


        -- locate position of mouse relative to joker sprite 

        -- update joker state based on this info 

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

        if card.ability.extra.lastsprite ~= {card.ability.extra.state, jokerref.soul_pos.y} then
            card.ability.extra.lastsprite = {card.ability.extra.state, jokerref.soul_pos.y}
            card:set_sprites(jokerref)
        end
    end
}

-- See localization/en-us.lua to create joker text