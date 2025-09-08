SMODS.Joker {
    key = "scoundrel",
    name = "The Scoundrel",
    pronouns = "any_all", --Canon Scoundrel fact! https://thegreatyin.tumblr.com/post/765358383699214336/whenever-the-scoundrel-is-talking-to-their-husband
    atlas = 'scoundrel',
    pos = {
        x = 0,
        y = 0
    },
    rarity = 3,
    cost = 13,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = false,
    config = {
        extra = {
            count = 0,
            luckycards = {}
        }
    },
    credit = { --Only displays if you have 3xCredits or CreditLib active, but nothing bad happens if you don't
        art = "thegreatyin", --Source: https://thegreatyin.tumblr.com/post/780313971308773376/was-thinking-about-this-concept-again-had-to; used with permission
        code = "wingedcatgirl",
        concept = "superoffbatter" --https://thegreatyin.tumblr.com/post/780555615092244480/could-you-actually-thatd-be-pretty-kickass
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        local plural = "s"
        if card.ability.extra.count == 1 then plural = "" end
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                localize{type = 'name_text', set = 'Enhanced', key = "m_lucky"},
                card.ability.extra.count,
                plural
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and context.other_card.lucky_trigger then
            card.ability.extra.luckycards[#card.ability.extra.luckycards+1] = context.other_card.unique_val
            MINTY.luckyCount(1)
            card.ability.extra.count = math.min(7, G.GAME.total_lucky_count)
            --MINTY.say("Lucky hit: "..context.other_card.unique_val)
        end
        if context.cardarea == G.play and context.repetition and card.ability.extra.count ~= 0 and context.other_card then
            local luckycard = false
            --MINTY.say("Current card: "..context.other_card.unique_val)
            for k,v in pairs(card.ability.extra.luckycards) do
                --MINTY.say("Previous hit: "..v)
                if context.other_card.unique_val == v then
                    card.ability.extra.luckycards[k] = nil
                    luckycard = true
                    break
                end
            end
            if luckycard then
                return {
                    message = localize("k_again_ex"),
                    sound = 'minty_batnoise',
                    message_card = card,
                    repetitions = card.ability.extra.count,
                }
            end
        end
        if context.final_scoring_step then
            card.ability.extra.luckycards = {}
        end
    end
}