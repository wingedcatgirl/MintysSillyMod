## Minty's Silly Little Mod

A silly little mod that adds some silly little jokers and decks and things.

[Mod main page on Modded Balatro Wiki](https://balatromods.miraheze.org/wiki/Minty%27s_Silly_Little_Mod) (Beware of SPOILERS!)

Current features:
- Cement
- Injokes
- Challenges
- Some jokers
- Several decks
- Placeholder art
- Cross-mod content
- A silly custom suit
- A little 3, as a treat
- Far more ambition than sense

Planned features:
- More cats
- More cubes
- Maybe more decks
- Definitely more injokes
- Probably way more cross-mod content

## Installation Instructions
1. Install [Lovely](https://github.com/ethangreen-dev/lovely-injector), if you haven't already.
2. Install [Steamodded](https://github.com/Steamopollys/steamodded), if you haven't already.
   - **Minimum supported version for 0.5.0 is BETA-0312b**.
   - Minimum supported version for latest commit is **BETA-0410a**.
3. Download the code as a ZIP file, from the latest release in Releases (should be stable, may be missing features) or the green "Code" button (may be buggy, but all features are available).
   - If you need old-calc Steamodded for some reason, please download [old-calc Minty's Mod](https://github.com/wingedcatgirl/MintysSillyMod/releases/tag/old-calc) as well; later versions are not kept compatible with old-calc.
4. Inside the zip file is the mod code in a folder, `MintysSillyMod-SOMEVERSION`. Put that folder in your Mods folder. The file structure should look like `Mods/MintysSillyMod-SOMEVERSION/MintysSillyMod.json`. In particular, there should _not_ be a second `MintysSillyMod` folder nested inside the first one. (You might prefer to remove the version number suffix from the folder name; it doesn't actually matter.)
5. Have a little 3 as a treat! :3

## To update to a newer version
1. Download the latest update.
2. Delete all files from your `Mods/MintysSillyMod` folder. (There's no save data in there, so you won't lose any progress.)
3. Unzip all the new files into the now-empty folder. Check again to make sure it's not nested.

> [!IMPORTANT]  
> Always start a new run after updating any mod. Attempting to continue an in-progress run may result in crashes.

## Config Options
- Dev Mode: Default false. Requires restart. Enables unfinished content. Usually there isn't any because I don't like leaving things unfinished. But latest-commit enjoyers might catch me in the middle of something.
- Flavor text: Default true. Enables funky MtG-style quotes at the bottom of some cards.
- Include stable crossover content: Default false. Includes cross-mod content which doesn't actually rely on the other mod's code to function. Not really the intended experience (it'll bias the Joker pool toward 3s a lot), but you might prefer maximum access to things.

## Recommended additional mods:
If you're trying out Minty's for the first time and want minimal other mods, go with [Challenger Deep](https://github.com/OOkayOak/Challenger-Deep) and [Spectrum Framework](https://github.com/wingedcatgirl/SpectrumFramework). The rest of the list is for after that.

### Technical
- [Challenger Deep](https://github.com/OOkayOak/Challenger-Deep) is required for all challenges in Minty's Mod.
- [Spectrum Framework](https://github.com/wingedcatgirl/SpectrumFramework) enables five-suit poker hands, which are a fun little thing to play with.
- [Talisman](https://github.com/MathIsFun0/Talisman) enables scores above e308 and also ^mult, which is just fun imo. Also very technically part of the next list (the Joker named Minty requires Talisman). They fixed the bug that bricks your save files, btw. talking to you, roffle. 

### Cross-mod content
Minty's Mod adds content for all of the following mods. Those with ⭐️ are also recommended for just, like, a basic default mod set. in my imo.
- [Card Sleeves](https://github.com/larswijn/CardSleeves) ⭐️
- [Cryptid](https://github.com/MathIsFun0/Cryptid)
- [Drafting](https://github.com/spire-winder/Balatro-Draft) ⭐️
- [Fusion Jokers](https://github.com/lshtech/Fusion-Jokers) ⭐️
- [Gemstones](https://github.com/0fficialHalo/Gemstones)
- [Ortalab](https://github.com/Eremel/Ortalab)
- [Paperback](https://github.com/GitNether/paperback) ⭐️

The following mod~~s~~ add content for Minty's Mod and we haven't returned the favor (yet):
- [Prism](https://github.com/blazingulag/Prism) ⭐️

### Other content mods
Minty's Mod doesn't add anything for these _yet_, but we might in future. Until then, we're just recommending them because we like them. Consider anything on this list ⭐️'d.
- [KCVanilla](https://github.com/kcgidw/kcvanilla) is just a couple of Jokers but I like them a lot. and it was the first mod I found that organized its files so I'm giving it a shoutout for that reason (I figured out how to organize my files by looking at its code)
- [Rift-Raft](https://github.com/vitellaryjr/RiftRaft) lets you send cards to the Void and then later you can get them back as negative from Void Packs, it's fun

### Quality of life
Technically you can do whatever you want here, but here's the mods I like for the purpose:
- [Galdur](https://github.com/Eremel/Galdur) revamps the New Run screen to make deck and sleeve selection much easier.
- [Handy](https://github.com/SleepyG11/HandyBalatro) adds a whole lot of things but tbh the only one I care about is selecting multiple playing cards by dragging across them.
- [Item Remover](https://github.com/art-muncher/Item-Remover) lets you disable specific items from the Collection, if they're OP or bugged or you just don't like them.

## Adding cross-mod interactions
- Legendary Kitys: Give your legendary kittycats `pools = {["kity"] = true}` to enable The Wand to summon them. Nothing interacts with non-legendary kittycats _yet_, but you can put them in the pool too for when/if we invent something.
- Gym Buddy boosts: Give your enhancements a `config.extra.gymboost` of `"chips"`, `"xchips"`, `"mult"`, `"xmult"`, `"cash"`, `"hchips"`, `"hxchips"`, `"hmult"`, `"hxmult"`, `"hcash"` or `"none"` to have them grant the corresponding boost when scored with cards not of that enhancement. (If you don't, one will be chosen randomly each time. Which maybe you prefer!) 

## Contributing
- Yes, feel free to contribute if you have a contribution!
- If you find a bug or plausibly-different-than-intended behavior, you can [file an issue](https://github.com/wingedcatgirl/MintysSillyMod/issues) (_please_ test thoroughly to confirm the exact conditions that do _and don't_ cause the problem - you may find [DebugPlus](https://github.com/WilsontheWolf/DebugPlus) to be helpful with this) 
- If you have a code contribution you can [do a pull request](https://github.com/wingedcatgirl/MintysSillyMod/pulls)
- If you have an art contribution... you can also do a pull request but if atlases make that too much a pain you can just send the art via one of the methods below:

## Contacting me (Minty wingedcatgirl)
- [Mod thread on the Balatro Discord](https://discord.com/channels/1116389027176787968/1308185262664450068) is the most obvious choice for mod-related communication.
- There's also [my Discord server](https://discord.gg/V5Kbh8Q) <small>or well, one of them, i start so many things and never follow through lol</small>
- Does GitHub have messaging? It has [Discussions](https://github.com/wingedcatgirl/MintysSillyMod/discussions), that'll have to do.
- Most reliable will be [Dreamwidth](https://wingedcatgirl.dreamwidth.org/). I'm not super _active_ there, but I can assure you it's not going away.
- I'm most active on [tumblr](https://www.tumblr.com/wingedcatgirl), though I don't trust the CEO of that site not to burn it all down without notice.