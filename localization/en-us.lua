return {
	["misc"] = {
		["dictionary"] = {
			["k_drowned_ex"] = "Drowned!",
			["k_stopped_ex"] = "Stopped!",
			["k_storm_ex"] = "Storm!",
			["k_cube"] = "Hand must contain exactly 4 cards",
		},
		["v_dictionary"] = {
			["a_chipgain"] = "+#1# Chips",
			["a_multandchips"] = "+#1# Mult, +#2# Chips",
			["a_chipsandmult"] = "+#1# Chips, +#2# Mult",
		},
		["suits_plural"] = {
			["minty_3s"] = "3s",
		},
		["suits_singular"] = {
			["minty_3s"] = "3",
		},
		["labels"] = {
			["minty_cement_seal"] = "Cement Seal",
		},
	},
	["descriptions"] = {
		["Back"] = {
			["b_minty_treat"] = {
				["name"] = "Deck With a Treat",
				["text"] = {
					"Starts with a",
					"full set of 13 {C:minty_3s}3s{}",
				},
			},
			["b_minty_catdeck"] = {
				["name"] = "Deck of the Cat",
				["text"] = {
					'All playing cards are {C:minty_3s}3s{}',
                    'and cannot change suits.',
                    '{C:attention}The Nip{} cannot appear',
                    ' ',
                    '{C:inactive}The suit, not the rank!',
				},
			},
			["b_minty_cementdeck"] = {
				["name"] = "Deck of the 6th Year",
				["text"] = {
					"All cards have a {C:minty_cement}Cement Seal{}",
            		"Cards cannot change seals",
				},
			},
		},
		["Blind"] = {
			["bl_minty_thenip"] = {
				["name"] = "The Nip",
				["text"] = {
					"All 3s are debuffed",
				},
			},
		},
		["Other"] = {
			["minty_cement_seal"] = {
				["label"] = "Cement Seal",
				["name"] = "Cement Seal",
				["text"] = {
					"{C:chips}+#1# Chips{}",
					"always scores",
					"resists debuffs",
				},
			},
		},
		["Joker"] = {
			["j_minty_cube"] = {
				["name"] = "Cube Joker",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult",
					"Played hand must contain",
					"exactly {C:attention}4{} cards",
				},
			},
			["j_minty_phasebus"] = {
				["name"] = "Phase Bus",
				["text"] = {
					"At end of round,",
					"create a {C:spectral}Spectral{} card",
					"if no {C:attention}face cards{}",
					"were scored that round.",
					"{C:inactive}(Must have room){}",
					" ",
					"{C:inactive}(Currently: #1#!){}",
				},
			},
			["j_minty_lucky"] = {
				["unlock"] = {
					"Find this Joker",
					"from the {C:spectral}Soul{} card",
				},
				["name"] = "Lucky",
				["text"] = {
					"Multiplies all {C:attention}listed",
					"{C:green,E:1,S:1.1}probabilities{} by {C:mult}33{}",
					"{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}33 in 3{C:inactive})",
				},
			},
			["j_minty_stormy"] = {
				["unlock"] = {
					"Find this Joker",
					"from the {C:spectral}Soul{} card",
				},
				["name"] = "Stormy",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult, then retrigger",
					"once for each time a previous",
					"Joker triggered this hand"
				},
			},
			["j_minty_patchy"] = {
				["unlock"] = {
					"Find this Joker",
					"from the {C:spectral}Soul{} card",
				},
				["name"] = "Patchy",
				["text"] = {
					"Played {C:minty_3s}3s{} give",
					"{X:mult,C:white} X#1# {} Mult when scored",
					"and retrigger",
				},
			},
			["j_minty_claw"] = {
				["name"] = "Fossilized Claw",
				["text"] = {
					"{C:green}#1# in #2#{} chance for",
					"played {C:minty_3s}3s{} to give",
					"{X:mult,C:white} X#3# {} Mult when scored",
				},
			},
			["j_minty_chisel"] = {
				["name"] = "Chisel",
				["text"] = {
					"Scored {C:attention}Stone{} cards lose",
					"their enhancement and",
					"gain a {C:cement}Cement Seal{}",
				},
			},
			["j_minty_bucket"] = {
				["name"] = "Bucket of Cement",
				["text"] = {
					"All scored cards",
					"become {C:attention}Stone{} cards"
				},
			},
			["j_minty_threecats"] = {
				["name"] = "Three Cats!",
				["text"] = {
					"{C:green}#1# in #5#{} chance for",
					"played {C:minty_3s}3s{} to give each of",
					"{C:chips}+#2#{} chips, {C:mult}+#3#{} Mult, and",
					"{X:mult,C:white}X#4#{} Mult when scored.",
				},
			},
			["j_minty_slowtiger"] = {
				["name"] = "Slow Tiger",
				["text"] = {
					"{C:mult}+#2#{} Mult",
					"per round",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult){}",
				},
			},
			["j_minty_froyo"] = {
				["name"] = "Frozen Yogurt",
				["text"] = {
					"{C:chips}+#1#{} Chips, {C:chips}-#2#{} Chips",
					"for every hand played",
					"{C:inactive}(But it's so much cheaper!)",
				},
			},
			["j_minty_hedonist"] = {
				["name"] = "Hedonist Joker",
				["text"] = {
					"Played {C:minty_3s}3s{} give",
					"{C:mult}+#1#{} Mult when scored",
				},
			},
			["j_minty_proso"] = {
				["name"] = "Prosopagnosia",
				["text"] = {
					"{X:mult,C:white} X#1# {} Mult if hand",
					"contains {C:attention}face{} cards,",
					"but {C:attention}no{} cards are",
					"considered face cards.",
					" ",
					"{C:inactive}You don't know what it's",
					"{C:inactive}like to spend every day",
					"{C:inactive}surrounded by monkeys.",
				},
			},
			["j_minty_ascetic"] = {
				["name"] = "Ascetic Joker",
				["text"] = {
					'Played {C:minty_3s}3s{} give',
					'{C:chips}+#1#{} Chips when scored',
				},
			},
			["j_minty_eaten"] = {
				["name"] = "Eaten Joker",
				["text"] = {
					"Played cards with rank {C:attention}7{}",
					"give {C:chips}+#2#{} Chips and {C:mult}+#1#{} Mult",
					"when scored. Destroy {C:green}#4# in #3#{}",
					"scored cards of other ranks.",
				},
			},
			["j_minty_excited"] = {
				["name"] = "Overly Excited",
				["text"] = {
					"{C:chips}+#1#{} Chips, {C:mult}+#3#{} Mult",
					"Gain {C:chips}#2#{} Chips when",
					"anything happens, or",
					"{C:green}#6# in #5#{} chance to",
					"gain {C:mult}#4#{} Mult instead"
				},
			},
			["j_minty_churutreat"] = {
				["name"] = "Churu Treat",
				["text"] = {            
					"Scored {C:minty_3s}3s{} give {C:mult}+#1#{} Mult",
					"{C:green}#2# in #3#{} chance this card is",
					"eaten at end of round",
				},
			},
			["j_minty_plastic_stick"] = {
				["name"] = "Plastic \"Stick\"",
				["text"] = {
					"Gives {X:mult,C:white}X#1#{} Mult for every",
					"other {C:attention}\"Stick\"{} Joker you have...",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
				},
			},
			["j_minty_treatovision"] = {
				["name"] = "Treat-o-vision",
				["text"] = {
					"{V:1}#1#{} and {C:minty_3s}#2#{} suits count",
					"as the same suit",
					"{C:inactive}(First suit changes each round){}"
				},
			},
		},
		["Tarot"] = {
			["c_minty_cat"] = {
				["name"] = "The Cat",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected cards",
					"to {C:minty_3s}3s{}",
				},
			},
		},
		["Spectral"] = {
			["c_minty_6years"] = {
				["name"] = "6 years",
				["text"] = {
					"Add a {C:cement}Cement Seal{}",
					"to {C:attention}1{} selected",
					"card in your hand",
				},
			},
			["c_minty_wand"] = {
				["name"] = "The Wand",
				["text"] = {
					"Summon a {C:legendary,E:1}Legendary",
					"{C:legendary,E:1}Kity{} Joker",
					"{C:inactive}(Must have room)",
				},
			},
		},
	},
}