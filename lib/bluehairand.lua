-- ...because of course we have them.

if not CardPronouns.classifications.neo then
    CardPronouns.PronounClassification {
        key = "neo",
        pronouns = {  }
    }
end

CardPronouns.Pronoun {
    colour = HEX("CA7CA7"),
    text_colour = G.C.WHITE,
    pronoun_table = { "Kit", "Kits" },
    classification = "neo",
    in_pool = function()
        return true
    end,
    key = "kit_kits"
}

CardPronouns.Pronoun {
    colour = HEX("CA7CA7"),
    text_colour = G.C.WHITE,
    pronoun_table = { "Mirror pronouns" },
    classification = "neo",
    in_pool = function()
        return true
    end,
    key = "mirror"
}

CardPronouns.Pronoun {
    colour = HEX("CA7CA7"),
    text_colour = G.C.WHITE,
    pronoun_table = { "He", "Any" },
    in_pool = function()
        return true
    end,
    key = "he_any"
}

CardPronouns.Pronoun {
    colour = HEX("CA7CA7"),
    text_colour = G.C.WHITE,
    pronoun_table = { "It", "She" },
    in_pool = function()
        return true
    end,
    key = "it_she"
}