SMODS.Joker {
    key = "gymbuddy",
    name = "Gym Buddies",
    atlas = 'mintyjokerplaceholder',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            chips = 3,
            xchips = 0.2,
            hchips = 2,
            hxchips = 0.15,
            mult = .4,
            xmult = 0.2,
            hmult = 0.3,
            hxmult = 0.15,
            cash = 0.10,
            hcash = 0.30,
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if minty_config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.ability.set == "Enhanced" then
                local juicetime = false
                local buff = context.other_card.ability.name
                local gain = "unset"
                if (buff == "Bonus") or (buff == "Stone Card") then --This chunk handles vanilla enhancements
                    gain = "chips"
                elseif (buff == "Mult Card") then
                    gain = "mult"
                elseif (buff == "Glass Card") then
                    gain = "xmult"
                elseif (buff == "Steel Card") then
                    gain = "hxmult"
                elseif (buff == "Lucky Card") then
                    gain = "cash"
                elseif (buff == "Gold Card") then
                    gain = "hcash"
                end
                if gain == "unset" and type(context.other_card.ability.extra) == "table" then -- Table check avoids crashing on glass cards, because :thunk: momence
                    gain = context.other_card.ability.extra.gymboost or "unset" 
                end
                gain = gain:gsub("_", ""):lower() -- Remove underscores and force to lowercase
                local valid_gains = {
                    chips = true, 
                    hchips = true, 
                    xchips = true, 
                    hxchips = true,
                    mult = true, 
                    hmult = true,
                    xmult = true,
                    hxmult = true,
                    cash = true, money = true, dollars = true,
                    hcash = true, hmoney = true, hdollars = true,
                    none = true
                }
                if not valid_gains[gain] then gain = pseudorandom_element({
                        "chips", "xchips", "mult", "xmult", "cash", "hchips", "hxchips", "hmult", "hxmult", "hcash", 
                    })
                end
                --mintySay("Gain is "..gain)
                for i = 1, #context.scoring_hand do
                    local juice = true
                    if context.scoring_hand[i].ability.name ~= buff then
                        if gain == "chips" then
                            context.scoring_hand[i].ability.perma_bonus = context.scoring_hand[i].ability.perma_bonus or 0
                            context.scoring_hand[i].ability.perma_bonus = context.scoring_hand[i].ability.perma_bonus + card.ability.extra.chips
                        elseif (gain == "hchips") then
                            context.scoring_hand[i].ability.perma_h_chips = context.scoring_hand[i].ability.perma_h_chips or 0
                            context.scoring_hand[i].ability.perma_h_chips = context.scoring_hand[i].ability.perma_h_chips + card.ability.extra.hchips
                        elseif (gain == "xchips") then
                            context.scoring_hand[i].ability.perma_x_chips = context.scoring_hand[i].ability.perma_x_chips or 0
                            context.scoring_hand[i].ability.perma_x_chips = context.scoring_hand[i].ability.perma_x_chips + card.ability.extra.xchips
                        elseif (gain == "hxchips") then
                            context.scoring_hand[i].ability.perma_h_x_chips = context.scoring_hand[i].ability.perma_h_x_chips or 0
                            context.scoring_hand[i].ability.perma_h_x_chips = context.scoring_hand[i].ability.perma_h_x_chips + card.ability.extra.hxchips
                        elseif gain == "mult" then
                            context.scoring_hand[i].ability.perma_mult = context.scoring_hand[i].ability.perma_mult or 0
                            context.scoring_hand[i].ability.perma_mult = context.scoring_hand[i].ability.perma_mult + card.ability.extra.mult
                        elseif (gain == "hmult") then
                            context.scoring_hand[i].ability.perma_h_mult = context.scoring_hand[i].ability.perma_h_mult or 0
                            context.scoring_hand[i].ability.perma_h_mult = context.scoring_hand[i].ability.perma_h_mult + card.ability.extra.hmult
                        elseif (gain == "xmult") then
                            context.scoring_hand[i].ability.perma_x_mult = context.scoring_hand[i].ability.perma_x_mult or 0
                            context.scoring_hand[i].ability.perma_x_mult = context.scoring_hand[i].ability.perma_x_mult + card.ability.extra.xmult
                        elseif (gain == "hxmult") then
                            context.scoring_hand[i].ability.perma_h_x_mult = context.scoring_hand[i].ability.perma_h_x_mult or 0
                            context.scoring_hand[i].ability.perma_h_x_mult = context.scoring_hand[i].ability.perma_h_x_mult + card.ability.extra.hxmult
                        elseif (gain == "cash") or (gain == "money") or (gain == "dollars") then
                            context.scoring_hand[i].ability.perma_p_dollars = context.scoring_hand[i].ability.perma_p_dollars or 0
                            context.scoring_hand[i].ability.perma_p_dollars = context.scoring_hand[i].ability.perma_p_dollars + card.ability.extra.cash
                        elseif (gain == "hcash") or (gain == "hmoney") or (gain == "hdollars") then
                            context.scoring_hand[i].ability.perma_h_dollars = context.scoring_hand[i].ability.perma_h_dollars or 0
                            context.scoring_hand[i].ability.perma_h_dollars = context.scoring_hand[i].ability.perma_h_dollars + card.ability.extra.cash
                        else
                            juice = false
                        end
                        if juice then 
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    context.scoring_hand[i]:juice_up()
                                    return true
                                end
                            })) 
                        end
                    end
                end
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS },
                    card = card
                }
            end
        end
    end
}