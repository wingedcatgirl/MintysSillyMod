MINTY = {
    prefix = SMODS.current_mod.prefix,
    config = SMODS.current_mod.config -- will update stuff later
}
minty_config = SMODS.current_mod.config
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
SMODS.load_file('jokers/scoundrel.lua')()
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

if (SMODS.Mods["Cryptid"] or {}).can_load then
    SMODS.load_file('jokers/catpicmachine.lua')()
end

SMODS.load_file('consumables/tarots.lua')()
SMODS.load_file('consumables/spectrals.lua')()

if (SMODS.Mods["Gemstone"] or {}).can_load then
    SMODS.load_file('consumables/gemstones.lua')()
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