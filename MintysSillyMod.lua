--SMODS.Atlas {
--    key = 'mintyjokeratlas',
--    path = "jokers.png",
--    px = 71,
--    py = 95
--}

minty_config = SMODS.current_mod.config
NFS.load(SMODS.current_mod.path .. 'configui.lua')()

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
    px = 71,
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

-- Debug message
function say(message)
    sendDebugMessage('[Minty\'s Silly Mod] - '..(message or '???'))
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

--Talisman compatibility compatibility
to_big = to_big or function(x) 
    return x
end

NFS.load(SMODS.current_mod.path .. 'suits/3suit.lua')()

-- NFS.load(SMODS.current_mod.path .. 'jokers/JOKER.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/hedonist.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/claw.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/froyo.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/prosopagnosia.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/lucky.lua')()


if FusionJokers then
    NFS.load(SMODS.current_mod.path .. 'jokers/threecats.lua')()
end

NFS.load(SMODS.current_mod.path .. 'consumables/tarots.lua')()
NFS.load(SMODS.current_mod.path .. 'consumables/spectrals.lua')()
NFS.load(SMODS.current_mod.path .. 'backs/backs.lua')()

NFS.load(SMODS.current_mod.path .. 'blinds/thenip.lua')()

NFS.load(SMODS.current_mod.path .. 'seals/cementseal.lua')()


