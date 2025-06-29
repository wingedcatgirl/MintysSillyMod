SMODS.PokerHandPart{ -- Handful of Rocks base
    key = 'handful',
    func = function(hand)
        local cards = {}
        local count = 0

        for _, card in ipairs(hand) do
            local enh = card.config.center.key
            if MINTY.rocks[enh] then
                table.insert(cards, card)
                count = count+1
            end
        end
        if count >= 5 then
            return {cards}
        else
            return {}
        end
    end
}

SMODS.PokerHand{ -- Handful of Rocks
    key = 'Handful',
    visible = false,
    chips = 100,
    mult = 10,
    l_chips = 50,
    l_mult = 1,
    example = {
        { 'S_2', true, enhancement = "m_minty_microcline"  },
        { 'D_7', true, enhancement = "m_minty_microcline"  },
        { 'C_3', true, enhancement = "m_minty_marble"      },
        { 'C_5', true, enhancement = "m_stone"             },
        { 'H_K', true, enhancement = "m_minty_crystal"     },
    },
    evaluate = function(parts)
        return parts.handful
    end
}

SMODS.PokerHand{ -- Flush Handful
    key = 'Flush Handful',
    visible = false,
    chips = 110,
    mult = 12,
    l_chips = 55,
    l_mult = 2,
    example = {
        { 'S_2', true, enhancement = "m_minty_marble"  },
        { 'D_7', true, enhancement = "m_minty_marble"  },
        { 'C_3', true, enhancement = "m_minty_marble"  },
        { 'C_5', true, enhancement = "m_minty_marble"  },
        { 'H_K', true, enhancement = "m_minty_marble"  },
    },
    evaluate = function(parts)
        if not next(parts.handful) then return {} end
        local handflush = {}
        local cards = {}
        for _, card in ipairs(parts.handful) do
            local enh = card.config.center.key
            handflush[enh] = (handflush[enh] or 0) + 1
        end
        local check = false
        for enh,count in pairs(handflush) do
            if count >= 5 then
                for _,card in ipairs(parts.handful) do
                    if enh == card.config.center.key then
                        table.insert(cards, card)
                    end
                end
                check = true
            end
        end

        return check and cards or {}
    end
}