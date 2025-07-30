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
        { name = "ascetic" },
        { name = "churu",  },
        --Uncommon Jokers
        { name = "atheismcorner" },
        { name = "catcafe" },
        { name = "catnipfields" },
        { name = "fatcat-l" },
        { name = "treatovision" },
        { name = "peywet", },
        { name = "cakesword" },
        { name = "sabertooth" },
        { name = "neko" },
        { name = "catpicmachine", mods = { { id = "Cryptid" } } },
        --Rare Jokers
        { name = "wildsupport" },
        { name = "gymbuddy" },
        { name = "scoundrel" },
        { name = "cakegun" },
        { name = "doctor" },
        { name = "hyperfix" },
        { name = "jacobsladder" },
        { name = "copycat" }, 
        --Fusion Jokers
        { name = "threecats", mods = { {id = "FusionJokers"} } },
        { name = "parkour", mods = { {id = "FusionJokers"} } },
        --{ name = "ninethlion", mods = { {id = "FusionJokers"} }, dev = true },
        --Special Jokers
        { name = "theecho", mods = { { id = "ChDp" } } },
        --Legendary Jokers
        { name = "lucky" },
        { name = "stormy" },
        { name = "patchy" },
        { name = "minty" },
        { name = "garfielf" },
        { name = "lune" }
    },
    tarots = {
        { name = "cat" },
        { name = "boredchild" },
        { name = "dorf" },
        { name = "grin", dev = true },
        { name = "gleam" },
        { name = "geologist" },
        { name = "bitz" },
    },
    spectrals = {
        { name = "sixyears" },
        { name = "dekaja", dev = true },
        { name = "wand" },
    },
    consumables = {
        { name = "colors", mods = { { id = "MoreFluff" } } },
        { name = "rotarots", mods = { { id = "MoreFluff" } } },
        { name = "gemstones", mods = { { id = "Gemstone" } } },
        { name = "drafts", mods = { { id = "draft", version = "0.5.2.1" } } },
    },
    vouchers = {
        { name = "topplepaws" }
    },
    modifiers = {
        { name = "marble" }, --Enhancements
        { name = "microcline" },
        { name = "crystal" },
        { name = "garbled", mods = { { id = "MoreFluff" } } },
        { name = "pistol", mods = { { id = "MoreFluff" } } },
        { name = "cementseal" }, --Seals
    },
    backs = {
        { name = "treat" },
        { name = "club" },
        { name = "diamond" },
        { name = "heart" },
        { name = "spade" },
        { name = "3" },
        { name = "silly" },
    },
    blinds = {
        { name = "aclaw"},
        { name = "atooth"},
        { name = "apaw"},
        { name = "atail"},
        { name = "thenip" },
        { name = "thetree", mods = { {id = "ortalab"} } },
        { name = "calico" },
        { name = "thenipdx", mods = { {id = "MoreFluff"} } },
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
                if mod.version then load = load and ((SMODS.Mods[mod.id] or {}).version == mod.version) end
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
                local disable = not MINTY.config.dev_mode and " The mod will be automatically disabled on restart." or ""
                if not MINTY.config.dev_mode then
                    NFS.write(SMODS.current_mod.path .. '.lovelyignore', '')
                end
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
end
----