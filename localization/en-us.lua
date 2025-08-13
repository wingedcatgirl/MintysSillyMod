return {
	["misc"] = {
		["dictionary"] = {
			["k_minty_drowned"] = "Drowned!",
			["k_minty_nommed"] = "Nom!",
			["k_minty_stopped"] = "Stopped!",
			["k_minty_storm"] = "Storm!",
			["k_minty_wiped"] = "Wiped!",
			["k_minty_forward"] = "Forward!",
			["k_minty_abandon"] = "Voting to abandon...",
			["k_minty_victory"] = "Victory!",
			["k_minty_inactive"] = "Inactive!",
			["k_minty_active"] = "Active!",
			["k_minty_sliced"] = "Sliced!",
			["k_minty_bang"] = "Bang!",
			["k_minty_bye"] = "Bye-bye!",
			["k_minty_rescheduled"] = "Rescheduled!",
			["k_minty_ordered"] = "Ordered!",
			["k_minty_cube"] = "Hand must contain exactly 4 cards",
			["k_minty_psycube"] = "What have you done?!",
			["k_minty_challenge"] = "Challenge",
		},
		["v_dictionary"] = {
			["a_minty_chipgain"] = "+#1# Chips",
			["a_minty_multandchips"] = "+#1# Mult, +#2# Chips",
			["a_minty_chipsandmult"] = "+#1# Chips, +#2# Mult",
		},
		["suits_plural"] = {
			["minty_3s"] = "3s",
		},
		["suits_singular"] = {
			["minty_3s"] = "3",
		},
		["ranks"] = {
			["minty_face"] = "Face",
		},
		["labels"] = {
			["minty_cement_seal"] = "Cement Seal",
			["m_minty_marble"] = "Marble Card",
			["m_minty_garbled"] = "Garbled Card",
			["gemslot_catseye"] = "Cat's Eye",
			["k_minty_challenge"] = "Challenge",
		},
		["challenge_names"] = {
			["c_minty_raidnight"] = "Day One Raid Night",
			["c_minty_raidnightsavage"] = "Day One Raid Night (Savage)",
			["c_minty_backalley"] = "Back Alleys",
			["c_minty_evilbackalley"] = "Deadly Back Alleys",
			["c_minty_cosmoport"] = "My Own Cosmoport",
		}
	},
	["descriptions"] = {
		--[[ For now, this is only for translations; leave it commented in US English. and/or if it's not done yet
		["Mod"] = {
			["MintysSillyMod"] = {
				["name"] = "Minty's Silly Little Mod",
				["text"] = {
					"cat mod for cats",
					"... I mean this mod contains Minty's silly little content ideas."
				},
			},
		},
		--]]
		["Joker"] = {
			["j_minty_cube"] = {
				["unlock"] = {
					"Win a run playing more hands",
					"requiring {C:attention}4{} cards than",
					"hands {C:attention}impossible{} with 4 cards",
				},
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
			["j_minty_doctor"] = {
				["name"] = "Doctor",
				["text"] = {
					"After {C:green}#1#{} hand#3#, {C:attention}permanently{}",
					"gain {B:1,C:white}#2#{} Mult",
					"{C:green}Unknown chance{} to {C:attention}reschedule{}",
					"at end of round"
				},
			},
			["j_minty_doctor_flavor"] = {
				["name"] = "Doctor",
				["text"] = {
					"After {C:green}#1#{} hand#3#, {C:attention}permanently{}",
					"gain {B:1,C:white}#2#{} Mult",
					"{C:green}Unknown chance{} to {C:attention}reschedule{}",
					"at end of round",
					" ",
					"{C:inactive,s:0.8}\"Vent art\"? No, this is a doctor.",
					"{C:inactive,s:0.8}They've got the classic head mirror, see?"
				},
			},
			["j_minty_doctor_active"] = {
				["name"] = "Doctor",
				["text"] = {
					"{B:1,C:white}#2#{} Mult",
				},
			},
			["j_minty_doctor_active_flavor"] = {
				["name"] = "Doctor",
				["text"] = {
					"{B:1,C:white}#2#{} Mult",
					"{C:inactive,s:0.8}Seriously? Lucky bastard."
				},
			},
			["j_minty_jacobsladder"] = {
				["unlock"] = {
					"Play a hand containing",
					"{C:attention}5{} or more suits"
				},
				["name"] = "Jacob's Ladder",
				["text"] = {
					"If scored hand contains {C:attention}#1#{}",
					"or more suits, {C:legendary}balance{}",
					"{C:chips}Chips{} and {C:mult}Mult{}",
				},
			},
			["j_minty_jacobsladder_flavor"] = {
				["name"] = "Jacob's Ladder",
				["text"] = {
					"If scored hand contains {C:attention}#1#{}",
					"or more suits, {C:legendary}balance{}",
					"{C:chips}Chips{} and {C:mult}Mult{}",
					" ",
					"{C:inactive,s:0.8}What do you mean, 'why'?",
					"{C:inactive,s:0.8}For SCIENCE, obviously!",
				},
			},
			["j_minty_cakesword"] = {
				["name"] = "Cake Sword",
				["text"] = {
					"Blind size reduced by {C:mult}#1#%{}",
					"when entering; loses {C:mult}#2#%{} per hit",
				},
			},
			["j_minty_cakesword_flavor"] = {
				["name"] = "Cake Sword",
				["text"] = {
					"Blind size reduced by {C:mult}#1#%{}",
					"when entering; loses {C:mult}#2#%{} per hit",
					" ",
					"{C:inactive,s:0.8}You should see the cake gun.{}"
				},
			},
			["j_minty_cakegun"] = {
				["name"] = "Cake Gun",
				["text"] = {
					"Blind size reduced by {C:mult}#1#%{}",
					"when entering; {C:mult}#2#{} shot#3# remain#4#",
				},
			},
			["j_minty_cakegun_flavor"] = {
				["name"] = "Cake Gun",
				["text"] = {
					"Blind size reduced by {C:mult}#1#%{}",
					"when entering; {C:mult}#2#{} shot#3# remain#4#",
					" ",
					"{C:inactive,s:0.8}Oh, there it is.{}"
				},
			},
			["j_minty_finity_calico"] = {
				["name"] = "Calico on the Counter",
				["text"] = {
					"{C:attention}#1# in #2#{} cards {C:mult}flipped{} on draw,",
					"{C:attention}#1# in #2#{} cards {C:mult}debuffed{} on draw.",
					"{C:mult}Flipped{} or {C:mult}debuffed{} cards {C:attention}always score{}",
					"{C:mult}Flipped{} cards give {C:mult}+#3#{} Mult",
					"{C:mult}Debuffed{} cards give {X:mult,C:white}X#4#{} Mult",
				},
			},
			["j_minty_finity_calico_flavor"] = {
				["name"] = "Calico on the Counter",
				["text"] = {
					"{C:attention}#1# in #2#{} cards {C:mult}flipped{} on draw,",
					"{C:attention}#1# in #2#{} cards {C:mult}debuffed{} on draw.",
					"{C:mult}Flipped{} or {C:mult}debuffed{} cards {C:attention}always score{}",
					"{C:mult}Flipped{} cards give {C:mult}+#3#{} Mult",
					"{C:mult}Debuffed{} cards give {X:mult,C:white}X#4#{} Mult",
					" ",
					"{C:inactive,s:0.8}Yeah, I made a mess, but{}",
					"{C:inactive,s:0.8}you like it better that way.{}",
				},
			},
			["j_minty_catcafe"] = {
				["name"] = "Cat Cafe",
				["text"] = {
					"{C:spectral}Kity{} Jokers give",
					"{C:chips}+#1#{} Chips",
				},
			},
			["j_minty_catcafe_flavor"] = {
				["name"] = "Cat Cafe",
				["text"] = {
					"{C:spectral}Kity{} Jokers give",
					"{C:chips}+#1#{} Chips",
					" ",
					"{C:inactive,s:0.8}The staff are cats.",
					"{C:inactive,s:0.8}The patrons... are also cats."
				},
			},
			["j_minty_peywet"] = {
				["name"] = "Smack Barm Pey Wet",
				["text"] = {
					"In {C:attention}Wigan{} it's",
					"{C:green}good as gravy{}"
				},
			},
			["j_minty_copycat"] = {
				["name"] = "Copy Cat",
				["text"] = {
					"Copies the effect of a {C:attention}random{} other Joker",
					"{C:inactive}(Changes target at end of shop){}",
					"{C:inactive}(Currently {C:attention}#1#{C:inactive}){}",
				},
			},
			["j_minty_copycat_flavor"] = {
				["name"] = "Copy Cat",
				["text"] = {
					"Copies the effect of a {C:attention}random{} other Joker",
					"{C:inactive}(Changes target at end of shop){}",
					"{C:inactive}(Currently {C:attention}#1#{C:inactive}){}",
					" ",
					"{C:inactive,s:0.8}*perfectly echoed meow noises*",
				},
			},
			["j_minty_hyperfix"] = {
				["name"] = "Angel of Hyperfixation",
				["text"] = {
					"{X:dark_edition,C:white}^#1#{} Mult for every blind",
					"cleared or skipped before",
					"buying your first Joker",
					"{C:inactive}(Currently {X:dark_edition,C:white}^#2#{C:inactive})",
				},
			},
			["j_minty_hyperfix_flavor"] = {
				["name"] = "Angel of Hyperfixation",
				["text"] = {
					"{X:dark_edition,C:white}^#1#{} Mult for every blind",
					"cleared or skipped before",
					"buying your first Joker",
					"{C:inactive}(Currently {X:dark_edition,C:white}^#2#{C:inactive})",
					" ",
					"{C:inactive,s:0.8}Sure, I'll get it done eventually,",
					"{C:inactive,s:0.8}But it's always at the last minute...",
				},
			},
			["j_minty_languageEgg"] = {
				["unlock"] = {
					"Win a run in a language",
					"other than {C:attention}English{}"
				},
				["name"] = "Language Egg",
				["text"] = {
					"{C:mult}+#1#{} Mult for each round",
					"completed with a unique",
					"{C:attention}language{} setting this game",
					"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult){}"
				},
			},
			["j_minty_languageEgg_flavor"] = {
				["name"] = "Language Egg",
				["text"] = {
					"{C:mult}+#1#{} Mult for each round",
					"completed with a unique",
					"{C:attention}language{} setting this game",
					"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult){}",
					" ",
					"{C:inactive,s:0.8}Best enjoyed in the atheism corner"
				},
			},
			["j_minty_neko"] = {
				["name"] = "neko.exe",
				["text"] = {
					"{C:chips}+#1#{} Chips",
					"{C:attention}Chases{} your mouse around!"
				},
			},
			["j_minty_neko_flavor"] = {
				["name"] = "neko.exe",
				["text"] = {
					"{C:chips}+#1#{} Chips",
					"{C:attention}Chases{} your mouse around!",
					" ",
					"{C:inactive,s:0.8}Adorable since 1989"
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
					"{C:green,E:1,S:1.1}probabilities{} by {C:mult}#1#{}",
					"{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}#1# in 3{C:inactive})",
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
					"{C:green,E:1,S:1.1}probabilities{} by {C:mult}#1#{}",
					"{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}#1# in 3{C:inactive})",
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
					"{C:green,E:1,S:1.1}probabilities{} by {C:mult}#1#{}",
					"{C:inactive}(ex: {C:green}#1# in 100{C:inactive} -> {C:green}1 in 100{C:inactive})",
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
					"{C:green,E:1,S:1.1}probabilities{} by {C:mult}#1#{}",
					"{C:inactive}(ex: {C:green}#1# in 100{C:inactive} -> {C:green}1 in 100{C:inactive})",
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
					"{C:inactive,s:0.8}\"Where are the #3#s of #4#?\"",
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
			["j_minty_fatcat-l"] = {
				["name"] = "Fat Cat",
				["text"] = {
					"When blind is selected,",
					"if any Food Jokers are held",
					"eat a random one and gain",
					"{X:mult,C:white}X#2#{} Mult {C:inactive}(currently {X:mult,C:white}X#1#{}){}",
				},
			},
			["j_minty_fatcat-l_flavor"] = {
				["name"] = "Fat Cat",
				["text"] = {
					"When blind is selected,",
					"if any Food Jokers are held",
					"eat a random one and gain",
					"{X:mult,C:white}X#2#{} Mult {C:inactive}(currently {X:mult,C:white}X#1#{}){}",
					" ",
					"{C:inactive,s:0.8}leave Tubbs olone dot tumblr dot com{}",
				},
			},
			["j_minty_fatcat-m"] = {
				["name"] = "Fat Cat",
				["text"] = {
					"When blind is selected,",
					"spend {C:money}$#1#{} (if possible) to",
					"create a random Joker with",
					"{C:dark_edition}Negative{}, {C:rental}Rental{}, and {C:perishable}Perishable{}"
				},
			},
			["j_minty_fatcat-m_flavor"] = {
				["name"] = "Fat Cat",
				["text"] = {
					"When blind is selected,",
					"spend {C:money}$#1#{} (if possible) to",
					"create a random Joker with",
					"{C:dark_edition}Negative{}, {C:rental}Rental{}, and {C:perishable}Perishable{}",
					" ",
					"{C:inactive,s:0.8}Diversity win: local capitalist",
					"{C:inactive,s:0.8}pigdog is, in fact, a catgirl!",
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
					"Scored unenhanced cards",
					"become random {C:attention}#1#s{}"
				},
			},
			["j_minty_bucket_flavor"] = {
				["name"] = "Bucket of Cement",
				["text"] = {
					"Scored unenhanced cards",
					"become random {C:attention}#1#s{}",
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
			["j_minty_parkour"] = {
				["name"] = "Parkour",
				["text"] = {
					"Applies {C:attention}Shortcut{}",
					"{C:chips}+#1#{} Chips, gains {C:chips}+#3#{} for every",
					"{C:attention}consecutive{} hand containing a {C:attention}Straight{}",
					"{C:inactive}(Currently {C:chips}+#2#{C:inactive}){}"
				},
			},
			["j_minty_parkour_flavor"] = {
				["name"] = "Parkour",
				["text"] = {
					"Applies {C:attention}Shortcut{}",
					"{C:chips}+#1#{} Chips, gains {C:chips}+#3#{} for every",
					"{C:attention}consecutive{} hand containing a {C:attention}Straight{}",
					"{C:inactive}(Currently {C:chips}+#2#{C:inactive}){}",
					" ",
					"{C:inactive,s:0.8}Their friends call them Peter.{}",
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
			["j_minty_chocobar"] = {
				["name"] = "Choccy Bar",
				["text"] = {
					"{C:mult}+#1#{} Mult when card is",
					"scored, loses {C:mult}-#2#{} each trigger"
				},
			},
			["j_minty_chocobar_flavor"] = {
				["name"] = "Choccy Bar",
				["text"] = {
					"{C:mult}+#1#{} Mult when card is",
					"scored, loses {C:mult}-#2#{} each trigger",
					" ",
					"{C:inactive,s:0.8}Because your epic!"
				},
			},
			["j_minty_chocobar_flavor2"] = {
				["name"] = "Choccy Bar",
				["text"] = {
					"{C:mult}+#1#{} Mult when card is",
					"scored, loses {C:mult}-#2#{} each trigger",
					" ",
					"{C:inactive,s:0.8}Because your epic!",
					"{C:inactive,s:0.8}MISSPELLING IS PART OF THE REFRANCE",
					"{C:inactive,s:0.8}PLS DON'T FILE A TYPO REPORT KTHX",
				},
			},
			["j_minty_wrapper"] = {
				["name"] = "Crumpled Wrapper",
				["text"] = {
					"{C:inactive}...{}"
				},
			},
			["j_minty_wrapper_flavor"] = {
				["name"] = "Crumpled Wrapper",
				["text"] = {
					"{C:inactive}...{}",
					" ",
					"{C:inactive,s:0.8}(... why are you still carrying this?)"
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
					'{C:inactive,s:0.8}you\'re mortal!'
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
			["j_minty_atheismcorner"] = {
				["name"] = "Atheism Corner",
				["text"] = {
					"{C:chips}+#1#{} Chips, gains {C:chips}+#2#{} ",
					"each round, resets if a",
					"{C:spectral}Spectral{} card is used",
				},
			},
			["j_minty_atheismcorner_flavor"] = {
				["name"] = "Atheism Corner",
				["text"] = {
					"{C:chips}+#1#{} Chips, gains {C:chips}+#2#{} ",
					"each round, resets if a",
					"{C:spectral}Spectral{} card is used",
					" ",
					"{C:inactive,s:0.8}And think about what you've done!"
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
			["b_minty_sillylittledeck"] = {
				["name"] = "The Silliest, Littlest Deck",
				["text"] = {
					"{C:legendary}Minty's Mod{C:attention} Jokers{} are {C:attention}3x",
					"more likely to appear,",
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
			["bl_minty_thenipdx"] = {
				["name"] = "The Nip DX",
				["text"] = {
					"All non-3 cards",
					"are debuffed",
				},
			},
			["bl_minty_thetree"] = {
				["name"] = "The Tree",
				["text"] = {
					"Hand must contain 3s",
				},
			},
			["bl_minty_calico_counter"] = {
				["name"] = "Calico on the Counter",
				["text"] = {
					"#1# in #2# cards are drawn face-down,",
					"#1# in #2# cards are debuffed when drawn",
				},
			},
			["bl_minty_claw"] = {
				["name"] = "A Claw",
				["text"] = {
					"Debuff first#1#",
					"card#2# drawn",
				},
			},
			["bl_minty_tooth"] = {
				["name"] = "A Tooth",
				["text"] = {
					"Flip first#1#",
					"card#2# drawn",
				},
			},
			["bl_minty_paw"] = {
				["name"] = "A Paw",
				["text"] = {
					"Play limit =#1#",
					"for first hand",
					"unless an item",
					"is sold"
				},
			},
			["bl_minty_tail"] = {
				["name"] = "A Tail",
				["text"] = {
					"Discard limit =#1#",
					"for first discard"
				},
			},
		},
		["Tarot"] = {
			["c_minty_cat"] = {
				["name"] = "The Cat",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected card#2#",
					"to #3#{C:minty_3s}#4#{}",
				},
			},
			["c_minty_cat_flavor"] = {
				["name"] = "The Cat",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected card#2#",
					"to #3#{C:minty_3s}#4#{}",
					" ",
					"{C:inactive,s:0.8}Meow! :3",
				},
			},
			["c_minty_grin"] = {
				["name"] = "The Grin",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected card#2#",
					"to random {C:attention}face card#3#{}",
				},
			},
			["c_minty_grin_flavor"] = {
				["name"] = "The Grin",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected card#2#",
					"to random {C:attention}face card#3#{}",
					" ",
					"{C:inactive,s:0.8}You smirk. Critical hit rate up!",
					"{C:inactive,s:0.8}... which does nothing in this game!"
				},
			},
			["c_minty_abacus"] = {
				["name"] = "The Abacus",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected card#2#",
					"to random {C:attention}number card#3#{}",
				},
			},
			["c_minty_abacus_flavor"] = {
				["name"] = "The Abacus",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected card#2#",
					"to random {C:attention}number card#3#{}",
					" ",
					"{C:inactive,s:0.8}32.33 (repeating, of course)!"
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
			["c_minty_dorf"] = {
				["name"] = "The Dwarf",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected card#2#",
					"to #3#{C:attention}Microcline Card#2#{}",
				},
			},
			["c_minty_dorf_flavor"] = {
				["name"] = "The Dwarf",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected card#2#",
					"to #3#{C:attention}Microcline Card#2#{}",
					" ",
					"{C:inactive,s:0.8}Strike the earth!",
				},
			},
			["c_minty_gleam"] = {
				["name"] = "The Gleam",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected card#2#",
					"to #3#{C:attention}Crystal Card#2#{}",
				},
			},
			["c_minty_gleam_flavor"] = {
				["name"] = "The Gleam",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected card#2#",
					"to #3#{C:attention}Crystal Card#2#{}",
					" ",
					"{C:inactive,s:0.8}But consider: SHINY",
				},
			},
			["c_minty_geologist"] = {
				["name"] = "The Geologist",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected card#2#",
					"to #3#random {C:attention}#4##2#{}",
				},
			},
			["c_minty_geologist_flavor"] = {
				["name"] = "The Geologist",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected card#2#",
					"to #3#random {C:attention}#4##2#{}",
					" ",
					"{C:inactive,s:0.8}Please look at these cool rocks{}"
				},
			},
			["c_minty_bitz"] = {
				["name"] = "The Bitz",
				["text"] = {
					"Summon a {C:legendary}normal{}",
					"{C:chips,E:1}Kity{} Joker",
					"{C:inactive}(Must have room){}",
				},
			},
			["c_minty_bitz_flavor"] = {
				["name"] = "The Bitz",
				["text"] = {
					"Summon a {C:legendary}normal{}",
					"{C:chips,E:1}Kity{} Joker",
					"{C:inactive}(Must have room){}",
					" ",
					'{C:inactive,s:0.8}"... now with a dash of bonito flakes{}',
					'{C:inactive,s:0.8}to fuel your cats\' active lifestyles!{}',
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
			["c_minty_dekaja"] = {
				["name"] = "Dekaja",
				["text"] = {
					"Remove all {C:attention}modifiers{}",
					"from #2#{C:attention}#1#{} selected",
					"card#3# or Joker#3#",
				},
			},
			["c_minty_dekaja_flavor"] = {
				["name"] = "Dekaja",
				["text"] = {
					"Remove all {C:attention}modifiers{}",
					"from #2#{C:attention}#1#{} selected",
					"card#3# or Joker#3#",
					" ",
					"{C:inactive,s:0.8}Act now and we'll throw in",
					"{C:inactive,s:0.8}a bonus Dekunda for free!",
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
			["sleeve_minty_sillylittlesleeve"] = {
				["name"] = "The Silliest, Littlest Sleeve",
				["text"] = {
					"{C:legendary}Minty's Mod{C:attention} Jokers{} are {C:attention}3x",
					"more likely to appear,",
				},
			},
			["sleeve_minty_sillylittlesleeve_alt"] = {
				["name"] = "The Silliest, Littlest Sleeve",
				["text"] = {
					"Other {C:legendary}Minty's Mod{} items are {C:attention}2x",
					"more likely to appear,",
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
			["m_minty_garbled"] = {
				["name"] = "Garbled Card",
				["label"] = "Garbled Card",
				["text"] = {
					"{C:mult}+???{} Mult"
				}
			},
			["m_minty_microcline"] = {
				["name"] = "Microcline Card",
				["label"] = "Microcline Card",
				["text"] = {
					"No rank, no suit",
					"{C:chips}+#1#{} Chips when held"
				}
			},
			["m_minty_spline"] = {
				["name"] = "Spline Card",
				["label"] = "Spline Card",
				["text"] = {
					"{C:green}#1# in #2#{} chance",
					"to gain {C:chips}+#3#{} permanent",
					"Chips when scored",
				}
			},
			["m_minty_crystal"] = {
				["name"] = "Crystal Card",
				["label"] = "Crystal Card",
				["text"] = {
					"No rank, no suit",
					"{C:money}$#2#{} and {C:chips}+#1#{} Chips",
					"when scored, and {C:green}#3# in #4#{}",
					"chance to {C:attention}shatter{}"
				}
			},
			["m_minty_pistol"] = {
				["name"] = "Pistol Card",
				["label"] = "Pistol Card",
				["text"] = {
					"{X:mult,C:white} X#1# {} Mult, {C:green}#2# in #3#{}",
					"chance to play immediately",
					"upon highlighting"
				}
			},
		},
		["Voucher"] = {
			["v_minty_tabletopple"] = {
				["name"] = "Table Topple",
				["text"] = {
					"Discard up to {C:mult}#2#{} more",
					"cards at a time",
					"{C:inactive}({C:mult}#1# {C:inactive}total){}"
				}
			},
			["v_minty_catspaws"] = {
				["name"] = "Cat's Paws",
				["text"] = {
					"Discard up to {C:mult}all{}",
					"cards at a time;",
					"play up to {C:chips}#2#{} more",
					"cards at a time",
					"{C:inactive}({C:chips}#1# {C:inactive}total){}"
				},
				["unlock"] = {
					"Discard {C:attention}#1#{}{C:inactive}(#2#){} hands",
					"of {C:mult}6{} or more cards",
				}
			}
		},
		["Colour"] = {
			["c_minty_emeowrald"] = {
				["name"] = "Emeowrald Green",
				["text"] = {
					"Converts a random card in",
					"hand to {C:minty_3s}3s{} for every",
					"{C:attention}#4#{} round this has been held",
					"{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",

				}
			},
			["c_minty_emeowrald_flavor"] = {
				["name"] = "Emeowrald Green",
				["text"] = {
					"Converts a random card in",
					"hand to {C:minty_3s}3s{} for every",
					"{C:attention}#4#{} round this has been held",
					"{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
					" ",
					"{C:inactive,s:0.8}Green like a kitty's pretty eyes",
				}
			},
		},
		["Rotarot"] = {
			["c_minty_rot_cat"] = {
				["name"] = "The Cat!",
				["text"] = {
					"Add {C:attention}#1#{} random {C:attention}Enhanced",
					"{C:minty_3s}3s{} to your hand"
				},
			},
			["c_minty_rot_boredkid"] = {
				["name"] = "The Bored Child!",
				["text"] = {
					"Enhances {C:attention}#1#{} selected",
					"card into a",
					"{C:attention}#2#"
				},
			},
			["c_minty_rot_gleam"] = {
				["name"] = "The Gleam!",
				["text"] = {
					"Enhances {C:attention}#1#{} selected",
					"card into a",
					"{C:attention}#2#"
				},
			},
			["c_minty_rot_dorf"] = {
				["name"] = "The Dwarf!",
				["text"] = {
					"Reticulates up to",
					"{C:attention}#1#{} selected card#3#",
					"to #4#{C:attention}#2##3#{}",
				},
			},
			["c_minty_rot_dorf_flavor"] = {
				["name"] = "The Dwarf!",
				["text"] = {
					"Reticulates up to",
					"{C:attention}#1#{} selected card#3#",
					"to #4#{C:attention}#2##3#{}",
				},
			},
			["c_minty_rot_bitz"] = {
				["name"] = "The Bitz!",
				["text"] = {
					"Does something!",
					"I haven't decided what!",
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
			["minty_joker_locked_kity"] = {
				["name"] = "Locked",
				["text"] = {
					"Find this Joker from",
					"the {C:spectral}Soul{} or {C:spectral}Wand{} cards",
				}
			},
			["minty_joker_unavailable"] = {
				["name"] = "Unavailable",
				["label"] = "Unavailable",
				["text"] = {
					"Requires {C:attention}#1#{}:",
					"{C:mult}#2#{}"
				}
			},
			["normal_jokers"] = {
				["label"] = "Normal",
				["name"] = "Normal",
				["text"] = {
					"Capable of",
					"spawning naturally",
				},
			},
			["minty_disabled_object"] = {
				["label"] = "Object Disabled",
				["name"] = "Object Disabled",
				["text"] = {
					"Requires {C:attention}#1#{}:",
					"{C:mult}#2#{}"
				}
			},
			["minty_dev_warning"] = {
				["label"] = "WARNING",
				["name"] = "WARNING",
				["text"] = {
					"Known issue with {C:attention}#1#{}: {C:mult}#2#{}",
					"If issues persist, disable the",
					"{C:mult}Dev Mode{} of {C:minty_3s}Minty's Mod{} to",
					"prevent this object from spawning",
					" ",
					"{C:inactive,s:0.8}It's Dev Mode, you knew there'd be jank.{}",
				}
			},
			["minty_stone_cards"] = {
				["label"] = "Stone Card",
				["name"] = "Stone Card",
				["text"] = {
					"A card with a {C:attention}rock{}-",
					"themed enhancement"
				},
			},
			["minty_percent"] = {
				["label"] = "xkcd 985",
				["name"] = "xkcd 985",
				["text"] = {
					"That's percentage",
					"{C:attention}points{}."
				},
			},
			["minty_faceholder"] = {
				["label"] = "Faceholder",
				["name"] = "Faceholder",
				["text"] = {
					"Placeholder art,",
					"to be updated ~soon"
				},
			},
			["minty_faceholder_ex"] = {
				["label"] = "Faceholder",
				["name"] = "Faceholder",
				["text"] = {
					"Fallback art for",
					"unrecognized suit!",
					"Please play carefully."
				},
			},
			["minty_3credit"] = {
				["label"] = "Credit",
				["name"] = "Credit",
				["text"] = {
					"Art by",
					"{C:attention}Pentzal{}."
				},
			},
			["minty_peywet_exp_1"] = {
				["label"] = "What?",
				["name"] = "What?",
				["text"] = {
					"... What?",
				},
			},
			["minty_peywet_exp_2"] = {
				["label"] = "What?",
				["name"] = "What?",
				["text"] = {
					"... It's a {C:green}green{} {C:attention}food{},",
					"that's all I've got."
				},
			},
			["minty_peywet_exp_3"] = {
				["label"] = "Smack Barm Pey Wet",
				["name"] = "Smack Barm Pey Wet",
				["text"] = {
					"Multiplies listed",
					"{C:green}odds{} by {C:green}#1#{};",
					"consumed in {C:attention}#2#{} rounds"
				},
			},
			["minty_peywet_exp_3_flavor"] = {
				["label"] = "Smack Barm Pey Wet",
				["name"] = "Smack Barm Pey Wet",
				["text"] = {
					"Multiplies listed",
					"{C:green}odds{} by {C:green}#1#{};",
					"consumed in {C:attention}#2#{} rounds",
					" ",
					"{C:inactive,s:0.8}... transitively, that implies{}",
					"{C:inactive,s:0.8}gravy is as good as pey wet.{}",
				},
			},
		},
	},
}