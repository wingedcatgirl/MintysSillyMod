SMODS.Joker {
    key = "bucket",
    name = "Bucket of Cement",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 3,
        y = 2
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = false,
    config = {},
	loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
		info_queue[#info_queue + 1] = {
            set = "Other",
            key = "minty_stone_cards",
        }
		return {
            key = key,
            vars = {
                localize{type = 'name_text', set = 'Other', key = "minty_stone_cards"}
            }
        }
	end,
    calculate = function(self, card, context)
        if context.before then
            for i = 1,#context.scoring_hand do
                if context.scoring_hand[i].ability.set ~= "Enhanced" then
                    local _, enh = pseudorandom_element(MINTY.rocks, pseudoseed("minty_bucket"))
                    MINTY.say(enh, "TRACE")
                    context.scoring_hand[i]:set_ability(G.P_CENTERS[enh], nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            context.scoring_hand[i]:juice_up()
                            return true
                        end
                    }))
                end
            end
        end
    end
}