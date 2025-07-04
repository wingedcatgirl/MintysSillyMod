---Debug messages
---@param message string Message to send
---@param level? string Log level, DEBUG by default, TRACE won't send unless dev mode is active since DebugPlus doesn't have that filter fsr
function MINTY.say(message, level)
    message = message or "???"
    level = level or "DEBUG"
    while #level < 5 do
        level = level.." "
    end
    if level == "TRACE" and not (MINTY.config.dev_mode and not MINTY.config.suppress_trace) then
        return
    end
    sendMessageToConsole(level, "Minty's Mod", message)
end

---Enables Bunco's exotics and anything that relies on them
MINTY.enable_exotics = function()
    if G.GAME then G.GAME.Exotic = true end
    MINTY.say("Enabled Bunco's exotic system, for some reason", "TRACE")
end

---Disables Bunco's exotics and anything that relies on them
MINTY.disable_exotics = function()
    if G.GAME then G.GAME.Exotic = false end
    MINTY.say("Disabled Bunco's exotic system, for some reason", "TRACE")
end

---Checks if Bunco's exotics are enabled, or if 3s are enabled and the relevant config is active 
MINTY.exotic_in_pool = function()
    return G.GAME and G.GAME.Exotic
end

---Enables 3 suit and accessories
MINTY.enable_threeSuit = function()
    if not G.GAME then
        MINTY.say("Attempted to enable 3 suit, but there is no game.", "DEBUG")
        return
    end
    G.GAME.threeSuitEnabled = true
    if G.GAME.Exotic then
        MINTY.say("Attempted to enable 3 suit, but Exotic suits are already enabled.", "TRACE")
    else
        MINTY.say("Enabled 3 suit.", "TRACE")
    end
end

---Disables 3 suit and accessories
MINTY.disable_threeSuit = function()
    if not G.GAME then
        MINTY.say("Attempted to disable 3 suit, but there is no game.", "DEBUG")
        return
    end
    G.GAME.threeSuitEnabled = false
    if G.GAME.Exotic then
        MINTY.say("Attempted to disable 3 suit, but Exotic suits are still enabled.", "TRACE")
    else
        MINTY.say("Disabled 3 suit.", "TRACE")
    end
end

---Checks whether 3s and 3 accessories should spawn; a Spectrum has been played or 3s or Exotics have been force-enabled
---@param fallback? boolean Forces true if Spectrum Framework is not active; default false
---@return boolean
MINTY.threeSuit_in_pool = function(fallback)
    if G.GAME.starting_params.start_with_3s then return true end
    if MINTY.config.three_lock.current_option == 3 then
        return false
    elseif MINTY.config.three_lock.current_option == 1 then
        return true
    end
    local spectrum = false

    if SPECF then
        spectrum = SPECF.spectrum_played()
    else
        if fallback then return true end
    end
    return G.GAME and (spectrum or G.GAME.threeSuitEnabled or G.GAME.Exotic)
end

---Checks how many times a card counts as a 3
---@param bypass_debuff boolean?
---@return any --Since 0 is truthy in lua, we have to return boolean false in that case
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
    MINTY.say("Using Minty's function for this")
    if not G.GAME then return "ERROR: Hands don't exist yet!" end
    HandName = HandName or "Spectrum"
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

---Adds to a global count when lucky cards hit; currently disabled because I can't figure out how to distinguish "unnatural" hits
---@param mod integer
MINTY.luckyCount = function(mod)
    mod = mod or 1
    G.GAME.total_lucky_count = G.GAME.total_lucky_count and (G.GAME.total_lucky_count + mod) or mod
    MINTY.say("Lucky counted", "TRACE")
    --[[if G and G.GAME and not G.GAME.unnatural_lucky then
        G.GAME.natural_lucky_count = G.GAME.natural_lucky_count and (G.GAME.natural_lucky_count + mod) or mod
        MINTY.say("Natural lucky counted", "DEBUG")
    end--]]
end

---Testing function cause I keep forgetting how pairs and ipairs work, don't worry about it 
MINTY.centercount = function (args)
    args = args or {}
    local mod = args.mod or "MintysSillyMod"
    local modprefix = SMODS.Mods[mod].prefix.."_"
    local itemprefix = args.itemprefix or "sleeve_"
    local count = 0
    for k,v in pairs(G.P_CENTERS) do
        if string.find(k,itemprefix..modprefix) then
            count = count + 1
            MINTY.say(k)
        end
    end
    MINTY.say(tostring(count))
end

---@param this? string Pass a sleeve key to check if it already got unlocked this session
---@param debug? boolean Print debugging strings
---@return string result Key of the stake that will unlock next sleeve, or already unlocked sleeve with key passed into `this` 
---@return integer count Count (order) of the same stake as `string`
MINTY.sleeveunlockcheck = function(this, debug)
  MINTY.nextSleeveUnlock = MINTY.nextSleeveUnlock or {}

  local sleeves = {}
    for k,_ in pairs(G.P_CENTERS) do
        if string.find(k,"sleeve_minty_") then
            table.insert(sleeves, k)
        end
    end
  local count = 1
  local result = "stake_gold"
  for _, sleeve in ipairs(sleeves) do
    if G.P_CENTERS[sleeve] and G.P_CENTERS[sleeve].unlocked == true then
      count = count + 1
    end
  end

  if debug then
    MINTY.say(tprint(sleeves))
  end

  if count > G.P_STAKES.stake_gold.count then
    count, result = G.P_STAKES.stake_gold.count, "stake_gold"
  else
    for key, stake in pairs(G.P_STAKES) do
      if stake.count == count then
        result = key
      end
    end
  end

  MINTY.nextSleeveUnlock.key, MINTY.nextSleeveUnlock.result = result, count
  if MINTY.nextSleeveUnlock[this] then --patch to report the stake unlocked _on_ in the postgame unlock report thing; this doesn't save if you close the game tho
    result = MINTY.nextSleeveUnlock[this]
  end

  return result, count
end

--Talisman compatibility compatibility
to_big = to_big or function(x)
    return x
end

to_number = to_number or function(x)
    return x
end


---Shuffles which suit is made equivalent to 3s by Treat-o-vision; pulls a random card with a non-3 suit from the deck and uses that.
function MINTY.reset_treat_card()
    G.GAME.treatovision_suit = 'Spades'
    local valid_treat_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if not SMODS.has_no_suit(v) and v.base.suit ~= 'minty_3s' then
            valid_treat_cards[#valid_treat_cards+1] = v
        end
    end
    if valid_treat_cards[1] then
        local treat_card = pseudorandom_element(valid_treat_cards, pseudoseed('treat'..G.GAME.round_resets.ante))
        G.GAME.treatovision_suit = treat_card.base.suit
    end
    --sendDebugMessage('[Minty] Treat-o-vision suit reset to '..G.GAME.treatovision_suit)
end

function SMODS.current_mod.reset_game_globals(init)
    G.GAME.languageEgg = G.GAME.languageEgg or {}
    G.GAME.languageEgg[G.SETTINGS.language] = true

    G.GAME.minty_hyperfix = G.GAME.minty_hyperfix or { active = true, value = 0 }
    if G.GAME.minty_hyperfix.active and not init then
        G.GAME.minty_hyperfix.value = (G.GAME.minty_hyperfix.value or 0) + 1
    end

    MINTY.reset_treat_card()
end

SMODS.current_mod.set_debuff = function (card)
  if card.seal == "minty_cement" then
     return "prevent_debuff"
  end
end