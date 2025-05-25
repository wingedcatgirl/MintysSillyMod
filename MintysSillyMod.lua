MINTY = MINTY or {}
MINTY.prefix = SMODS.current_mod.prefix
MINTY.config = SMODS.current_mod.config



if not SMODS.current_mod.lovely then
    NFS.write(SMODS.current_mod.path .. '.lovelyignore', '')
    assert(false, "Lovely patches failed! Please make sure this mod's file structure is not nested. The mod will be automatically disabled on restart.")
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
	cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
        --Add pool tag to external kitys so cards can care about that
        local outside_kitys = {
            j_lucky_cat = "vanilla",
            j_ortalab_black_cat = "ortalab",
            j_neat_tabbycat = "Neato_Jokers"
        }
        for k,v in pairs(outside_kitys) do --This might break if the other mod has a hig- er, low- er, LARGER NUMBER for priority, but uhhhh
            if v == "vanilla" or (SMODS.Mods[v] or {}).can_load then
                self:inject_card(G.P_CENTERS[k])
                G.P_CENTERS[k].pools = G.P_CENTERS[k].pools or {}
                G.P_CENTERS[k].pools.kity = true
            end
        end
    end
})

local files = {
    lib = {
        { name = "atlases" },
        { name = "functions" },
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
        { name = "ascetic", mods = { {id = "ortalab"} } },
        { name = "churu", mods = { {id = "paperback"} }, nocrossover = true },
        --Uncommon Jokers
        { name = "atheismcorner" },
        { name = "catcafe" },
        { name = "treatovision" },
        { name = "sabertooth", mods = { {id = "ortalab"} } },
        { name = "neko", mods = { {id = "TOGAPack"} } },
        { name = "catpicmachine", mods = { { id = "Cryptid" } } },
        --Rare Jokers
        { name = "wildsupport" },
        { name = "gymbuddy" },
        { name = "scoundrel" },
        { name = "hyperfix", mods = { {id = "Talisman"} } },
        { name = "jacobsladder" },
        --Fusion Jokers
        { name = "threecats", mods = { {id = "FusionJokers"} } },
        { name = "parkour", mods = { {id = "FusionJokers"} } },
        --{ name = "ninethlion", mods = { {id = "ortalab"}, {id = "FusionJokers"} }, dev = true },
        --Special Jokers
        { name = "theecho", mods = { { id = "ChDp" } } },
        --Legendary Jokers
        { name = "lucky" },
        { name = "stormy" },
        { name = "patchy" },
        { name = "minty", mods = { {id = "Talisman"} } },
        { name = "garfielf" },
        { name = "lune", mods = { {id = "ortalab"} } }
    },
    consumables = {
        { name = "tarots" },
        { name = "spectrals" },
        { name = "colors", mods = { { id = "MoreFluff" } }, nocrossover = true },
        { name = "rotarots", mods = { { id = "MoreFluff" } }, nocrossover = true },
        { name = "gemstones", mods = { { id = "Gemstone" } }, nocrossover = true },
        { name = "drafts", mods = { { id = "draft", version = "0.5.2.1" } } },
    },
    enhancements = {
        { name = "marble" },
        { name = "garbled", mods = { { id = "MoreFluff" } } },
    },
    seals = {
        { name = "cementseal" },
    },
    backs = {
        { name = "backs" }
    },
    blinds = {
        { name = "thenip" },
        { name = "thetree", mods ={ {id = "ortalab"} } },
        { name = "calico" },
        { name = "thenipdx", mods ={ {id = "MoreFluff"} } },
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
        local nocross = data.nocrossover
        if mods then
            sendTraceMessage("Checking mods for "..folder..'/'..name..".lua", "Minty's Mod")
            local nevercross = {
                "FusionJokers",
                "Talisman",
                "Cryptid",
                "ChDp",
                "draft",
            }
            for _, mod in ipairs(data.mods) do
                load = load and (SMODS.Mods[mod.id] or {}).can_load
                if mod.version then load = load and ((SMODS.Mods[mod.id] or {}).version == mod.version) end
                for _, check in pairs(nevercross) do
                    if mod.id == check then nocross = true end
                end
            end
        end
        if mods and not nocross then
            sendTraceMessage("Checking crossover option for "..folder..'/'..name..".lua")
            load = MINTY.config.include_crossover or MINTY.config.dev_mode
        end
        if data.dev then 
            sendTraceMessage("Checking dev mode option for "..folder..'/'..name..".lua")
            load = load and MINTY.config.dev_mode 
        end
        if load then
            sendTraceMessage("Loading file: "..folder..'/'..name..'.lua', "Minty's Mod")
            SMODS.load_file(folder..'/'..name..'.lua')()
        else
            sendTraceMessage("Skipping file: "..folder..'/'..name..'.lua', "Minty's Mod")
        end
        ::nvm::
    end
end