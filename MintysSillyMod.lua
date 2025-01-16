minty_config = SMODS.current_mod.config
NFS.load(SMODS.current_mod.path .. 'configui.lua')()

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
function say(message)
    sendDebugMessage('[Minty] - '..(message or '???'))
end

-- Exotic system toggle logic (copied from Bunco)
function disable_exotics()
    if G.GAME then G.GAME.Exotic = false end
    say('Triggered Exotic System disabling.')
end

function enable_exotics()
    if G.GAME then G.GAME.Exotic = true end
    say('Triggered Exotic System enabling.')
end

exotic_in_pool = function()
    return G.GAME and G.GAME.Exotic
end

function Card:is_3(bypass_debuff)
    local count = 0
        if self.debuff and not bypass_debuff then return false end
        if self.ability.name == "Wild Card" or self.base.suit == 'minty_3s' then
            count = count + 1
        end
        if next(find_joker("Treat-o-Vision")) and self.base.suit == G.GAME.treatovision_suit then
            count = count + 1
        end
        if self:get_id() == 3 then
            count = count + 1
        end
        --[[if self.ability.name == "fuzzy enhancement" then
            count = count + 1
        end]]
        --[[if (is feline edition) then
            count = count + 1
        end]]
        --[[if (has kity seal) then
            count = count + 1
        end]]

        if (SMODS.Mods["Gemstone"] or {}).can_load then
            if self.ability.gemslot_catseye then
                count = count + 1
            end
        end

        if count == 0 then return false else return count end
end

--Talisman compatibility compatibility
to_big = to_big or function(x) 
    return x
end

NFS.load(SMODS.current_mod.path .. 'suits/3suit.lua')()

-- NFS.load(SMODS.current_mod.path .. 'jokers/JOKER.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/froyo.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/hedonist.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/claw.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/prosopagnosia.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/phasebus.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/slowtiger.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/cube.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/eaten.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/excited.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/chisel.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/bucket.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/treatovision.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/lucky.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/stormy.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/patchy.lua')()

NFS.load(SMODS.current_mod.path .. 'jokers/vanillatweaks.lua')()

if (SMODS.Mods["ortalab"] or {}).can_load then
    NFS.load(SMODS.current_mod.path .. 'jokers/ascetic.lua')()
end

if (SMODS.Mods["FusionJokers"] or {}).can_load then
    NFS.load(SMODS.current_mod.path .. 'jokers/threecats.lua')()
end

if (SMODS.Mods["paperback"] or {}).can_load then
    NFS.load(SMODS.current_mod.path .. 'jokers/churu.lua')()
end

if (SMODS.Mods["Gemstone"] or {}).can_load then
    NFS.load(SMODS.current_mod.path .. 'consumables/gemstones.lua')()
end

NFS.load(SMODS.current_mod.path .. 'consumables/tarots.lua')()
NFS.load(SMODS.current_mod.path .. 'consumables/spectrals.lua')()
NFS.load(SMODS.current_mod.path .. 'backs/backs.lua')()

NFS.load(SMODS.current_mod.path .. 'blinds/thenip.lua')()

NFS.load(SMODS.current_mod.path .. 'seals/cementseal.lua')()

