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
    cost = 12,
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
        info_queue[#info_queue+1] = { set = "Other", key = "minty_spread2", specific_vars = { card.ability.extra.perish_count } }
        return {
            key = key,
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmult_gain,
                card.ability.extra.perish_count,
                localize{type = 'name_text', set = 'Enhanced', key = "m_wild"}
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
            local target = G.jokers.cards[mypos-1]
            if target.config.center.key == self.key or SMODS.is_eternal(target, card) then return end
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_gain"
            })
            local new = copy_card(card)
            if new.ability.eternal then new:remove_sticker("eternal") end
            if not new.ability.perishable then new:add_sticker("perishable", true) end
            new.ability.perish_tally = card.ability.extra.perish_count
            G.jokers:emplace(new)
            G.jokers.cards[mypos-1], G.jokers.cards[#G.jokers.cards] = G.jokers.cards[#G.jokers.cards], G.jokers.cards[mypos-1]
            SMODS.destroy_cards(G.jokers.cards[#G.jokers.cards], nil, true, true) --little janky if i'm tbh but ¯\_(ツ)_/¯
        end

        if context.joker_main and context.scoring_hand then
            local check
            local suits = {}
            local bootlegwilds = 0
            for i=1,#context.scoring_hand do
                if context.scoring_hand[i].config.center.key == "m_wild" then check = true break end
                if not SMODS.has_no_suit(context.scoring_hand[i]) then
                    if SMODS.has_any_suit(context.scoring_hand[i]) then
                        bootlegwilds = bootlegwilds + 1
                    else
                        suits[context.scoring_hand[i].base.suit] = true
                    end
                end
            end

            if not check then
                local suitcount = 0
                for k,v in ipairs(suits) do
                    suitcount = suitcount + 1
                end
                if suitcount + bootlegwilds >= 4 then check = true end
            end

            if check then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
}

-- See localization/en-us.lua to create joker text