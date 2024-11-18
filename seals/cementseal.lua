local cement_seal = {
	object_type = "Seal",
	name = "cement_seal",
	key = "cement_seal",
    loc_txt = {
      name = "Cement Seal",
      label = "Cement Seal",
      text = {
        "Sealed card acts like a Stone Card",
        "(+50 Chips, scores even if",
        "not part of played hand,",
        "resistant to debuffs)"
      }
  },
  config = {extra = {chips = 50}},
	badge_colour = HEX("545454"), --a cement-y grey, hopefully
	atlas = "cementseal",
    pos = {x = 0, y = 0},
	calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if not context.end_of_round and not context.before and not context.after then
              G.E_MANAGER:add_event(Event({func = function()
                  card:juice_up(0.8, 0.8)
              return true end }))
          return {
          colour = G.C.CHIPS,
          chips = card.ability.extra.chips
          }
      end
    end
	end
}

return {name = "Seals",
        list = {cement_seal,}
}