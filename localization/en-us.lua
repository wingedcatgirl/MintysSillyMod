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
			["gemslot_catseye"] = "Cat's Eye",
		},
	},
	["descriptions"] = {
		["Back"] = {
			["b_minty_treat"] = {
				["name"] = "Deck with a Treat",
				["text"] = {
					"Starts with a",
					"full set of 13 {C:minty_3s}3s{}",
				},
			},
			["b_minty_hearts"] = {
				["name"] = "Deck of the Heart",
				["text"] = {
					"Start with an", 
					"{C:attention}eternal{} {C:hearts}Lusty Joker{}",
					"and {C:attention}The Sun{} tarot",
				},
			},
			["b_minty_diamonds"] = {
				["name"] = "Deck of the Diamond",
				["text"] = {
					"Start with an", 
					"{C:attention}eternal{} {C:diamonds}Greedy Joker{}",
					"and {C:attention}The Star{} tarot",
				},
			},
			["b_minty_clubs"] = {
				["name"] = "Deck of the Club",
				["text"] = {
					"Start with an", 
					"{C:attention}eternal{} {C:clubs}Gluttonous Joker{}",
					"and {C:attention}The Moon{} tarot",
				},
			},
			["b_minty_spades"] = {
				["name"] = "Deck of the Spade",
				["text"] = {
					"Start with an", 
					"{C:attention}eternal{} {C:spades}Wrathful Joker{}",
					"and {C:attention}The World{} tarot",
				},
			},
			["b_minty_3suit"] = {
				["name"] = "Deck of the 3",
				["text"] = {
					"Start with an", 
					"{C:attention}eternal{} {C:minty_3s}Hedonist Joker{}",
					"and {C:attention}The Cat{} tarot",
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
			["gemslot_catseye"] = {
				["name"] = "Cat's Eye",
				["text"] = {
					"Attached card",
					"counts as a {C:minty_3s}3{} {C:attention}twice{}",
				},
			},
		},
		["Gemstone"] = {
			["c_minty_catseye"] = {
				["name"] = "Cat's Eye",
				["text"]  = {
                    "Attach a {C:minty_3s}Cat's Eye",
                    "{}Gemstone to {C:green}#1#{} selected {C:attention}card{}",
                    "{C:inactive}(Must have a Gem Slot){}",
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
					"{V:1}#1#{} and {C:minty_3s}#2#{} suits",
					"count as the same suit",
					"{C:inactive}(First suit changes each round){}"
				},
			},
			["j_minty_wildsupport"] = {
				["name"] = "Wild Support",
				["text"] = {
					"Played {C:attention}Wild Cards{} give {C:green#1#{} of",
					"up to {C:mult}#2#{} Mult (+{C:mult}#7#{}),",
					"up to {X:mult,C:white}X#3#{} Mult (+{X:mult,C:white}X#8#{}),",
					"up to {C:chips}#4#{} Chips (+{C:chips}#9#{}),",
					"or up to {C:money}$#5#{} (+{C:money}$#10#{}),",
					"and {C:green}#1# in #6#{} chance to",
					"increase maximum value."
				},
			},
			["j_minty_catnipfields"] = {
				["name"] = "Catnip Fields",
				["text"] = {
					"{C:minty_3s}3s{} give {X:mult,C:white}X#1#{} Mult when scored.",
					"Increases by {X:mult,C:white}X#2#{} Mult for each ",
					"consecutively scored {C:minty_3s}3{}",
					"{C:inactive}(Resets after each hand played)",
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
		["Sleeve"] = {
			["sleeve_minty_treatsleeve"] = {
				["name"] = "Sleeve with a Treat",
				["text"] = {
					"Starts with a",
					"full set of 13 {C:minty_3s}3s{}",
				},
			},
			["sleeve_minty_treatsleeve_alt"] = {
				["name"] = "Sleeve with a Treat",
				["text"] = {
					"Starts with a full set of 13 {C:minty_3s}3s{}",
					"All 3s become 3s of {C:minty_3s}3s{}",
					"{C:green}1 in 3{} other cards change rank to 3",
					"{C:green}1 in 3{} other cards change suit to {C:minty_3s}3s{}",
				},
			},
			["sleeve_minty_heartsleeve"] = {
				["name"] = "Sleeve of the Heart",
				["text"] = {
					"Start with an",
					"{C:attention}eternal{} {C:hearts}Lusty Joker{}",
					"and {C:attention}The Sun{} tarot",
				},
			},
			["sleeve_minty_heartsleeve_alt"] = {
				["name"] = "Sleeve of the Heart",
				["text"] = {
					"Also start with",
					"an {C:attention}eternal{} {C:hearts}Bloodstone{}",
				},
			},
			["sleeve_minty_heartsleeve_fusionalt"] = {
				["name"] = "Sleeve of the Heart",
				["text"] = {
					"Instead start with an",
					"{C:attention}eternal{} {C:hearts}Heart Paladin{}",
				},
			},
			["sleeve_minty_diamondsleeve"] = {
				["name"] = "Sleeve of the Diamond",
				["text"] = {
					"Start with an",
					"{C:attention}eternal{} {C:diamonds}Greedy Joker{}",
					"and {C:attention}The Star{} tarot",
				},
			},
			["sleeve_minty_diamondsleeve_alt"] = {
				["name"] = "Sleeve of the Diamond",
				["text"] = {
					"Also start with",
					"an {C:attention}eternal{} {C:diamonds}Rough Gem{}",
				},
			},
			["sleeve_minty_diamondsleeve_fusionalt"] = {
				["name"] = "Sleeve of the Diamond",
				["text"] = {
					"Instead start with an",
					"{C:attention}eternal{} {C:diamonds}Diamond Bard{}",
				},
			},
			["sleeve_minty_clubssleeve"] = {
				["name"] = "Sleeve of the Club",
				["text"] = {
					"Start with an",
					"{C:attention}eternal{} {C:clubs}Gluttonous Joker{}",
					"and {C:attention}The Moon{} tarot",
				},
			},
			["sleeve_minty_clubssleeve_alt"] = {
				["name"] = "Sleeve of the Club",
				["text"] = {
					"Also start with",
					"an {C:attention}eternal{} {C:clubs}Onyx Agate{}",
				},
			},
			["sleeve_minty_clubssleeve_fusionalt"] = {
				["name"] = "Sleeve of the Club",
				["text"] = {
					"Instead start with an",
					"{C:attention}eternal{} {C:clubs}Club Wizard{}",
				},
			},
			["sleeve_minty_spadessleeve"] = {
				["name"] = "Sleeve of the Spade",
				["text"] = {
					"Start with an",
					"{C:attention}eternal{} {C:spades}Wrathful Joker{}",
					"and {C:attention}The World{} tarot",
				},
			},
			["sleeve_minty_spadessleeve_alt"] = {
				["name"] = "Sleeve of the Spade",
				["text"] = {
					"Also start with",
					"an {C:attention}eternal{} {C:spades}Arrowhead{}",
				},
			},
			["sleeve_minty_spadessleeve_fusionalt"] = {
				["name"] = "Sleeve of the Spade",
				["text"] = {
					"Instead start with an",
					"{C:attention}eternal{} {C:spades}Spade Archer{}",
				},
			},
			["sleeve_minty_3suitsleeve"] = {
				["name"] = "Sleeve of the 3",
				["text"] = {
					"Start with an",
					"{C:attention}eternal{} {C:minty_3s}Hedonist Joker{}",
					"and {C:attention}The Cat{} tarot",
				},
			},
			["sleeve_minty_3suitsleeve_alt"] = {
				["name"] = "Sleeve of the 3",
				["text"] = {
					"Also start with",
					"an {C:attention}eternal{} {C:minty_3s}Fossilized Claw{}",
				},
			},
			["sleeve_minty_3suitsleeve_fusionalt"] = {
				["name"] = "Sleeve of the 3",
				["text"] = {
					"Instead start with",
					"{C:minty_3s}Three{} {C:attention}eternal{} {C:minty_3s}Cats!{}",
				},
			},
		}
	},
}