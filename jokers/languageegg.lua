SMODS.Joker {
    key = "languageEgg",
    name = "Language Egg",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 6,
        y = 3
    },
    rarity = 1,
    cost = 5,
    unlocked = false,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = true,
    config = {
        extra = {
            mult = 5
        }
    },
    check_for_unlock = function (self, args)
        if args.type == 'win_custom' and G.SETTINGS.language ~= "en-us" then
            unlock_card(self)
        end
    end,
    in_pool = function (self, args) --Spawn chance reduced by 1/3 if this run has only been played in US English
        if G and (G.SETTINGS.language ~= "en-us") then return true end
        local count = 0
        if G and G.GAME and G.GAME.languageEgg then
            for _ in pairs(G.GAME.languageEgg) do count = count + 1 end

            if count <= 1 and G.GAME.languageEgg["en-us"] then
                if pseudorandom("eggchance") < 1/3 then return false end
            else return true
            end
        end
        return false --this shouldn't ever happen during a game, but if it does, remove from pool as a failsafe 👍️
    end,
    loc_vars = function(self, info_queue, card)
        local count = 0
        if G.GAME and G.GAME.languageEgg then
            for _ in pairs(G.GAME.languageEgg) do count = count + 1 end
        end
        local total = count * card.ability.extra.mult
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.extra.mult,
                total
            }
        }
    end,
    calculate = function(self, card, context)
        if (context.joker_main and context.scoring_hand) or context.forcetrigger then
            local count = 0
            if G.GAME.languageEgg then
                for _ in pairs(G.GAME.languageEgg) do count = count + 1 end
            end
            local total = card.ability.extra.mult * count
            return {
                mult = total,
                card = card
            }
        end

        if context.end_of_round and context.cardarea == G.jokers then
            if not G.GAME.languageEgg[G.SETTINGS.language] then
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
    end
}