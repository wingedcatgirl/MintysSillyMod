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

exotic_in_pool = exotic_in_pool or function()
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

MINTY.getSpecKey = (SPECF and SPECF.getSpecKey) or function(HandName)
    mintySay("Using Minty's function for this")
    if not G.GAME then return "ERROR: Hands don't exist yet!" end
    local HandName = HandName or "Spectrum"
    local lowest_key = nil
    local lowest_order = math.huge
    local escaped_name = HandName:gsub("([^%w])", "%%%1")  -- escape magic chars

    local suffix_pattern = "_" .. escaped_name .. "$"

    for key, hand in pairs(G.GAME.hands) do
        if key:match(suffix_pattern) and type(hand.order) == "number" then
            if hand.order < lowest_order then
                lowest_order = hand.order
                lowest_key = key
            end
        end
    end
    
    if lowest_key == nil then return "ERROR: No spectrum mod loaded!" else return lowest_key end
end

MINTY.luckyCount = function(mod)
    mod = mod or 1
    G.GAME.total_lucky_count = G.GAME.total_lucky_count and (G.GAME.total_lucky_count + mod) or mod
    mintySay("Lucky counted", "TRACE")
    --[[if G and G.GAME and not G.GAME.unnatural_lucky then
        G.GAME.natural_lucky_count = G.GAME.natural_lucky_count and (G.GAME.natural_lucky_count + mod) or mod
        mintySay("Natural lucky counted", "DEBUG")
    end--]]
end

--Talisman compatibility compatibility
to_big = to_big or function(x)
    return x
end

to_number = to_number or function(x)
    return x
end

function SMODS.current_mod.reset_game_globals()
    reset_treat_card()
end