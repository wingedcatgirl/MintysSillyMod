SMODS.Joker {
    key = "numberslop",
    name = "Ugh, more numberslop",
    pronouns = "she_her",
    atlas = 'jokerdoodles2',
    pos = {
        x = 2,
        y = 0
    },
    rarity = 1,
    cost = 3,
    unlocked = true,
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
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main or context.forcetrigger then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}