local suitmap = { --Uncomment these as the art gets arted
    Hearts = 1,
    Clubs = 2,
    Diamonds = 3,
    Spades = 4,
    minty_3s = 5,
    --bunc_halberds = 6,
    --bunc_fleurons = 7,
    --paperback_Crowns = 8,
    --paperback_Stars = 9,
    --six_moons = 10,
    --six_stars = 11,
    --Fallback = 0
}

if SMODS.Suits then
    for k,v in pairs(SMODS.Suits) do
        if not suitmap[k] and not v.minty_facerank then
            suitmap[k] = 0
        end
    end
else
    sendDebugMessage("Error defining suit map for Faces; SMODS.Suits doesn't seem to be defined at this time for some reason", "Minty's Mod")
end

local all_faces = { "King", "Queen", "Jack" }

if SMODS.Ranks then
    local smods_faces = {}
    local sanitycheck = false
    for k,v in pairs(SMODS.Ranks) do
        if v.face then
            table.insert(smods_faces, k)
        end
        if k == "King" then sanitycheck = true end
    end

    if sanitycheck then
        all_faces = smods_faces
    else
        sendDebugMessage("Error defining next for Faces; vanilla ranks don't seem to be defined at this time", "Minty's Mod")
        table.insert(smods_faces, "King")
        table.insert(smods_faces, "Queen")
        table.insert(smods_faces, "Jack")
        all_faces = smods_faces
    end
else
    sendDebugMessage("Error defining next for Faces; SMODS.Ranks doesn't seem to be defined at this time for some reason", "Minty's Mod")
end

local strength_effect = { random = true }

if SMODS.Mods["Steamodded"].version < "1.0.0~BETA-0810a" then
    strength_effect = { ignore = true }
    sendWarnMessage("FYI, your version of Steamodded contains a bug with `strength_effect.random`. Switching to `strength_effect.ignore` for now.", "Minty's Mod")
end

SMODS.Rank{
    key = "face",
    card_key = "F",
    pos = {x = 0},
    nominal = 15,
    face_nominal = 0.5,
    lc_atlas = "facerank",
    hc_atlas = "facerank",
    shorthand = "F",
    face = true,
    next = all_faces,
    strength_effect = strength_effect,
    in_pool = function (self, args)
        if args and args.initial_deck then
            return args.start_with_faces
        end
        if args and args.grin then
            return true
        end
        return MINTY.find_rank("minty_face")
    end,
    suit_map = suitmap,
    loc_vars = function (self, info_queue, card)
        local suit = card.base.suit
        local key = "minty_faceholder_ex"
        if self.suit_map[suit] == 0 then
            info_queue[#info_queue+1] = {
                set = "Other",
                key = key,
            }
        end
    end
}

if AKYRS_CROSSMOD then
    AKYRS_CROSSMOD.rank_to_atlas_map["minty_face"] = {
        "minty_pureface", {x=0, y=0}
    }
end