SMODS.Joker {
    key = "flexweirdo",
    name = "Joker Who Constantly Makes Cracks About How Good Someone Must Be In Bed If They Stretch A Slightly Unusual Distance (Like Come On Man They're Not Even A Contortionist That's Just Normal Human Variation)", --or JWCMCAHGSMBIBITSASUD for short.
    pronouns = "he_him",
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
            s_mult = 3
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        local namekey = "minty_flexweirdo_full_name"
        if MINTY.config.flavor_text then
            --key = self.key.."_flavor"
            namekey = namekey.."_flavor"
        end
        info_queue[#info_queue + 1] = {
            set = "Other",
            key = namekey,
        }
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