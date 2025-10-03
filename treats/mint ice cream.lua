SMODS.Consumable{
    key = "ice_cream",
    name = "Mint Ice Cream",
    set = "minty_treat",
    config = {
        play_limit = 1
    },
    loc_vars = function (self, info_queue, card)
		local key = self.key
        local plural = false
        if card.ability.consumeable.play_limit ~= 1 then plural = true end
        local s = plural and "s" or ""
        local a = plural and "" or "a "
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.consumeable.play_limit,
                s,
                a,
            }
        }
    end,
    can_use = function (self, card)
        return true
    end,
    use = function (self, card, area, copier)
        SMODS.change_play_limit(card.ability.consumeable.play_limit)
    end
}