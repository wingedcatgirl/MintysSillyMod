SMODS.Booster{
    key = "mod_normal_1",
    kind = "mod_packs",
    group_key = "k_minty_mod_packs",
    atlas = "boosters",
    pos = {
        x = 0,
        y = 0,
    },
    config = {
        extra = 2,
        choose = 1,
        mod = {
            shortname = "Mod",
            name = "a random mod"
        }
    },
    set_ability = function (self, card, initial, delay_sprites)
        if card.ability.mod.shortname == "Mod" then
            local mod = copy_table(pseudorandom_element(MINTY.packable_mods, "minty_modpack_gen"))
            card.ability.mod = mod
        end
    end,
    loc_vars = function (self, info_queue, card)
        local mod = card.ability.mod
        if MINTY.in_collection(card) then
            mod = {
                shortname = "Mod",
                name = "a random mod",
                colour = G.C.ATTENTION
            }
        end
        return {
            key = "p_minty_mod_normal",
            vars = {
                mod.shortname,
                mod.name,
                card.ability.choose,
                card.ability.extra,
                colours = {
                    mod.colour
                }
            }
        }
    end,
    in_pool = function (self, args)
        return true
    end,
    create_card = function (self, card, i)
        if i==1 then
            local oldban = copy_table(G.GAME.banned_keys or {})
            MINTY.event(function ()
            if G.pack_cards then return false end
            G.GAME.banned_keys = oldban
            return true
            end, {blocking = false, blockable = false})
        end
        for k,v in pairs(G.P_CENTERS) do
            if (v.original_mod or {}).id ~= card.ability.mod.id then
                G.GAME.banned_keys[k] = true
            end
        end

        return {
            set = "Joker",
            key_append = "minty_mod_pack",
            skip_materialize = true
        }
    end
}

SMODS.Booster{
    key = "mod_normal_2",
    kind = "mod_packs",
    group_key = "k_minty_mod_packs",
    atlas = "boosters",
    pos = {
        x = 0,
        y = 0,
    },
    config = {
        extra = 2,
        choose = 1,
        mod = {
            shortname = "Mod",
            name = "a random mod"
        }
    },
    set_ability = function (self, card, initial, delay_sprites)
        if card.ability.mod.shortname == "Mod" then
            local mod = copy_table(pseudorandom_element(MINTY.packable_mods, "minty_modpack_gen"))
            card.ability.mod = mod
        end
    end,
    loc_vars = function (self, info_queue, card)
        local mod = card.ability.mod
        if MINTY.in_collection(card) then
            mod = {
                shortname = "Mod",
                name = "a random mod",
                colour = G.C.ATTENTION
            }
        end
        return {
            key = "p_minty_mod_normal",
            vars = {
                mod.shortname,
                mod.name,
                card.ability.choose,
                card.ability.extra,
                colours = {
                    mod.colour
                }
            }
        }
    end,
    in_pool = function (self, args)
        return true
    end,
    create_card = function (self, card, i)
        if i==1 then
            local oldban = copy_table(G.GAME.banned_keys or {})
            MINTY.event(function ()
            if G.pack_cards then return false end
            G.GAME.banned_keys = oldban
            return true
            end, {blocking = false, blockable = false})
        end
        for k,v in pairs(G.P_CENTERS) do
            if (v.original_mod or {}).id ~= card.ability.mod.id then
                G.GAME.banned_keys[k] = true
            end
        end

        return {
            set = "Joker",
            key_append = "minty_mod_pack",
            skip_materialize = true
        }
    end
}

SMODS.Booster{
    key = "mod_jumbo",
    kind = "mod_packs",
    group_key = "k_minty_mod_packs",
    atlas = "boosters",
    pos = {
        x = 0,
        y = 0,
    },
    config = {
        extra = 4,
        choose = 1,
        mod = {
            shortname = "Mod",
            name = "a random mod"
        }
    },
    set_ability = function (self, card, initial, delay_sprites)
        if card.ability.mod.shortname == "Mod" then
            local mod = copy_table(pseudorandom_element(MINTY.packable_mods, "minty_modpack_gen"))
            card.ability.mod = mod
        end
    end,
    loc_vars = function (self, info_queue, card)
        local mod = card.ability.mod
        if MINTY.in_collection(card) then
            mod = {
                shortname = "Mod",
                name = "a random mod",
                colour = G.C.ATTENTION
            }
        end
        return {
            key = "p_minty_mod_jumbo",
            vars = {
                mod.shortname,
                mod.name,
                card.ability.choose,
                card.ability.extra,
                colours = {
                    mod.colour
                }
            }
        }
    end,
    in_pool = function (self, args)
        return true
    end,
    create_card = function (self, card, i)
        local oldban = copy_table(G.GAME.banned_keys or {})
        for k,v in pairs(G.P_CENTERS) do
            if (v.original_mod or {}).id ~= card.ability.mod.id then
                G.GAME.banned_keys[k] = true
            end
        end

        MINTY.event(function ()
            if G.pack_cards then return false end
            G.GAME.banned_keys = oldban
            return true
        end, {blocking = false, blockable = false})

        return {
            set = "Joker",
            key_append = "minty_mod_pack",
            skip_materialize = true
        }
    end
}

SMODS.Booster{
    key = "mod_mega",
    kind = "mod_packs",
    group_key = "k_minty_mod_packs",
    atlas = "boosters",
    pos = {
        x = 0,
        y = 0,
    },
    config = {
        extra = 4,
        choose = 2,
        mod = {
            shortname = "Mod",
            name = "a random mod"
        }
    },
    set_ability = function (self, card, initial, delay_sprites)
        if card.ability.mod.shortname == "Mod" then
            local mod = copy_table(pseudorandom_element(MINTY.packable_mods, "minty_modpack_gen"))
            card.ability.mod = mod
        end
    end,
    loc_vars = function (self, info_queue, card)
        local mod = card.ability.mod
        if MINTY.in_collection(card) then
            mod = {
                shortname = "Mod",
                name = "a random mod",
                colour = G.C.ATTENTION
            }
        end
        return {
            key = "p_minty_mod_mega",
            vars = {
                mod.shortname,
                mod.name,
                card.ability.choose,
                card.ability.extra,
                colours = {
                    mod.colour
                }
            }
        }
    end,
    in_pool = function (self, args)
        return true
    end,
    create_card = function (self, card, i)
        if i==1 then
            local oldban = copy_table(G.GAME.banned_keys or {})
            MINTY.event(function ()
            if G.pack_cards then return false end
            G.GAME.banned_keys = oldban
            return true
            end, {blocking = false, blockable = false})
        end
        for k,v in pairs(G.P_CENTERS) do
            if (v.original_mod or {}).id ~= card.ability.mod.id then
                G.GAME.banned_keys[k] = true
            end
        end

        return {
            set = "Joker",
            key_append = "minty_mod_pack",
            skip_materialize = true
        }
    end
}