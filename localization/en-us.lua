return {
	["misc"] = {
		["dictionary"] = {
			["k_drowned_ex"] = "Drowned!",
			["k_nommed_ex"] = "Nom!",
			["k_stopped_ex"] = "Stopped!",
			["k_storm_ex"] = "Storm!",
			["k_wiped_ex"] = "Wiped!",
			["k_forward_ex"] = "Forward!",
			["k_abandon_ex"] = "Voting to abandon...",
			["k_victory_ex"] = "Victory!",
			["k_cube"] = "Hand must contain exactly 4 cards",
			["k_psycube"] = "What have you done?!",
			["k_minty_challenge"] = "Challenge",
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
			["m_minty_marble"] = "Marble Card",
			["gemslot_catseye"] = "Cat's Eye",
			["k_minty_challenge"] = "Challenge",
		},
		["challenge_names"] = {
			["c_minty_raidnight"] = "Day One Raid Night",
			["c_minty_raidnightsavage"] = "Day One Raid Night (Savage)",
			["c_minty_backalley"] = "Back Alleys",
			["c_minty_evilbackalley"] = "Deadly Back Alleys",
		}
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
                    '{C:inactive,s:0.8}The suit, not the rank!',
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
			["bl_minty_thetree"] = {
				["name"] = "The Tree",
				["text"] = {
					"Hand must contain 3s",
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
		["Packet"] = {
			["c_minty_littletreat"] = {
				["name"] = "A Little Treat",
				["text"] = {
					"{C:money}#1#{}",
					"{C:green}X#2#{} random {C:minty_3s}3s{}",
					"{C:inactive,s:0.8}(the suit)",
				}
			},
			["c_minty_smoltreat"] = {
				["name"] = "Illegally Smol Treat",
				["text"] = {
					"{C:money}#1#{}",
					"A single 3 of {C:minty_3s}3s{}",
				}
			},
		},
		["Parcel"] = {
			["c_minty_treatandmystery"] = {
				["name"] = "Treat and Mystery",
				["text"] = {
					"{C:green}X#2#{} {C:minty_3s}3s{}",
					"and {C:green}a full set{} {C:inactive,s:0.8}(probably #2#){}",
					"of another suit",
				}
			},
			["c_minty_lessthanthree"] = {
				["name"] = "<3",
				["text"] = {
					"{C:green}X#2#{} {C:minty_3s}3s{}",
					"and {C:green}X#3#{} {C:hearts}Hearts{}",
				}
			},
			["c_minty_forbiddencandy"] = {
				["name"] = "Forbidden Candy",
				["text"] = {
					"{C:green}X#2#{} {C:minty_3s}3s{}",
					"and {C:green}X#3#{} {C:diamonds}Diamonds{}",
				}
			},
			["c_minty_exclusivetreats"] = {
				["name"] = "Exclusive Treats",
				["text"] = {
					"{C:green}X#2#{} {C:minty_3s}3s{}",
					"and {C:green}X#3#{} {C:clubs}Clubs{}",
				}
			},
			["c_minty_diggingfortreats"] = {
				["name"] = "Digging for Treats",
				["text"] = {
					"{C:green}X#2#{} {C:minty_3s}3s{}",
					"and {C:green}X#3#{} {C:spades}Spades{}",
				}
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
			["c_minty_catseye_flavor"] = {
				["name"] = "Cat's Eye",
				["text"]  = {
                    "Attach a {C:minty_3s}Cat's Eye",
                    "{}Gemstone to {C:green}#1#{} selected {C:attention}card{}",
                    "{C:inactive}(Must have a Gem Slot){}",
					" ",
					"{C:inactive,s:0.8}It can see you...r treats."
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
			["j_minty_cube_flavor"] = {
				["name"] = "Cube Joker",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult",
					"Played hand must contain",
					"exactly {C:attention}4{} cards",
					" ",
					"{C:inactive,s:0.8}YOU'RE a cube!",
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
			["j_minty_phasebus_flavor"] = {
				["name"] = "Phase Bus",
				["text"] = {
					"At end of round,",
					"create a {C:spectral}Spectral{} card",
					"if no {C:attention}face cards{}",
					"were scored that round.",
					"{C:inactive}(Must have room){}",
					" ",
					"{C:inactive}(Currently: #1#!){}",
					" ",
					"{C:inactive,s:0.8}No eating language eggs",
					"{C:inactive,s:0.8}allowed on the bus.",
				},
			},
			["j_minty_catpicmachine_modest"] = {
				["name"] = "ilo pi sitelen soweli",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult if a",
					"{C:attention}Cat Tag{} is held",
				},
			},
			["j_minty_catpicmachine_modest_flavor"] = {
				["name"] = "ilo pi sitelen soweli",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult if a",
					"{C:attention}Cat Tag{} is held",
					" ",
					"{C:inactive,s:0.8}The internet is for cats!",
				},
			},
			["j_minty_catpicmachine_mainline"] = {
				["name"] = "ilo pi sitelen soweli",
				["text"] = {
					"{X:mult,C:white}X#2#{} Mult for each",
					"{C:attention}Cat Tag{} held",
					"{C:inactive}(With levels considered)"
				},
			},
			["j_minty_catpicmachine_mainline_flavor"] = {
				["name"] = "ilo pi sitelen soweli",
				["text"] = {
					"{X:mult,C:white}X#2#{} Mult for each",
					"{C:attention}Cat Tag{} held",
					"{C:inactive}(With levels considered)",
					" ",
					"{C:inactive,s:0.8}The internet is for cats!",
				},
			},
			["j_minty_catpicmachine_madness"] = {
				["name"] = "ilo pi sitelen soweli",
				["text"] = {
					"{X:minty_3s,C:white}?#3#{} Mult for each",
					"{C:attention}Cat Tag{} held",
					"{C:inactive}(operator based on",
					"{C:inactive}Cat Tag's level)",
				},
			},
			["j_minty_catpicmachine_madness_flavor"] = {
				["name"] = "ilo pi sitelen soweli",
				["text"] = {
					"{X:minty_3s,C:white}?#3#{} Mult for each",
					"{C:attention}Cat Tag{} held",
					"{C:inactive}(operator based on",
					"{C:inactive}Cat Tag's level)",
					" ",
					"{C:inactive,s:0.8}The internet is for cats!",
				},
			},
			["j_minty_lucky"] = {
				["unlock"] = {
					"Find this Joker from",
					"the {C:spectral}Soul{} or {C:spectral}Wand{} cards",
				},
				["name"] = "Lucky",
				["text"] = {
					"Multiplies all {C:attention}listed",
					"{C:green,E:1,S:1.1}probabilities{} by {C:mult}33{}",
					"{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}33 in 3{C:inactive})",
				},
			},
			["j_minty_lucky_flavor"] = {
				["unlock"] = {
					"Find this Joker from",
					"the {C:spectral}Soul{} or {C:spectral}Wand{} cards",
				},
				["name"] = "Lucky",
				["text"] = {
					"Multiplies all {C:attention}listed",
					"{C:green,E:1,S:1.1}probabilities{} by {C:mult}33{}",
					"{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}33 in 3{C:inactive})",
					" ",
					"{C:inactive,s:0.8}Black cats are lucky",
					"{C:inactive,s:0.8}because you get to",
					"{C:inactive,s:0.8}pet a cat!",
				},
			},
			["j_minty_lune"] = {
				["unlock"] = {
					"Find this Joker from",
					"the {C:spectral}Soul{} or {C:spectral}Wand{} cards",
				},
				["name"] = "Lucky",
				["text"] = {
					"Divides all {C:attention}listed",
					"{C:green,E:1,S:1.1}probabilities{} by {C:mult}33{}",
					"{C:inactive}(ex: {C:green}33 in 100{C:inactive} -> {C:green}1 in 100{C:inactive})",
				},
			},
			["j_minty_lune_flavor"] = {
				["unlock"] = {
					"Find this Joker from",
					"the {C:spectral}Soul{} or {C:spectral}Wand{} cards",
				},
				["name"] = "Lune",
				["text"] = {
					"Divides all {C:attention}listed",
					"{C:green,E:1,S:1.1}probabilities{} by {C:mult}33{}",
					"{C:inactive}(ex: {C:green}33 in 100{C:inactive} -> {C:green}1 in 100{C:inactive})",
					" ",
					"{C:inactive,s:0.8}Till all complete.",
				},
			},
			["j_minty_stormy"] = {
				["unlock"] = {
					"Find this Joker from",
					"the {C:spectral}Soul{} or {C:spectral}Wand{} cards",
				},
				["name"] = "Stormy",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult, then retrigger",
					"once for each time a previous",
					"Joker triggered this hand"
				},
			},
			["j_minty_stormy_flavor"] = {
				["unlock"] = {
					"Find this Joker from",
					"the {C:spectral}Soul{} or {C:spectral}Wand{} cards",
				},
				["name"] = "Stormy",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult, then retrigger",
					"once for each time a previous",
					"Joker triggered this hand",
					" ",
					"{C:inactive,s:0.8}(It works.)",
				},
			},
			["j_minty_patchy"] = {
				["unlock"] = {
					"Find this Joker from",
					"the {C:spectral}Soul{} or {C:spectral}Wand{} cards",
				},
				["name"] = "Patchy",
				["text"] = {
					"Played {C:minty_3s}3s{} give",
					"{X:mult,C:white} X#1# {} Mult when scored",
					"and retrigger",
				},
			},
			["j_minty_patchy_flavor"] = {
				["unlock"] = {
					"Find this Joker from",
					"the {C:spectral}Soul{} or {C:spectral}Wand{} cards",
				},
				["name"] = "Patchy",
				["text"] = {
					"Played {C:minty_3s}3s{} give",
					"{X:mult,C:white} X#1# {} Mult when scored",
					"and retrigger",
					" ",
					"{C:inactive,s:0.8}BITING YOU BITING",
					"{C:inactive,s:0.8}YOU BITING YOU :3",
				},
			},
			["j_minty_minty"] = {
				["unlock"] = {
					"Find this Joker from",
					"the {C:spectral}Soul{} or {C:spectral}Wand{} cards",
				},
				["name"] = "Minty",
				["text"] = {
					"{X:dark_edition,C:white}^#1#{} Mult, {C:attention}#4#{} time#6#",
					"For every {C:attention}#3#{}{C:inactive}(#2#){} {C:minty_3s}3s{} scored,",
					"gain a repetition and",
					"increase target by #5#",
				},
			},
			["j_minty_minty_flavor"] = {
				["unlock"] = {
					"Find this Joker from",
					"the {C:spectral}Soul{} or {C:spectral}Wand{} cards",
				},
				["name"] = "Minty",
				["text"] = {
					"{X:dark_edition,C:white}^#1#{} Mult, {C:attention}#4#{} time#6#",
					"For every {C:attention}#3#{}{C:inactive}(#2#){} {C:minty_3s}3s{} scored,",
					"gain a repetition and",
					"increase target by #5#",
					" ",
					"{C:inactive,s:0.8}Of COURSE I'm in here, it's MY mod!{}"
				},
			},
			["j_minty_garfielf"] = {
				["unlock"] = {
					"Find this Joker from",
					"the {C:spectral}Soul{} or {C:spectral}Wand{} cards",
				},
				["name"] = "Garfielf",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult",
					"If a {C:minty_3s}3{} is scored,",
					"{C:attention}destroy{} unscored non-{C:minty_3s}3s{}",
					"and gain {X:mult,C:white}X#2#{} Mult each",
				},
			},
			["j_minty_garfielf_flavor"] = {
				["unlock"] = {
					"Find this Joker from",
					"the {C:spectral}Soul{} or {C:spectral}Wand{} cards",
				},
				["name"] = "Garfielf",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult",
					"If a {C:minty_3s}3{} is scored,",
					"{C:attention}destroy{} unscored non-{C:minty_3s}3s{}",
					"and gain {X:mult,C:white}X#2#{} Mult each",
					" ",
					"{C:inactive,s:0.8}\"Where are the #3# of #4#?\"",
					"{C:inactive,s:0.8}\"I ate those card.\"",
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
			["j_minty_claw_flavor"] = {
				["name"] = "Fossilized Claw",
				["text"] = {
					"{C:green}#1# in #2#{} chance for",
					"played {C:minty_3s}3s{} to give",
					"{X:mult,C:white} X#3# {} Mult when scored",
					" ",
					"{C:inactive,s:0.8}It seems to belong",
					"{C:inactive,s:0.8}to an ancient",
					"{C:inactive,s:0.8}prehistoric slow tiger.",
				},
			},
			["j_minty_chisel"] = {
				["name"] = "Chisel",
				["text"] = {
					"Scored {C:attention}#1#s{} lose",
					"their enhancement and",
					"gain a {C:cement}Cement Seal{}",
				},
			},
			["j_minty_chisel_flavor"] = {
				["name"] = "Chisel",
				["text"] = {
					"Scored {C:attention}#1#s{} lose",
					"their enhancement and",
					"gain a {C:cement}Cement Seal{}",
					" ",
					"{C:inactive,s:0.8}An artist knows they",
					"{C:inactive,s:0.8}have found perfection",
					"{C:inactive,s:0.8}when there is nothing",
					"{C:inactive,s:0.8}left to take away.",
				},
			},
			["j_minty_bucket"] = {
				["name"] = "Bucket of Cement",
				["text"] = {
					"All scored cards",
					"become {C:attention}#1#s{}"
				},
			},
			["j_minty_bucket_flavor"] = {
				["name"] = "Bucket of Cement",
				["text"] = {
					"All scored cards",
					"become {C:attention}#1#s{}",
					" ",
					"{C:inactive,s:0.8}Happy 6th birthday!",
				},
			},
			["j_minty_threecats"] = {
				["name"] = "Three Cats!",
				["text"] = {
					"Played {C:minty_3s}3s{} give {C:green}#1#{} of",
					"{C:chips}+#2#{} chips, {C:mult}+#3#{} Mult, and",
					"{X:mult,C:white}X#4#{} Mult when scored.",
				},
			},
			["j_minty_threecats_flavor"] = {
				["name"] = "Three Cats!",
				["text"] = {
					"Played {C:minty_3s}3s{} give {C:green}#1#{} of",
					"{C:chips}+#2#{} chips, {C:mult}+#3#{} Mult, and",
					"{X:mult,C:white}X#4#{} Mult when scored.",
					" ",
					"{C:mult,s:0.8}       Meow!      ",
					"{C:chips,s:0.8}Meow!             ",
					"            {X:mult,C:white,s:0.8}Meow!",
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
			["j_minty_slowtiger_flavor"] = {
				["name"] = "Slow Tiger",
				["text"] = {
					"{C:mult}+#2#{} Mult",
					"per round",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult){}",
					" ",
					"{C:inactive,s:0.8}Turn it into a fast",
					"{C:inactive,s:0.8}tiger with this one trick!",
				},
			},
			["j_minty_theecho"] = {
				["name"] = "The Echo",
				["text"] = {
					"Prevents Death.",
					"If triggered against {C:attention}second{} Boss Blind,",
					"{C:attention}-1 Ante{} and {C:attention}-1 charge{} {C:inactive}(#1# left){}.",
					"{C:red}Self-destructs{} when no charges remaining.",
					"{C:inactive,s:0.8}(Or when challenge defeated){}",
				},
			},
			["j_minty_theecho_flavor"] = {
				["name"] = "The Echo",
				["text"] = {
					"Prevents Death.",
					"If triggered against {C:attention}second{} Boss Blind,",
					"{C:attention}-1 Ante{} and {C:attention}-1 charge{} {C:inactive}(#1# left){}.",
					"{C:red}Self-destructs{} when no charges remaining.",
					"{C:inactive,s:0.8}(Or when challenge defeated){}",
					" ",
					"{C:inactive,s:0.8}Burning for battle...{}",
					"{C:inactive,s:0.8}as long as the static's patience holds.{}",
				},
			},
			["j_minty_froyo"] = {
				["name"] = "Frozen Yogurt",
				["text"] = {
					"{C:chips}+#1#{} Chips, {C:chips}-#2#{} Chips",
					"for every hand played",
				},
			},
			["j_minty_froyo_flavor"] = {
				["name"] = "Frozen Yogurt",
				["text"] = {
					"{C:chips}+#1#{} Chips, {C:chips}-#2#{} Chips",
					"for every hand played",
					" ",
					"{C:inactive,s:0.8}(But it's so much cheaper!)",
				},
			},
			["j_minty_hedonist"] = {
				["name"] = "Hedonist Joker",
				["text"] = {
					"Played {C:minty_3s}3s{} give",
					"{C:mult}+#1#{} Mult when scored",
				},
			},
			["j_minty_hedonist_flavor"] = {
				["name"] = "Hedonist Joker",
				["text"] = {
					"Played {C:minty_3s}3s{} give",
					"{C:mult}+#1#{} Mult when scored",
					" ",
					"{C:inactive,s:0.8}I'm a hedonist.",
					"{C:inactive,s:0.8}Of course I have",
					"{C:inactive,s:0.8}flavor text. Mmm...",
				},
			},
			["j_minty_proso"] = {
				["name"] = "Prosopagnosia",
				["text"] = {
					"{X:mult,C:white} X#1# {} Mult if hand",
					"contains {C:attention}face{} cards,",
					"but {C:attention}no{} cards are",
					"considered face cards.",
				},
			},
			["j_minty_proso_flavor"] = {
				["name"] = "Prosopagnosia",
				["text"] = {
					"{X:mult,C:white} X#1# {} Mult if hand",
					"contains {C:attention}face{} cards,",
					"but {C:attention}no{} cards are",
					"considered face cards.",
					" ",
					"{C:inactive,s:0.8}You don't know what it's",
					"{C:inactive,s:0.8}like to spend every day",
					"{C:inactive,s:0.8}surrounded by monkeys.",
				},
			},
			["j_minty_ascetic"] = {
				["name"] = "Ascetic Joker",
				["text"] = {
					'Played {C:minty_3s}3s{} give',
					'{C:chips}+#1#{} Chips when scored',
				},
			},
			["j_minty_ascetic_flavor"] = {
				["name"] = "Ascetic Joker",
				["text"] = {
					"Played {C:minty_3s}3s{} give",
					"{C:chips}+#1#{} Chips when scored",
					" ",
					"{C:inactive,s:0.8}Flavor text?",
					"{C:inactive,s:0.8}A needless indulgence!",
				},
			},
			["j_minty_sabertooth"] = {
				["name"] = "Saber Tooth",
				["text"] = {
					'Held {C:minty_3s}#3#{} have',
					'a {C:green}#1# in #2#{} chance',
					'to not give {X:mult,C:white}X#4#{} Mult',
				},
			},
			["j_minty_sabertooth_flavor"] = {
				["name"] = "Saber Tooth",
				["text"] = {
					'Held {C:minty_3s}#3#{} have',
					'a {C:green}#1# in #2#{} chance',
					'to not give {X:mult,C:white}X#4#{} Mult',
					' ',
					'{C:inactive,s:0.8}Sharp enough to call it vorpal',
				},
			},
			["j_minty_ninethlion"] = {
				["name"] = "Nineth Lion",
				["text"] = {
					'TBA',
				},
			},
			["j_minty_ninethlion_flavor"] = {
				["name"] = "Nineth Lion",
				["text"] = {
					'TBA',
					' ',
					'{C:inactive,s:0.8}Yum delicis sun >:3',
					'{C:inactive,s:0.8}In definitely related news:',
					'{C:inactive,s:0.8}you\'re a mortal!'
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
			["j_minty_eaten_flavor"] = {
				["name"] = "Eaten Joker",
				["text"] = {
					"Played cards with rank {C:attention}7{}",
					"give {C:chips}+#2#{} Chips and {C:mult}+#1#{} Mult",
					"when scored. Destroy {C:green}#4# in #3#{}",
					"scored cards of other ranks.",
					" ",
					"{C:inactive,s:0.8}All shall be well and all shall be well",
					"{C:inactive,s:0.8}and all manner of thing shall be well.",
					"{C:inactive,s:0.8}That was the promise."
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
			["j_minty_excited_flavor"] = {
				["name"] = "Overly Excited",
				["text"] = {
					"{C:chips}+#1#{} Chips, {C:mult}+#3#{} Mult",
					"Gain {C:chips}#2#{} Chips when",
					"anything happens, or",
					"{C:green}#6# in #5#{} chance to",
					"gain {C:mult}#4#{} Mult instead",
					" ",
					"{C:inactive,s:0.8}Holy shit, it's a Joker!",
				},
			},
			["j_minty_gymbuddy"] = {
				["name"] = "Gym Buddies",
				["text"] = {
					"Scored {C:attention}enhanced{} cards grant",
					"{C:attention}permanent{} boosts to other",
					"scored cards without the",
					"same enhancement",
				},
			},
			["j_minty_gymbuddy_flavor"] = {
				["name"] = "Gym Buddies",
				["text"] = {
					"Scored {C:attention}enhanced{} cards grant",
					"{C:attention}permanent{} boosts to other",
					"scored cards without the",
					"same enhancement",
					" ",
					"{C:inactive,s:0.8}Feel the burn!{}"
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
			["j_minty_churutreat_flavor"] = {
				["name"] = "Churu Treat",
				["text"] = {
					"Scored {C:minty_3s}3s{} give {C:mult}+#1#{} Mult",
					"{C:green}#2# in #3#{} chance this card is",
					"eaten at end of round",
					" ",
					"{C:inactive,s:0.8}Kity go nomnomnomnom :3",
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
			["j_minty_plastic_stick_flavor"] = {
				["name"] = "Plastic \"Stick\"",
				["text"] = {
					"Gives {X:mult,C:white}X#1#{} Mult for every",
					"other {C:attention}\"Stick\"{} Joker you have...",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
					" ",
					"{C:inactive,s:0.8}nooooo my treat is all gone",
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
			["j_minty_treatovision_flavor"] = {
				["name"] = "Treat-o-vision",
				["text"] = {
					"{V:1}#1#{} and {C:minty_3s}#2#{} suits",
					"count as the same suit",
					"{C:inactive}(First suit changes each round){}",
					" ",
					"{C:inactive,s:0.8}Hey would you mind slathering yourself",
					"{C:inactive,s:0.8}in BBQ sauce real quick? No reason.",
				},
			},
			["j_minty_wildsupport"] = {
				["name"] = "Wild Support",
				["text"] = {
					"Played {C:attention}Wild Cards{} give {C:green}#1#{} of",
					"up to {C:mult}#2#{} Mult (+{C:mult}#7#{}),",
					"up to {X:mult,C:white}X#3#{} Mult (+{X:mult,C:white}X#8#{}),",
					"up to {C:chips}#4#{} Chips (+{C:chips}#9#{}),",
					"or up to {C:money}$#5#{} (+{C:money}$#10#{}),",
					"and {C:green}#1# in #6#{} chance to",
					"increase maximum value."
				},
			},
			["j_minty_wildsupport_flavor"] = {
				["name"] = "Wild Support",
				["text"] = {
					"Played {C:attention}Wild Cards{} give {C:green}#1#{} of",
					"up to {C:mult}#2#{} Mult (+{C:mult}#7#{}),",
					"up to {X:mult,C:white}X#3#{} Mult (+{X:mult,C:white}X#8#{}),",
					"up to {C:chips}#4#{} Chips (+{C:chips}#9#{}),",
					"or up to {C:money}$#5#{} (+{C:money}$#10#{}),",
					"and {C:green}#1# in #6#{} chance to",
					"increase maximum value.",
					" ",
					"{C:inactive,s:0.8}This is definitely fine.",
				},
			},
			["j_minty_scoundrel"] = {
				["name"] = "The Scoundrel",
				["text"] = {
					"Whenever a {C:attention}#1#{}",
					"hits, retrigger it {C:attention}#2#{} time#3#",
					"and gain {C:attention}1{} retrigger",
					"{C:inactive}(Maximum of 7)",
				},
			},
			["j_minty_scoundrel_flavor"] = {
				["name"] = "The Scoundrel",
				["text"] = {
					"Whenever a {C:attention}#1#{}",
					"hits, retrigger it {C:attention}#2#{} time#3#",
					"and gain {C:attention}1{} retrigger",
					"{C:inactive}(Maximum of 7)",
					" ",
					"{C:inactive,s:0.8}*bites you cutely* ;3"
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
			["j_minty_catnipfields_flavor"] = {
				["name"] = "Catnip Fields",
				["text"] = {
					"{C:minty_3s}3s{} give {X:mult,C:white}X#1#{} Mult when scored.",
					"Increases by {X:mult,C:white}X#2#{} Mult for each ",
					"consecutively scored {C:minty_3s}3{}",
					"{C:inactive}(Resets after each hand played)",
					" ",
					"{C:inactive,s:0.8}Cats come from across the land to frolic here.",
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
			["c_minty_cat_flavor"] = {
				["name"] = "The Cat",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected cards",
					"to {C:minty_3s}3s{}",
					" ",
					"{C:inactive,s:0.8}Meow! :3",
				},
			},
			["c_minty_boredkid"] = {
				["name"] = "The Bored Child",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected card#2#",
					"to #3#{C:attention}Marble Card#2#{}",
				},
			},
			["c_minty_boredkid_flavor"] = {
				["name"] = "The Bored Child",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected card#2#",
					"to #3#{C:attention}Marble Card#2#{}",
					" ",
					"{C:inactive,s:0.8}Well, what if I threw rocks at you?",
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
			["c_minty_6years_flavor"] = {
				["name"] = "6 years",
				["text"] = {
					"Add a {C:cement}Cement Seal{}",
					"to {C:attention}1{} selected",
					"card in your hand",
					" ",
					"{C:inactive,s:0.8}... in the joint made you",
					"{C:inactive,s:0.8}a - no? Wrong meme?",
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
			["c_minty_wand_flavor"] = {
				["name"] = "The Wand",
				["text"] = {
					"Summon a {C:legendary,E:1}Legendary",
					"{C:legendary,E:1}Kity{} Joker",
					"{C:inactive}(Must have room)",
					" ",
					"{C:inactive,s:0.8}RUN POUNCE CHASE HUNT"
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
		},
		["Enhanced"] = {
			["m_stone"] = {
				["name"] = "Slate Card"
			},
			["m_minty_marble"] = {
				["name"] = "Marble Card",
				["label"] = "Marble Card",
				["text"] = {
					"No rank, can be",
					"used as any suit",
					"{C:money}$#1#{}, {C:chips}+#2#{} Chips, and",
					"{C:mult}+#3#{} Mult when scored"
				}
			},
		},
	},
}