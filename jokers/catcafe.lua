SMODS.Joker {
    key = "catcafe",
    name = "Cat Cafe",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 6
    },
    soul_pos = {
        x = 1,
        y = 6
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = true,
    config = {
        extra = {
            chips = 333
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
    in_pool = function (self, args) --Make this artificially rarer until we have more kity jokers to power it
        if (SMODS.Mods.vallkarri or {}).can_load then return true end -- UNLESS ☝️ we have another kity mod to make up the numbers
        if pseudorandom("catcafechance") > 1/3 then return false end
        return true
    end,
    calculate = function(self, card, context)
        if context.forcetrigger then
            return {
                chips = card.ability.extra.chips,
            }
        end

        if context.other_joker and context.other_joker:is_kity() then
            return {
                    chips = card.ability.extra.chips,
                    card = context.other_joker
            }
        end
    end
}