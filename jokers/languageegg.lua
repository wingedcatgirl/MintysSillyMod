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
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 5
        }
    },
    in_pool = function ()
        return not (G.SETTINGS.language == "en-us")
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
        if context.joker_main and context.scoring_hand then
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

-- See localization/en-us.lua to create joker text