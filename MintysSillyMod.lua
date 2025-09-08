MINTY = MINTY or {}
MINTY.prefix = SMODS.current_mod.prefix
MINTY.config = SMODS.current_mod.config



if not SMODS.current_mod.lovely then
    NFS.write(SMODS.current_mod.path .. '.lovelyignore', '')
    error("Minty's Mod: Lovely patches failed! Please make sure the file structure is not nested. The mod will be automatically disabled on restart.")
end

SMODS.current_mod.optional_features = {
    retrigger_joker = true,
    post_trigger = true,
    --quantum_enhancements = true,
    cardareas = {
        unscored = true,
    },
}

SMODS.ObjectType({ --Kity pool (Legendary and otherwise)
    key = "kity",
    default = "j_lucky_cat",
	cards = {
        ["j_lucky_cat"] = true,
        ["j_pl_black_cat"] = true,
        ["j_neat_tabbycat"] = true,
        ["j_ortalab_black_cat"] = true,
    },
    inject = function(self)
        SMODS.ObjectType.inject(self)
    end
})

if not SMODS.ObjectType.Food then
    SMODS.ObjectType({
        key = "Food",
        default = "j_popcorn",
        cards = {
            ["j_gros_michel"] = true,
            ["j_egg"] = true,
            ["j_ice_cream"] = true,
            ["j_cavendish"] = true,
            ["j_turtle_bean"] = true,
            ["j_diet_cola"] = true,
            ["j_popcorn"] = true,
            ["j_ramen"] = true,
            ["j_selzer"] = true,
        },
        inject = function(self)
            SMODS.ObjectType.inject(self)
        end,
    })
end

local files = {
    lib = {
        { name = "atlases" },
        { name = "functions" },
        { name = "hooks" },
        { name = "sounds" },
        { name = "configui" },
    },
    suits = {
        { name = "3suit" }
    },
    ranks = {
        { name = "face" }
    },
    jokers = {
        --Tweaks to existing Jokers 
        { name = "vanillatweaks" },
        --Common Jokers
        { name = "froyo" },
        { name = "hedonist" },
        { name = "languageegg" },
        { name = "claw" },
        { name = "prosopagnosia" },
        { name = "phasebus" },
        { name = "slowtiger" },
        { name = "cube" },
        { name = "eaten" },
        { name = "excited" },
        { name = "chisel" },
        { name = "bucket" },
        { name = "chocobar" },
        { name = "duckhat" },
        { name = "ascetic" },
        { name = "churu",  },
        --Uncommon Jokers
        { name = "atheismcorner" },
        { name = "catcafe" },
        { name = "catnipfields" },
        { name = "fatcat-l" }, --Literal (Tubbs)
        { name = "fatcat-m" }, --Metaphorical (Jeff Bezos catgirl)
        { name = "treatovision" },
        { name = "peywet", },
        { name = "cakesword" },
        --{ name = "inkbleed" },
        { name = "copycat" },
        { name = "sabertooth" },
        { name = "neko" },
        { name = "catpicmachine", },
        --Rare Jokers
        { name = "wildsupport" },
        { name = "gymbuddy" },
        { name = "scoundrel" },
        { name = "cakegun" },
        { name = "doctor" },
        { name = "hyperfix" },
        { name = "jacobsladder" },
        --Fusion Jokers
        { name = "threecats", mods = { {id = "FusionJokers"} } },
        { name = "parkour", mods = { {id = "FusionJokers"} } },
        { name = "wettiger", mods = { {id = "FusionJokers"}, {id = "Tsunami"} } },
        { name = "shakegun", mods = { {id = "FusionJokers"}, {id = "Tsunami"} } },
        --{ name = "ninethlion", mods = { {id = "FusionJokers"} }, dev = true },
        --Special Jokers
        { name = "theecho", mods = { { id = "ChDp" } } },
        --Showdown Jokers (become Legendary if Finity is not active)
        { name = "calico" },
        --Legendary Jokers
        { name = "lucky" },
        { name = "stormy" },
        { name = "patchy" },
        { name = "minty" },
        { name = "garfielf" },
        { name = "lune" }
    },
    tarots = {
        { name = "abacus", },
        { name = "cat" },
        { name = "boredchild" },
        { name = "dorf" },
        { name = "grin", },
        { name = "gleam" },
        { name = "geologist" },
        { name = "bitz" },
        { name = "magnet" },
    },
    spectrals = {
        { name = "sixyears" },
        { name = "dekaja" },
        { name = "wand" },
        --{ name = "testcard" },
    },
    consumables = {
        { name = "colors", mods = { { id = "MoreFluff", cfg = "Colour Cards" } } },
        { name = "rotarots", mods = { { id = "MoreFluff", cfg = "45 Degree Rotated Tarot Cards" } } },
        { name = "gemstones", mods = { { id = "Gemstone" } } },
        { name = "drafts", mods = { { id = "draft", version = "0.6.0" } } },
    },
    vouchers = {
        { name = "topplepaws" }
    },
    modifiers = {
        { name = "marble" }, --Enhancements
        { name = "microcline" },
        { name = "crystal" },
        { name = "hematite" },
        { name = "garbled" }, --Rotarot enhancements
        { name = "pistol" },
        { name = "spline" },
        { name = "dynamite" },
        { name = "cementseal" }, --Seals
    },
    backs = {
        { name = "treat" },
        { name = "club" },
        { name = "diamond" },
        { name = "heart" },
        { name = "spade" },
        { name = "3" },
        { name = "drippy" },
        { name = "silly" },
    },
    blinds = {
        { name = "aclaw"},
        { name = "atooth"},
        { name = "apaw"},
        { name = "atail"},
        { name = "thenip" },
        { name = "thetree" },
        { name = "calico" },
        { name = "thenipdx" },
    },
    challenge = {
        { name = "challenges", mods = { { id = "ChDp" } } }
    }
}

for folder, list in pairs(files) do
    for _, data in ipairs(list) do
        if data.dummy then goto nvm end
        local load = true
        local name = data.name
        local mods = data.mods
        local incompat = data.incompat
        if mods then
            sendTraceMessage("Checking required mods for "..folder..'/'..name..".lua", "Minty's Mod")
            for _, mod in ipairs(mods) do
                load = load and (SMODS.Mods[mod.id] or {}).can_load
                if mod.cfg then
                    sendTraceMessage("Checking config "..mod.cfg.." for "..folder..'/'..name..".lua", "Minty's Mod")
                    load = load and SMODS.Mods[mod.id].config[mod.cfg]
                end
                if mod.version then load = load and ((SMODS.Mods[mod.id] or {}).version >= mod.version) end
            end
        end
        if load and incompat then
            sendTraceMessage("Checking conflicting mods for "..folder..'/'..name..".lua", "Minty's Mod")
            for _, mod in ipairs(incompat) do
                load = load and not (SMODS.Mods[mod.id] or {}).can_load
            end
        end
        if load and data.dev then
            sendTraceMessage("Checking dev mode option for "..folder..'/'..name..".lua", "Minty's Mod")
            load = load and MINTY.config.dev_mode
        end
        if load then
            sendTraceMessage("Loading file: "..folder..'/'..name..'.lua', "Minty's Mod")
            if not pcall(SMODS.load_file(folder..'/'..name..'.lua')) then
                local _,errormessage = pcall(SMODS.load_file(folder..'/'..name..'.lua'))
                local disable = not MINTY.config.dev_mode and " The mod will be automatically disabled on restart." or ""
                if not MINTY.config.dev_mode then
                    NFS.write(SMODS.current_mod.path .. '.lovelyignore', '')
                end
                sendErrorMessage(errormessage, "Minty's Mod")
                error("Minty's Mod: File '"..folder.."/"..name..".lua' failed to load! Please make sure there's nothing fucky with your file structure."..disable)
            end


        else
            sendTraceMessage("Skipping file: "..folder..'/'..name..'.lua', "Minty's Mod")
        end
        ::nvm::
    end
end

MINTY.lastmoment = function ()
    MINTY.say("Running last-moment code...")
    MINTY.rocklist()
    MINTY.enhancecheck()

    if Cryptid and cry_best_interest_cap and not MINTY.cbic_override then --Gotta put it here cause priority~ Cryptid will probably fix this on their end soon-ish but for now this at least makes sure ducks are accounted for
        MINTY.cbic_override = true --Only do it once
        local cbic = cry_best_interest_cap
        function cry_best_interest_cap()
            local best = cbic()
            if next(SMODS.find_card("j_minty_duckhat")) then
                for i,v in ipairs(SMODS.find_card("j_minty_duckhat")) do
                    if v.ability.immutable.actualinterestchange > 0 then
                        best = best + (v.ability.immutable.actualinterestchange * 5) --:thunk: momence; he hardcoded the interest rate
                    end
                end
            end
            return best
        end
    end

end
----