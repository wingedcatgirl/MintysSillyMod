FusionJokers.fusions:add_fusion("j_splash", nil, false, "j_minty_slowtiger", mult, true, "j_minty_wettiger", 6)

SMODS.Joker {
    key = "wettiger",
    name = "Wet Tiger",
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
    rarity = "fuse_fusion",
    cost = 6,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = true,
    demicoloncompat = false,
    config = {
        extra = {
            mult = 5,
            gain = 1,
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
                card.ability.extra.mult,
                card.ability.extra.gain
            }
        }
    end,
    calculate = function(self, card, context)
        if context.modify_scoring_hand then
            return {
                add_to_hand = true,
            }
        end

        if context.individual and not context.blueprint and context.cardarea == G.play and card_is_splashed(context.other_card) then
            SMODS.scale_card(card,{
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_value = "gain",
            })
            return {}
        end

        if context.joker_main and context.scoring_hand then
            return {
                mult = card.ability.extra.mult,
            }
        end
    end
}

-- See localization/en-us.lua to create joker text