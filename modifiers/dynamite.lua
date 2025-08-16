SMODS.Enhancement({
    key = "dynamite",
    name = "Dynamite Card",
    atlas = "enhance",
    set = "Enhanced",
    pos = {
        x = 3,
        y = 1
    },
	object_type = "Enhancement",
	badge_colour = HEX("a3ecc0"), --Magic Mint, according to internet
    config = {
        
        extra = {
            gymboost = "random"
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = { set = "Other", key = "minty_disabled_object", specific_vars = { "Me", "to decide what it does lol" } }
        return {
            vars = {
                
            },
        }
    end,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    in_pool = function (self, args)
        return false
    end,
    calculate = function (self, card, context)
        do return end --does nothing yet cause we haven't decided! lol!
        if context.forcetrigger then
            return {
                
            }
        end
    end
})