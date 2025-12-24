SMODS.Booster{
    key = "mod_normal_1",
    kind = "mod_packs",
    group_key = "k_minty_mod_packs",
    atlas = "boosters",
    pos = {
        x = 0,
        y = 1,
    },
    config = {
        extra = 2,
        choose = 1,
        mod = {
            shortname = "Mod",
            name = "a random mod"
        }
    },
    cost = 5,
    weight = 1,
    set_ability = function (self, card, initial, delay_sprites)
        if card.ability.mod.shortname == "Mod" then
            local _ = {}
            while (_.count or 0) < self.config.extra do
                _ = pseudorandom_element(MINTY.packable_mods, "minty_modpack_gen")
            end
            local mod = copy_table(_)
            card.ability.mod = mod
        end
    end,
    loc_vars = function (self, info_queue, card)
        local mod = card.ability.mod
        if MINTY.in_collection(card) then
            mod = {
                shortname = "Mod", --TODO localizify this??
                name = localize("k_minty_random_mod"),
                colour = G.C.FILTER
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
            G.GAME.real_banned_keys = copy_table(G.GAME.banned_keys or {})
            MINTY.event(function ()
                if G.pack_cards then return false end
                G.GAME.banned_keys = G.GAME.real_banned_keys
                G.GAME.real_banned_keys = nil
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
        x = 1,
        y = 1,
    },
    config = {
        extra = 2,
        choose = 1,
        mod = {
            shortname = "Mod",
            name = "a random mod"
        }
    },
    cost = 5,
    weight = 1,
    set_ability = function (self, card, initial, delay_sprites)
        if card.ability.mod.shortname == "Mod" then
            local _ = {}
            while (_.count or 0) < self.config.extra do
                _ = pseudorandom_element(MINTY.packable_mods, "minty_modpack_gen")
            end
            local mod = copy_table(_)
            card.ability.mod = mod
        end
    end,
    loc_vars = function (self, info_queue, card)
        local mod = card.ability.mod
        if MINTY.in_collection(card) then
            mod = {
                shortname = "Mod",
                name = "a random mod",
                colour = G.C.FILTER
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
            G.GAME.real_banned_keys = copy_table(G.GAME.banned_keys or {})
            MINTY.event(function ()
                if G.pack_cards then return false end
                G.GAME.banned_keys = G.GAME.real_banned_keys
                G.GAME.real_banned_keys = nil
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
        x = 2,
        y = 1,
    },
    config = {
        extra = 4,
        choose = 1,
        mod = {
            shortname = "Mod",
            name = "a random mod"
        }
    },
    cost = 7,
    weight = 0.5,
    set_ability = function (self, card, initial, delay_sprites)
        if card.ability.mod.shortname == "Mod" then
            local _ = {}
            while (_.count or 0) < self.config.extra do
                _ = pseudorandom_element(MINTY.packable_mods, "minty_modpack_gen")
            end
            local mod = copy_table(_)
            card.ability.mod = mod
        end
    end,
    loc_vars = function (self, info_queue, card)
        local mod = card.ability.mod
        if MINTY.in_collection(card) then
            mod = {
                shortname = "Mod",
                name = "a random mod",
                colour = G.C.FILTER
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
        if i==1 then
            G.GAME.real_banned_keys = copy_table(G.GAME.banned_keys or {})
            MINTY.event(function ()
                if G.pack_cards then return false end
                G.GAME.banned_keys = G.GAME.real_banned_keys
                G.GAME.real_banned_keys = nil
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
    key = "mod_mega",
    kind = "mod_packs",
    group_key = "k_minty_mod_packs",
    atlas = "boosters",
    pos = {
        x = 3,
        y = 1,
    },
    config = {
        extra = 4,
        choose = 2,
        mod = {
            shortname = "Mod",
            name = "a random mod"
        }
    },
    cost = 9,
    weight = 0.125,
    set_ability = function (self, card, initial, delay_sprites)
        if card.ability.mod.shortname == "Mod" then
            local _ = {}
            while (_.count or 0) < self.config.extra do
                _ = pseudorandom_element(MINTY.packable_mods, "minty_modpack_gen")
            end
            local mod = copy_table(_)
            card.ability.mod = mod
        end
    end,
    loc_vars = function (self, info_queue, card)
        local mod = card.ability.mod
        if MINTY.in_collection(card) then
            mod = {
                shortname = "Mod",
                name = "a random mod",
                colour = G.C.FILTER
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
            G.GAME.real_banned_keys = copy_table(G.GAME.banned_keys or {})
            MINTY.event(function ()
                if G.pack_cards then return false end
                G.GAME.banned_keys = G.GAME.real_banned_keys
                G.GAME.real_banned_keys = nil
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