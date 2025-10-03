SMODS.Consumable{
    key = "template",
    name = "",
    set = "minty_treat",
    config = {
        
    },
    loc_vars = function (self, info_queue, card)
		local key = self.key
        local plural = false
        if card.ability.consumeable.max_highlighted ~= 1 then plural = true end
        local s = plural and "s" or ""
        local a = plural and "" or "a "
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.consumeable.max_highlighted,
                s,
                a,
            }
        }
    end,
    can_use = function (self, card)
        
    end,
    use = function (self, card, area, copier)
        
    end
}