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

---Checks whether a card is in the collection (as opposed to e.g. the hand or Jokers tray)
---@param card table Card to check
---@return boolean
MINTY.in_collection = function (card)
    if G.your_collection then
        for k, v in pairs(G.your_collection) do
            if card.area == v then
                return true
            end
        end
    end
    return false
end

---Enables Bunco's exotics and anything that relies on them
MINTY.enable_exotics = function()
    if G.GAME then G.GAME.Exotic = true end
    MINTY.say("Enabled Bunco's exotic system, for some reason", "TRACE")
end

---Disables Bunco's exotics and anything that relies on them. I don't remember why I wanted these 👍️
MINTY.disable_exotics = function()
    if G.GAME then G.GAME.Exotic = false end
    MINTY.say("Disabled Bunco's exotic system, for some reason", "TRACE")
end

---Checks if Bunco's exotics are enabled
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

    local threelock = G.GAME.starting_params.minty_three_lock or MINTY.config.three_lock.current_option
    
    if threelock == 3 then
        return false
    elseif threelock == 1 then
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
---@return integer|boolean --Number of times the card counts as a 3, or `false` if it doesn't count as a 3 (0 is truthy in lua...)
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

        if (SMODS.Mods["aikoyorisshenanigans"] or {}).can_load then
            if self.get_letter_with_pretend and self:get_letter_with_pretend() == "3" then count = count + 1 end
        end

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

---@param this? string Pass a sleeve key to check if it already got unlocked
---@param debug? boolean Print debugging strings
---@return string result Key of the stake that will unlock next sleeve, or already unlocked sleeve with key passed into `this` 
---@return integer count Count (order) of the same stake as `string`
MINTY.sleeveunlockcheck = function(this, debug)
  G.PROFILES[G.SETTINGS.profile].mintysleeves = G.PROFILES[G.SETTINGS.profile].mintysleeves or {}

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

  G.PROFILES[G.SETTINGS.profile].mintysleeves.key, G.PROFILES[G.SETTINGS.profile].mintysleeves.result = result, count
  if G.PROFILES[G.SETTINGS.profile].mintysleeves[this] then --put it in the settings?
    result = G.PROFILES[G.SETTINGS.profile].mintysleeves[this]
  end

  G:save_settings()
  return result, count
end

MINTY.rocklist = function ()
    MINTY.rocks = MINTY.rocks or {}
    local outside_rocks = {
        m_ortalab_ore = true,
        m_akyrs_brick_card = true,
        m_mf_gemstone = true,
        m_stone = true,
        --Minty rock list patch target

    }

    for k,v in pairs(G.P_CENTERS) do
        if (v.minty_rock) or outside_rocks[k] then
            MINTY.rocks[v.key] = true
        end
    end
end

---Do the tarot flip thing to all of G.hand.highlighted
---@param card Card
---@param args table `rank`, `suit`, `enh`, `edi` = keys of the appropriate target modifications. alternately `random_ranks`, `random_suits`, `random_enhs`, `random_edis` are tables of same keys to pick one at random, in which case you need `seed` to seed the seed. Note: To clear an edition, pass the string "base", "none", "false", or "remove" as the edition key.
MINTY.tarotflip = function (card, args)
    if not args then
        MINTY.say("hey you forgor to say anything when trying to change these cards", "ERROR")
        return
    end
    local rank = args.rank
    local ranks = args.random_ranks
    local suit = args.suit
    local suits = args.random_suits
    local enh = args.enh
    local enhs = args.random_enhs
    local edi = args.edi
    local edis = args.random_edis
    local seed = args.seed or "minty_tarotflip_seedless_probably_shouldn't_happen_tbh"
    local sound = args.sound
    if not (rank or ranks or suit or suits or enh or enhs or edi or edis) or (rank and ranks) or (suit and suits) or (enh and enhs) or (edi and edis) or ((ranks or suits or enhs or edis) and not args.seed) then
        MINTY.say("hey you didn't type the right arguments?", "ERROR")
        tprint(args or {})
    end

    if card then
        G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true
        end }))
    end

    if (rank or ranks or suit or suits or enh or enhs) then
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                G.hand.highlighted[i]:flip()
                play_sound('card1', percent)
                G.hand.highlighted[i]:juice_up(0.3, 0.3)
                return true
            end
            }))
        end
        delay(0.2)
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                if ranks then rank = pseudorandom_element(ranks, pseudoseed(seed)) end
                if suits then suit = pseudorandom_element(suits, pseudoseed(seed)) end
                if enhs then enh = pseudorandom_element(enhs, pseudoseed(seed)) end
                if rank or suit then
                    assert(SMODS.change_base(G.hand.highlighted[i], suit, rank))
                end
                if enh then
                    G.hand.highlighted[i]:set_ability(G.P_CENTERS[enh])
                end
                return true
            end
            }))
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + ( i - 0.999 ) / ( #G.hand.highlighted - 0.998 ) * 0.3
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                G.hand.highlighted[i]:flip()
                play_sound(sound or 'tarot2', percent, 0.6)
                G.hand.highlighted[i]:juice_up(0.3, 0.3)
                return true
            end
            }))
        end
    end

    if (edi or edis) then
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                if edis then edi = pseudorandom_element(edis, pseudoseed(seed)) end
                if edi then
                    if edi == "base" or edi == "none" or edi == "false" or edi == "remove" then edi = nil end
                    G.hand.highlighted[i]:set_edition(edi)
                    G.hand.highlighted[i]:juice_up(0.3,0.3)
                end
                return true
            end
            }))
        end
    end

    G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0.15,
    func = function()
        G.hand:unhighlight_all()
        return true
    end
    }))
    delay(0.5)
end

---Get next blind, including custom small/big blinds
---@param round string
---@return string? 
MINTY.get_blind = function (round)
    if not round then
        --figure out current round from G.GAME? Maybe not possible

        MINTY.say("Don't call MINTY.get_blind without specifying a round!", "WARN ")
        return
    elseif round == "Boss" then
        MINTY.say("Boss blind getting not implemented yet, sowwiez; using vanilla's function instead for now", "WARN ")
        return get_new_boss()
    end

    --[[ Nothing uses "perscribing" for small/big blinds yet, so disabling for now
    local perscription == "perscribed_" .. (round == "Boss" and "bosses") or round:lower()
    G.GAME[perscription] = G.GAME[perscription] or {}
    if G.GAME[perscription] and G.GAME[perscription][G.GAME.round_resets.ante] then
        local ret_blind = G.GAME[perscription][G.GAME.round_resets.ante]
        G.GAME[perscription][G.GAME.round_resets.ante] = nil
        if round == "Boss" then
            G.GAME.bosses_used[ret_blind] = G.GAME.bosses_used[ret_blind] + 1
        end
        return ret_blind
    end
    --]]

    if G["FORCE_"..round:upper()] then return G["FORCE_"..round:upper()] end

    local vanillablind = "bl_"..round:lower()

    local eligible_blinds = {[vanillablind] = true}
    for k, v in pairs(G.P_BLINDS) do
        if not v[round:lower()] then
            -- don't add
        elseif v.in_pool and type(v.in_pool) == 'function' then
            local res, options = v:in_pool()
            eligible_blinds[k] = res and true or nil
        elseif v[round:lower()].min <= math.max(1, G.GAME.round_resets.ante) then
            eligible_blinds[k] = true
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_blinds[k] then eligible_blinds[k] = nil end
    end
    --LOVELY TARGET: FURTHER BLIND CULLING

    --Including this here for now to not break Ortalab's stakes
    if G.GAME.modifiers.ortalab_only then
        for k, v in pairs(eligible_bosses) do
            if v and not G.P_BLINDS[k].mod or (G.P_BLINDS[k].mod.id ~= 'ortalab' and not (G.P_BLINDS[k].pools and G.P_BLINDS[k].pools.Ortalab)) then
                eligible_bosses[k] = nil
            end
        end
    end

    local blindpool = {}
    for k, v in pairs(eligible_blinds) do
        table.insert(blindpool, k)
        if G.GAME.modifiers.mintyallboost and (G.P_BLINDS[k].mod.id == "MintysSillyMod" or (G.P_BLINDS[k].pools and G.P_BLINDS[k].pools.MintysSillyMod)) then
            table.insert(blindpool, k)
        end
    end
    --LOVELY TARGET: FURTHER BLIND BOOSTING

    local blind = pseudorandom_element(blindpool, pseudoseed('blind'))

    return blind
end

---Checks whether any of the specified rank exist in the player's entire deck
---@param rank string Key of the rank to find
---@return boolean
function MINTY.find_rank(rank)
    if not G.playing_cards then return true end
    for k, v in ipairs(G.playing_cards) do
        if v:get_id() == SMODS.Ranks[rank].id then
            return true
        end
    end
    return false
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

    if init or not G.GAME.starting_params.minty_three_lock then
        G.GAME.starting_params.minty_three_lock = MINTY.config.three_lock.current_option
    end

    G.GAME.minty_hyperfix = G.GAME.minty_hyperfix or { active = true, value = 0 }
    if G.GAME.minty_hyperfix.active and not init then
        G.GAME.minty_hyperfix.value = (G.GAME.minty_hyperfix.value or 0) + 1
    end

    MINTY.reset_treat_card()
end

SMODS.current_mod.set_debuff = function (card)
  if
    card.seal == "minty_cement"
    or (card.ability and card.ability.name == "Marble Card")
  then
     return "prevent_debuff"
  end
end

MINTY.enhancecheck = function()
    MINTY.say("Building Inkbleed table...")
    MINTY.inkbleedtable = MINTY.inkbleedtable or {}
    for k,v in pairs(G.P_CENTERS) do
        if v.set == "Enhanced" then
            for kk, vv in pairs(G.P_CENTERS) do
                if vv.set == "Enhanced" then
                    if (localize{type = 'name_text', set = 'Enhanced', key = k} == localize{type = 'name_text', set = 'Enhanced', key = kk}) and (k ~= kk) then
                        local k1, k2 = v.key, vv.key
                        MINTY.inkbleedtable[k1] = MINTY.inkbleedtable[k1] or {}
                        MINTY.inkbleedtable[k1][k2] = true

                        MINTY.inkbleedtable[k2] = MINTY.inkbleedtable[k2] or {}
                        MINTY.inkbleedtable[k2][k1] = true
                    end
                end
            end
        end
    end
end

SMODS.current_mod.process_loc_text = function()
    G.localization.descriptions.Enhanced.m_stone_alt = G.localization.descriptions.Enhanced.m_stone_alt or {}
    G.localization.descriptions.Enhanced.m_stone_alt.text = G.localization.descriptions.Enhanced.m_stone.text
end