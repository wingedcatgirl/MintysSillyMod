SMODS.Sound { --Source: https://www.youtube.com/watch?v=gXE9UgrOdls
    key = 'batnoise',
    path = 'batnoise.ogg'
}

SMODS.Joker {
    key = "scoundrel",
    name = "The Scoundrel",
    atlas = 'mintyjokerdoodles', --Art source: https://thegreatyin.tumblr.com/post/780313971308773376/was-thinking-about-this-concept-again-had-to 
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 4,
        y = 3
    },
    rarity = 3,
    cost = 13,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            count = 0,
            luckycards = {}
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                localize{type = 'name_text', set = 'Enhanced', key = "m_lucky"}
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and context.other_card.lucky_trigger then
            card.ability.extra.luckycards[#card.ability.extra.luckycards+1] = context.other_card.unique_val
            MINTY.luckyCount(1)
            card.ability.extra.count = math.min(7, G.GAME.total_lucky_count)
            --mintySay("Lucky hit: "..context.other_card.unique_val)
        end
        if context.cardarea == G.play and context.repetition and card.ability.extra.count ~= 0 and context.other_card then
            local luckycard = false
            --mintySay("Current card: "..context.other_card.unique_val)
            for k,v in pairs(card.ability.extra.luckycards) do
                --mintySay("Previous hit: "..v)
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

-- See localization/en-us.lua to create joker text