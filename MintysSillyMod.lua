MINTY = {
    prefix = SMODS.current_mod.prefix,
    config = SMODS.current_mod.config,
}
minty_config = SMODS.current_mod.config --Fallback in case anything is still using the old variable name
assert(SMODS.current_mod.lovely, "Lovely patches whiffed! Please make sure this mod's file structure is not nested.")
SMODS.load_file('configui.lua')()
SMODS.current_mod.optional_features = {
    retrigger_joker = true,
    post_trigger = true,
    cardareas = {
        unscored = true,
    },
}
SMODS.load_file('lib/atlases.lua')()
SMODS.load_file('lib/functions.lua')()

SMODS.ObjectType({ --Kity pool (Legendary and otherwise)
    key = "kity",
    default = "j_lucky_cat",
	cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_lucky_cat)
        if (SMODS.Mods["ortalab"] or {}).can_load then --I feel like this method will break if the other mod has higher priority <.< but I don't see many mods with positive priority anyway so maybe this won't come up. And if it ever does we can do a PR instead
            self:inject_card(G.P_CENTERS.j_ortalab_black_cat)
        end
        if (SMODS.Mods["Neato_Jokers"] or {}).can_load then
            self:inject_card(G.P_CENTERS.j_neat_tabbycat)
        end
    end
})

SMODS.load_file('suits/3suit.lua')()

-- SMODS.load_file('jokers/JOKER.lua')()
SMODS.load_file('jokers/froyo.lua')()
SMODS.load_file('jokers/hedonist.lua')()
SMODS.load_file('jokers/languageegg.lua')()
SMODS.load_file('jokers/claw.lua')()
SMODS.load_file('jokers/prosopagnosia.lua')()
SMODS.load_file('jokers/phasebus.lua')()
SMODS.load_file('jokers/slowtiger.lua')()
SMODS.load_file('jokers/cube.lua')()
SMODS.load_file('jokers/eaten.lua')()
SMODS.load_file('jokers/excited.lua')()
SMODS.load_file('jokers/chisel.lua')()
SMODS.load_file('jokers/bucket.lua')()
SMODS.load_file('jokers/chocobar.lua')()
SMODS.load_file('jokers/atheismcorner.lua')()
SMODS.load_file('jokers/treatovision.lua')()
SMODS.load_file('jokers/wildsupport.lua')()
SMODS.load_file('jokers/gymbuddy.lua')()
SMODS.load_file('jokers/scoundrel.lua')()
SMODS.load_file('jokers/lucky.lua')()
SMODS.load_file('jokers/stormy.lua')()
SMODS.load_file('jokers/patchy.lua')()
if (SMODS.Mods["Talisman"] or {}).can_load then
    SMODS.load_file('jokers/hyperfix.lua')()
    SMODS.load_file('jokers/minty.lua')()
end
SMODS.load_file('jokers/garfielf.lua')()

SMODS.load_file('jokers/vanillatweaks.lua')()

if (SMODS.Mods["TOGAPack"] or {}).can_load or MINTY.config.dev_mode or MINTY.config.include_crossover then
    SMODS.load_file('jokers/neko.lua')()
end

if (SMODS.Mods["ortalab"] or {}).can_load or MINTY.config.include_crossover then
    SMODS.load_file('jokers/ascetic.lua')()
    SMODS.load_file('jokers/sabertooth.lua')()

    --[[
    if (SMODS.Mods["FusionJokers"] or {}).can_load then
        SMODS.load_file('jokers/ninethlion.lua')()
    end
    ]]
    SMODS.load_file('jokers/lune.lua')()

    SMODS.load_file('blinds/thetree.lua')()
end

if (SMODS.Mods["FusionJokers"] or {}).can_load then
    SMODS.load_file('jokers/threecats.lua')()
    SMODS.load_file('jokers/parkour.lua')()
end

if (SMODS.Mods["paperback"] or {}).can_load then
    SMODS.load_file('jokers/churu.lua')()
end

if (SMODS.Mods["paperback"] or {}).can_load or MINTY.config.include_crossover then
    SMODS.load_file('jokers/catnipfields.lua')()
end

if (SMODS.Mods["Cryptid"] or {}).can_load then
    SMODS.load_file('jokers/catpicmachine.lua')()
end

SMODS.load_file('consumables/tarots.lua')()
SMODS.load_file('consumables/spectrals.lua')()

if (SMODS.Mods["Gemstone"] or {}).can_load then
    SMODS.load_file('consumables/gemstones.lua')()
end

if (SMODS.Mods["MoreFluff"] or {}).can_load then
    SMODS.load_file('consumables/colors.lua')()
end

if (SMODS.Mods["draft"] or {}).can_load and (SMODS.Mods["draft"] or {}).version == "0.5.2.1" then --Temporary version lock until PR is merged
    SMODS.load_file('consumables/drafts.lua')()
end
SMODS.load_file('backs/backs.lua')()

SMODS.load_file('blinds/thenip.lua')()

SMODS.load_file('enhancements/marble.lua')()
SMODS.load_file('seals/cementseal.lua')()

if (SMODS.Mods["ChDp"] or {}).can_load then
    SMODS.load_file('challenge/challenges.lua')()
    SMODS.load_file('jokers/theecho.lua')()
end
--