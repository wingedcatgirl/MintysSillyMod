FusionJokers.fusions:add_fusion("j_campfire", nil, false, "j_flower_pot", nil, false, "j_minty_wildfire", 12)

SMODS.Joker {
    key = "wildfire",
    name = "Wildfire",
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
    cost = 5,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = true,
    demicoloncompat = false,
    config = {
        extra = {
            xmult = 3,
            xmult_gain = 0.5,
            perish_count = 2
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
                card.ability.extra.xmult,
                card.ability.extra.xmult_gain,
                card.ability.extra.perish_count
            }
        }
    end,
    calculate = function(self, card, context)
        if context.ending_shop and context.cardarea == G.jokers and not context.blueprint then
            local mypos = 0
            for i = 1,#G.jokers.cards do
                if G.jokers.cards[i] == card then mypos = i break end
            end
            if mypos == 1 then return end
            local target = G.jokers.cards[mypos]
            if target.config.center.key == self.key then return end
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_gain"
            })
            target = copy_card(card)
            if target.ability.eternal then target:remove_sticker("eternal") end
            if not target.ability.perishable then target:add_sticker("perishable", true) end
            target.ability.perish_tally = card.ability.extra.perish_count
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}

-- See localization/en-us.lua to create joker text