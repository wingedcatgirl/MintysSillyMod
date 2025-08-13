local counters = {
    { boss = "bl_psychic" },
    { boss = "bl_akyrs_the_thought", mod = "aikoyorisshenanigans"},
    --CUBE LOVELY PATCH TARGET
}
--Tuskallisetkäsiraudat (Polterworx) TBA, getting keys is a pain cause Jen doesn't use GitHub


SMODS.Joker {
    key = "cube",
    name = "Cube Joker",
    atlas = 'jokerdoodles',
    pos = {
        x = 5,
        y = 0
    },
    rarity = 3,
    cost = 9,
    unlocked = false,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = true,
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
    check_for_unlock = function (self, args)
        if args and args.type == "win_custom" then
            local fours = 0
            local fournt = 0
            fours = fours + G.GAME.hands["Two Pair"].played
            fours = fours + G.GAME.hands["Four of a Kind"].played
            fournt = fournt + G.GAME.hands["Full House"].played
            fournt = fournt + G.GAME.hands["Flush House"].played
            fournt = fournt + G.GAME.hands["Five of a Kind"].played
            fournt = fournt + G.GAME.hands["Flush Five"].played
            for k, v in pairs(G.GAME.hands) do
                if string.find(k, "Spectrum", nil, true) or string.find(k, "Specflush", nil, true) then
                    if G.GAME.hands[k].played > 0 then
                        fournt = fournt + G.GAME.hands[k].played
                    end
                end
            end
            if fours > fournt then
                unlock_card(self)
            end
        end
    end,

    calculate = function(self, card, context)
        if (context.joker_main and context.scoring_hand) or context.forcetrigger then
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
        if not (card.ability and card.ability.eternal) then return end -- only if eternal
        if G.GAME.bosses_used["bl_psychic"] >= 1e300 then return end -- not if already banned
        for _,v in ipairs(counters) do
            local boss = v.boss
            local mod = v.mod
            if (not mod) or (SMODS.Mods[mod] or {}).can_load then
                G.GAME.bosses_used[boss] = G.GAME.bosses_used[boss] + 1e300
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if (not next(SMODS.find_card('j_minty_cube'))) then
            for _,v in ipairs(counters) do
                local boss = v.boss
                local mod = v.mod
                if (not mod) or (SMODS.Mods[mod] or {}).can_load then
                    G.GAME.bosses_used[boss] = G.GAME.bosses_used[boss] - 1e300
                end
            end
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
		    return localize("k_minty_psycube")
        end
		return localize("k_minty_cube")
	end
	return get_loc_debuff_textref(self)
end