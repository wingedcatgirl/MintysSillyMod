SMODS.Joker {
    key = "shadowcrystal",
    name = "Shadow Crystal",
    pronouns = "it_its",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = true,
    config = {
        extra = {
            dollars = 1,
            chips = 50,
            mult = 7,
            xmult = 1.25,
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        local suit
        if G.GAME.minty_focussuit == nil then --TODO localizify this
            suit = "first played suit"
        elseif G.GAME.minty_focussuit == "suitless" then
            suit = "no suit"
        elseif G.GAME.minty_focussuit == "all-suit" then
            suit = "all suits"
        else
            suit = localize(G.GAME.minty_focussuit, "suits_plural").." suit"
        end
        return {
            key = key,
            vars = {
                suit,
                card.ability.extra.s_mult
            }
        }
    end,
    in_pool = function (self, args)
        return false
    end,
    calculate = function(self, card, context)
        if context.forcetrigger then
            return {
                mult = card.ability.extra.s_mult,
            }
        end

        if not G.GAME.minty_focussuit then return end

        if context.cardarea == G.play and context.individual and context.other_card then
            if (G.GAME.minty_focussuit == "suitless" and SMODS.has_no_suit(context.other_card))
            or (G.GAME.minty_focussuit == "all-suit" and SMODS.has_any_suit(context.other_card))
            or context.other_card:is_suit(G.GAME.minty_focussuit) then
                return {
                    mult = card.ability.extra.s_mult,
                }
            end
        end
    end
}