
SMODS.Joker {
    key = "cube",
    name = "Cube Joker",
    atlas = 'mintyjokerdoodles',
    pos = {
        x = 5,
        y = 0
    },
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {extra = {Xmult = 4}},
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {card.ability.extra.Xmult}
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand then
            return {
                message = localize {
                    type = 'variable',
                    key = 'a_xmult',
                    vars = { card.ability.extra.Xmult }
                },
                colour = G.C.RED,
                Xmult_mod = card.ability.extra.Xmult
            }
        end
    end,


    add_to_deck = function(self, card, from_debuff)
        if not (card.ability and card.ability.eternal) then return end
        --Tuskallisetkäsiraudat (Polterworx) TBA, getting keys is a pain cause Jen doesn't use GitHub
        if (SMODS.Mods["aikoyorisshenanigans"] or {}).can_load then
            G.GAME.bosses_used["bl_akyrs_the_thought"] = G.GAME.bosses_used["bl_akyrs_the_thought"] + 1e300
        end
        G.GAME.bosses_used["bl_psychic"] = G.GAME.bosses_used["bl_psychic"] + 1e300
    end,
    remove_from_deck = function(self, card, from_debuff)
        if (not next(SMODS.find_card('j_minty_cube'))) and G.GAME.bosses_used["bl_psychic"] >= 1e300 then
            MINTY.say("Yep", "TRACE")
            if (SMODS.Mods["aikoyorisshenanigans"] or {}).can_load then
                G.GAME.bosses_used["bl_akyrs_the_thought"] = G.GAME.bosses_used["bl_akyrs_the_thought"] - 1e300
            end
            G.GAME.bosses_used["bl_psychic"] = G.GAME.bosses_used["bl_psychic"] - 1e300
        else
            MINTY.say("Nope", "TRACE")
        end
    end,
}

local forbidden = false
local debuff_hand_ref = Blind.debuff_hand

function Blind:debuff_hand(cards, hand, handname, check)
	if next(SMODS.find_card('j_minty_cube')) then
		if #cards ~= 4 then
			forbidden = true
            return true
		end
		forbidden = false
	end
	return debuff_hand_ref(self, cards, hand, handname, check)
end

local get_loc_debuff_textref = Blind.get_loc_debuff_text
function Blind:get_loc_debuff_text()
	if forbidden then
        if (G.GAME.blind.config.blind.debuff ~= {}) and (G.GAME.blind.config.blind.debuff.h_size_ge and G.GAME.blind.config.blind.debuff.h_size_ge >= 5) or (G.GAME.blind.config.blind.debuff.h_size_le and G.GAME.blind.config.blind.debuff.h_size_le <= 3) then
		    return localize("k_psycube")
        end
		return localize("k_cube")
	end
	return get_loc_debuff_textref(self)
end