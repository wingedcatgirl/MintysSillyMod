local interest_req = 5 --Thunk _hard-coded_ this... but this'll be easier to change if smods ever makes it a variable

SMODS.Joker {
    key = "duckhat",
    name = "Duck in a Top Hat Thursday",
    atlas = 'jokerdoodles',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 4,
        y = 6
    },
    rarity = 1, --Rare-level power, but Common because it only spawns on Thursday
    cost = 9,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = false,
    thursday = function (self)
        return (os.date("%w") == "4")
    end,
    config = {
        extra = {
            interest = 4,
            valboost = 2,
            dollars = 3,
        },
        immutable = {
            actualinterestchange = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        if MINTY.config.flavor_text then
            key = self.key.."_flavor"
        end
        return {
            key = key,
            vars = {
                card.ability.extra.interest,
                card.ability.extra.valboost,
                card.ability.extra.dollars,
                G.PROFILES[G.SETTINGS.profile].name or "player"
            }
        }
    end,
    in_pool = function (self, args)
        return MINTY.config.dev_mode or self:thursday()
    end,
    add_to_deck = function (self, card, from_debuff)
        G.GAME.interest_cap = G.GAME.interest_cap + (interest_req * card.ability.extra.interest)
        card.ability.immutable.actualinterestchange = card.ability.extra.interest
    end,
    remove_from_deck = function (self, card, from_debuff)
        G.GAME.interest_cap = math.max(G.GAME.interest_cap - (interest_req * card.ability.immutable.actualinterestchange), 25) --make sure it doesn't go below baseline if something fucky happens
    end,
    calc_dollar_bonus = function (self, card)
        return card.ability.extra.dollars
    end,
    calculate = function(self, card, context)
        if not (MINTY.config.dev_mode or self:thursday()) and not card.bye then
            card.bye = true
            G.E_MANAGER:add_event(Event({
				func = function()
                    card_eval_status_text(
                        card,
                        "jokers",
                        nil,
                        nil,
                        nil,
                        { message = localize("k_minty_bye"), colour = G.C.GOLD }
                    )
					--play_sound("tarot1")
			        SMODS.destroy_cards(card, true)
					return true
				end,
			}))
            return
        end

        if card.ability.immutable.actualinterestchange ~= card.ability.extra.interest then
            G.GAME.interest_cap = G.GAME.interest_cap - (interest_req * card.ability.immutable.actualinterestchange)
            G.GAME.interest_cap = G.GAME.interest_cap + (interest_req * card.ability.extra.interest)
            card.ability.immutable.actualinterestchange = card.ability.extra.interest
        end

        if (context.end_of_round and context.cardarea == G.jokers) then
            local target = pseudorandom_element(G.jokers.cards, "minty_duckhat")
            local tries = 0
            local extra
            while target == card and tries < 100 and #G.jokers.cards > 1 do
                tries = tries + 1
                target = pseudorandom_element(G.jokers.cards, "minty_duckhat")
            end

            card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.valboost
            card:set_cost()
            if target ~= card then
                target.ability.extra_value = (target.ability.extra_value or 0) + card.ability.extra.valboost
                target:set_cost()
                extra = {
                    message = localize('k_val_up'),
                    colour = G.C.MONEY,
                    message_card = target
                }
            end
            
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY,
                extra = extra
            }
        end
    end
}