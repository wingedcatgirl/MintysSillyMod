function MINTY.build_face_rank()
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

    for k,v in pairs(SMODS.Suits) do
        if not suitmap[k] and not v.minty_facerank then
            suitmap[k] = 0
        end
    end

    local all_faces = { }

    for k,v in pairs(SMODS.Ranks) do
        if v.face then
            table.insert(all_faces, k)
        end
    end

    MINTY.face_rank_all_faces = all_faces
    MINTY.face_rank_suitmap = suitmap
end

MINTY.build_face_rank()

SMODS.Rank{
    key = "face",
    card_key = "F",
    pos = {x = 0},
    nominal = 15,
    face_nominal = -4.9999,
    lc_atlas = "facerank",
    hc_atlas = "facerank",
    shorthand = "F",
    face = true,
    next = MINTY.face_rank_all_faces,
    strength_effect = { random = true },
    in_pool = function (self, args)
        if args and args.initial_deck then
            return args.start_with_faces
        end
        if args and args.grin then
            return true
        end
        return MINTY.find_rank("minty_face")
    end,
    suit_map = MINTY.face_rank_suit_map,
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