SMODS.Rank{
    key = "face",
    card_key = "F",
    pos = {x = 0},
    nominal = 15,
    face_nominal = 0.5,
    --lc_atlas = "",
    --hc_atlas = "",
    shorthand = "F",
    face = true,
    next = {
        "Jack", "Queen", "King"
    },
    strength_effect = {
        random = true
    },
    suit_map = {
        Hearts = 1,
        Clubs = 2,
        Diamonds = 3,
        Spades = 4,
        minty_3s = 5,
        bunc_halberds = 6,
        bunc_fleurons = 7,
        paperback_crowns = 8,
        paperback_stars = 9,
        six_moons = 10,
        six_stars = 11,
        --Everything else = 0; have this done in last-minute code
    }
}

MINTY.facemap = function ()
    --Modifying the suit_map at runtime like this doesn't seem to work, but idk why
    for k,v in pairs(SMODS.Suits) do
        if not SMODS.Ranks.minty_face.suit_map[k] then
            SMODS.Ranks.minty_face.suit_map[k] = 0
        end
    end

    local all_faces = {}
    for k,v in pairs(SMODS.Ranks) do
        if v.face then
            table.insert(all_faces, k)
        end
    end
    tprint(all_faces)
    SMODS.Ranks.minty_face.next = all_faces
end