minty_config = SMODS.current_mod.config
SMODS.load_file('configui.lua')()
SMODS.current_mod.optional_features = {
    retrigger_joker = true,
    post_trigger = true,
    cardareas = {
        unscored = true,
    },
}

SMODS.Atlas {
    key = 'mintyjokeratlas',
    path = "jokers.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'cementseal',
    path = "cementseal.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'mintyjokerblank',
    path = "blank.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'mintyjokerplaceholder',
    path = "placeholders.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'mintyortalabplaceholder',
    path = "ortalab placeholders.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'mintylegends',
    path = "legendaries.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = '3s',
    path = "3s.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'mintybacks',
    path = "backs.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'mintysleeves',
    path = "sleeves.png",
    px = 73,
    py = 95
}

SMODS.Atlas {
    key = '3sicon',
    path = "3sicon.png",
    px = 18,
    py = 18
}

SMODS.Atlas {
    key = 'mintyblinds',
    path = "blinds.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    px = 34,
    py = 34
}

function SMODS.current_mod.reset_game_globals()
    reset_treat_card()
end

-- Debug message
function mintySay(message, level)
    message = message or "???"
    level = level or "DEBUG"
    sendMessageToConsole(level, "Minty's Mod", message)
end

-- Exotic system toggle logic (copied from Bunco)
disable_exotics = disable_exotics or function()
    if G.GAME then G.GAME.Exotic = false end
    mintySay('Triggered Exotic System disabling.')
end

enable_exotics = enable_exotics or function()
    if G.GAME then G.GAME.Exotic = true end
    mintySay('Triggered Exotic System enabling.')
end

exotic_in_pool = function()
    return G.GAME and G.GAME.Exotic
end

function Card:is_3(bypass_debuff)
    local count = 0
        if self.debuff and not bypass_debuff then return false end
        if SMODS.has_any_suit(self) or self.base.suit == 'minty_3s' or (next(find_joker("Treat-o-Vision")) and self.base.suit == G.GAME.treatovision_suit) then
            count = count + 1
        end
        if self:get_id() == 3 then
            count = count + 1
        end
        --[[if self.ability.name == "fuzzy enhancement" then
            count = count + 3
        end]]
        --[[if (has kity seal) then
            count = count + 3
        end]]

        if (SMODS.Mods["Gemstone"] or {}).can_load then
            if self.ability.gemslot_catseye then
                count = count + 2
            end
            if self.ability.gemslot_sapphire then --Remove this if Gemstones hooks sapphires into SMODS.has_any_suit
                count = count + 1
            end
        end
        --[[if (is feline edition) then
            count = count * 2
        end]]

        if count == 0 then return false else return count end
end

--Talisman compatibility compatibility
to_big = to_big or function(x) 
    return x
end

to_number = to_number or function(x)
    return x
end

SMODS.ObjectType({ --Legendary Kity pool
    key = "kity",
    default = "j_lucky_cat",
	cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
    end
})

SMODS.load_file('suits/3suit.lua')()

-- SMODS.load_file('jokers/JOKER.lua')()
SMODS.load_file('jokers/froyo.lua')()
SMODS.load_file('jokers/hedonist.lua')()
SMODS.load_file('jokers/claw.lua')()
SMODS.load_file('jokers/prosopagnosia.lua')()
SMODS.load_file('jokers/phasebus.lua')()
SMODS.load_file('jokers/slowtiger.lua')()
SMODS.load_file('jokers/cube.lua')()
SMODS.load_file('jokers/eaten.lua')()
SMODS.load_file('jokers/excited.lua')()
SMODS.load_file('jokers/chisel.lua')()
SMODS.load_file('jokers/bucket.lua')()
SMODS.load_file('jokers/treatovision.lua')()
SMODS.load_file('jokers/wildsupport.lua')()
SMODS.load_file('jokers/gymbuddy.lua')()
SMODS.load_file('jokers/lucky.lua')()
SMODS.load_file('jokers/stormy.lua')()
SMODS.load_file('jokers/patchy.lua')()
if (SMODS.Mods["Talisman"] or {}).can_load then
    SMODS.load_file('jokers/minty.lua')()
end
SMODS.load_file('jokers/garfielf.lua')()

SMODS.load_file('jokers/vanillatweaks.lua')()

if (SMODS.Mods["ortalab"] or {}).can_load or minty_config.include_crossover then
    SMODS.load_file('jokers/ascetic.lua')()
    SMODS.load_file('jokers/sabertooth.lua')()

    --[[if (SMODS.Mods["FusionJokers"] or {}).can_load then
        SMODS.load_file('jokers/ninethlion.lua')()
    end]]
    SMODS.load_file('jokers/lune.lua')()

    SMODS.load_file('blinds/thetree.lua')()
end

if (SMODS.Mods["FusionJokers"] or {}).can_load then
    SMODS.load_file('jokers/threecats.lua')()
end

if (SMODS.Mods["paperback"] or {}).can_load then
    SMODS.load_file('jokers/churu.lua')()
end

if (SMODS.Mods["paperback"] or {}).can_load or minty_config.include_crossover then
    SMODS.load_file('jokers/catnipfields.lua')()
end

if (SMODS.Mods["Gemstone"] or {}).can_load then
    SMODS.load_file('consumables/gemstones.lua')()
end

SMODS.load_file('consumables/tarots.lua')()
SMODS.load_file('consumables/spectrals.lua')()
SMODS.load_file('backs/backs.lua')()

SMODS.load_file('blinds/thenip.lua')()

SMODS.load_file('seals/cementseal.lua')()
--
