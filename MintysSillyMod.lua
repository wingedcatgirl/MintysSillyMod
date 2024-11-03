--SMODS.Atlas {
--    key = 'mintyjokeratlas',
--    path = "jokers.png",
--    px = 71,
--    py = 95
--}

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

-- NFS.load(SMODS.current_mod.path .. 'jokers/JOKER.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/froyo.lua')()
