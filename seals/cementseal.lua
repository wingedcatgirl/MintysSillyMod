local cement_seal = {
	object_type = "Seal",
	name = "cement_seal",
	key = "cement_seal",
    loc_txt = {
      name = "Cement Seal",
      label = "Cement Seal",
      text = {
        "Gonna do something all right!",
        "{C:inactive}For now it's just a joke."
      }
  },
	badge_colour = HEX("d2d8d8"), --a cement-y grey, hopefully
	atlas = "cementseal",
    pos = {x = 0, y = 0},
	calculate = function(self, card, context)
        -- TBD
	end,
}

return {name = "Seals",
        list = {cement_seal,}
}