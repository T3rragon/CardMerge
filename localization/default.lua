return {
    misc = {
        -- Ranks
        ranks = {
            cmerge_Blank = "Blank",
            cmerge_Double = "Double",
            cmerge_Triple = "Triple",
            cmerge_Quadruple = "Quadruple",
            cmerge_Pentuple = "Pentuple",
            cmerge_Sextuple = "Sextuple",
            cmerge_Heptuple = "Heptuple",
            cmerge_Octuple = "Octuple",
            cmerge_Nonuple = "Nonuple",
            cmerge_Decuple = "Decuple",
            cmerge_Hendecuple = "Hendecuple",
            cmerge_Dodecuple = "Dodecuple",
            cmerge_Deck = "Deck",
        },
        -- Suits
        suits_singular = {
            cmerge_Nones = "None",
            cmerge_Trees = "Kite",
            cmerge_Suns = "Sun",
            cmerge_Cups = "Cup",
            cmerge_Squids = "Squid",
            cmerge_Crescents = "Crescent",
            cmerge_Metals = "Metal",
            cmerge_Waters = "Water",
            cmerge_Earths = "Earth",
            cmerge_Fires = "Fire",
            cmerge_Airs = "Air",
            cmerge_Omnis = "Omni",
            cmerge_2suits = "2-suit",
            cmerge_3suits = "3-suit",
            cmerge_4suits = "4-suit",
            cmerge_5suits = "5-suit",
            cmerge_6suits = "6-suit",
            cmerge_7suits = "7-suit",
            cmerge_8suits = "8-suit",
            cmerge_9suits = "9-suit",
            cmerge_Ultras = "Ultra"
        },
        suits_plural = {
            cmerge_Nones = "Nones",
            cmerge_Trees = "Trees",
            cmerge_Suns = "Suns",
            cmerge_Cups = "Cups",
            cmerge_Squids = "Squids",
            cmerge_Crescents = "Crescents",
            cmerge_Metals = "Metals",
            cmerge_Waters = "Waters",
            cmerge_Earths = "Earths",
            cmerge_Fires = "Fires",
            cmerge_Airs = "Airs",
            cmerge_Omnis = "Omnis",
            cmerge_2suits = "2-suits",
            cmerge_3suits = "3-suits",
            cmerge_4suits = "4-suits",
            cmerge_5suits = "5-suits",
            cmerge_6suits = "6-suits",
            cmerge_7suits = "7-suits",
            cmerge_8suits = "8-suits",
            cmerge_9suits = "9-suits",
            cmerge_Ultras = "Ultras"
        },

        dictionary = {
            k_cmerge_symbol_pack = "Symbol Pack",
            k_cmerge_wallsocket = "Good luck!",
            k_cmerge_cloudflare = "Internal Server Error",
        }
    },

    descriptions = {
        Tarot = {
            c_cmerge_mergesuit = {
                name = "Merge Suit",
                text = {
                    "Merge {C:attention}#1#{} cards",
                    "of differing suits",
                    "together, creating",
                    "a {C:attention}merged suit{}",
                    "{C:inactive,s:0.75}(Copies rank and abilities from right card)"
                },
            },
            c_cmerge_slicesuit = {
                name = "Slice Suit",
                text = {
                    "Select {C:attention}#1#{} cards,",
                    "removes the {C:attention}right{} suit",
                    "from the {C:attention}left{} card",
                    "{C:inactive}(Drag to rearrange)"
                },
            },
            c_cmerge_flip = {
                name = "Flip",
                text = {
                    "Select {C:attention}#1#{} card,",
                    "{C:attention}Inverses{} what suit",
                    "it {C:attention}has{} and",
                    "{C:attention}doesn\'t have",
                    "{C:inactive,s:0.75}(Vanilla suits only, removes modded suits)"
                },
            },
            c_cmerge_burn = {
                name = "Burn",
                text = {
                    "{C:red}Regresses{} {C:attention}#1#{} card",
                    "into a {C:attention}random solo suit{},",
                    "gives a chosen {C:attention}edition",
                    "based on removed suits",
                    "{C:inactive,s:0.75}(1 = Foil, 2 = Holographic, 3+ = Polychrome)"
                },
            },
            c_cmerge_gainspades = {
                name = "Spade Gain",
                text = {
                    "Select {C:attention}#1#{} cards,",
                    "{C:attention}merge{} a {C:spades}Spade{}",
                    "into it"
                },
            },
            c_cmerge_gainclubs = {
                name = "Club Gain",
                text = {
                    "Select {C:attention}#1#{} cards,",
                    "{C:attention}merge{} a {C:clubs}Club{}",
                    "into it"
                },
            },
            c_cmerge_gainhearts = {
                name = "Heart Gain",
                text = {
                    "Select {C:attention}#1#{} cards,",
                    "{C:attention}merge{} a {C:hearts}Heart{}",
                    "into it"
                },
            },
            c_cmerge_gaindiamonds = {
                name = "Diamond Gain",
                text = {
                    "Select {C:attention}#1#{} cards,",
                    "{C:attention}merge{} a {C:diamonds}Diamond{}",
                    "into it"
                },
            },
            c_cmerge_mergerank = {
                name = "Merge Rank",
                text = {
                    "Merge {C:attention}#1#{} cards",
                    "of differing ranks",
                    "together, creating",
                    "a {C:attention}merged rank{}",
                    "{C:inactive,s:0.75}(Copies suit and abilities from right card)"
                },
            },
            c_cmerge_add = {
                name = "Add",
                text = {
                    "Select {C:attention}#1#{} cards,",
                    "{C:attention}merge{} a random {C:attention}numbered rank{}",
                    "into it",
                    "{C:inactive,s:0.75}(Aces included)"
                },
            },
            c_cmerge_promote = {
                name = "Promote",
                text = {
                    "Select {C:attention}#1#{} cards,",
                    "{C:attention}merge{} a random {C:attention}face rank{}",
                    "into it"
                },
            },
            c_cmerge_slicerank = {
                name = "Slice Rank",
                text = {
                    "Select {C:attention}#1#{} cards,",
                    "removes the {C:attention}right{} rank",
                    "from the {C:attention}left{} card",
                    "{C:inactive}(Drag to rearrange)"
                },
            },
            c_cmerge_trade = {
                name = "Trade",
                text = {
                    "{C:red}Regresses{} {C:attention}#1#{} card",
                    "into a {C:attention}random solo rank{},",
                    "gives a chosen {C:attention}seal",
                    "based on removed ranks",
                    "{C:inactive,s:0.75}(1-2 = Purple, 3-4 = Blue,",
                    "{C:inactive,s:0.75}5-6 = Gold, 7+ = Red)",
                },
            },
        },
        Joker = {
            j_cmerge_layered = {
                name = "Layered Joker",
                text = {
                    "Scored cards give",
                    "{C:mult,s:1.1}+#1#{} Mult for",
                    "each suit merged inside",
                    "{C:inactive,s:0.75}-------------------",
                    "{C:inactive,s:0.75}Joker graphic assisted by Jimbo Joshua Jokkeman"
                },
            },
            j_cmerge_yinyang = {
                name = "Yin Yang",
                text = {
                    "Scored cards with {C:attention}merged suits{} that have a",
                    "{C:spades}dark{} {C:clubs}suit{} and a {C:hearts}light{} {C:diamonds}suit{}",
                    "give {C:chips}+#1#{} chips",
                    "and {C:mult}+#2#{} mult",
                    "{C:inactive,s:0.75}-------------------",
                    "{C:inactive,s:0.75}Joker graphic by Jimbo Joshua Jokkeman"
                },
            },
            j_cmerge_redundant = {
                name = "Redundancy",
                text = {
                    "Scored {C:attention}Wild card{} {V:1}Omnis{}",
                    "give {X:mult,C:white}X#1#{} Mult",
                    "{C:inactive,s:0.75}-------------------",
                    "{C:inactive,s:0.75}Joker graphic by Jimbo Joshua Jokkeman"
                },
            },
            j_cmerge_trailmix = {
                name = "Trail Mix",
                text = {
                    "Played cards with {C:attention}merged suits{}",
                    "permanently gain {C:mult}#1#{} Mult",
                    "if played hand is a {C:attention}#2#{},",
                    "poker hand changes at end of round"
                },
            },
            j_cmerge_copperrelic = {
                name = "Copper Relic",
                text = {
                    "Played cards with {C:attention}merged suits{}",
                    "that include a",
                    "{C:diamonds}#1#{} and a {C:hearts}#2#{}",
                    "earn {C:money}$#3#{} when scored"
                },
            },
            j_cmerge_relaysystem = {
                name = "Relay System",
                text = {
                    "Scored cards {C:attention}retrigger{}",
                    "by how many suits are merged",
                    "inside of it",
                    "{C:inactive,s:0.75}(Nones have no effect)",
                    "{C:inactive,s:0.75}-------------------",
                    "{C:inactive,s:0.75}Joker graphic assisted by Jimbo Joshua Jokkeman"
                },
            },
            j_cmerge_ruleofthirds = {
                name = "Rule of Thirds",
                text = {
                    "Scored {C:attention}3s{} with",
                    "exactly three merged suits",
                    "have a {C:green}#1# in #2#{} chance to",
                    "create a {C:tarot}Tarot{} card"
                },
            },
            j_cmerge_wallsocket = {
                name = "Wallsocket",
                text = {
                    "Played {C:attention}face cards{} will",
                    "turn into {C:attention}Queens{} if",
                    "played hand contains a {V:1}Crescent{}",
                    "{C:inactive,s:0.75}-------------------",
                    "{C:money}$#1#{} for every transition"
                },
            },
            j_cmerge_dartboard = {
                name = "Dart Board",
                text = {
                    "Scored cards with {C:attention}merged ranks{} will",
                    "add a random {C:attention}numbered{} card",
                    "into {C:mult}Mult{}"
                },
            },
            j_cmerge_stacked = {
                name = "Stacked Joker",
                text = {
                    "Scored cards give",
                    "{C:chips,s:1.1}+#1#{} Chips for",
                    "each rank merged inside",
                },
            },
            j_cmerge_savinggrace = {
                name = "Saving Grace",
                text = {
                    "Played cards with {C:attention}no rank or suit{}",
                    "permanently gain {C:chips}#1#{} Chips",
                    "and {C:mult}#2#{} Mult"
                },
            },
            j_cmerge_cloudflare = {
                name = "Cloudflare",
                text = {
                    "Scored cards with {C:attention}3+{} merged ranks",
                    "give {X:mult,C:white}X#1#{} Mult,",
                    "has a {C:green}#2# in #3#{} chance to",
                    "{C:red}Crash and destroy itself{}"
                },
            },
            j_cmerge_pomni = {
                name = "Pomni",
                text = {
                    "Played card with {C:attention}merged suits{}",
                    "give {X:mult,C:white}XMult{}",
                    "for every suit",
                    "merged inside of it"
                },
            },
        },
        Spectral = {
            c_cmerge_scattersuit = {
                name = "Suit Scatter",
                text = {
                    "Convert {C:attention}cards{} in hand",
                    "into a random suit,",
                    "{C:attention}including{} merged suits"
                },
            },
            c_cmerge_inspiresuit = {
                name = "Suit Inspire",
                text = {
                    "Select {C:attention}#1#{} card,",
                    "{C:red}Destroy{} it and",
                    "add its {C:attention}suit{} to",
                    "the rest of hand"
                },
            },
            c_cmerge_null = {
                name = "Null",
                text = {
                    "Select {C:attention}#1#{} card,",
                    "{C:red}Remove{} its suit",
                    "from entire hand,",
                    "including {C:attention}itself{}"
                },
            },
            c_cmerge_ritual = {
                name = "Ritual",
                text = {
                    "Convert {C:attention}#1#{} random",
                    "cards in hand into",
                    "{C:#1#}Omnis"
                },
            },
            c_cmerge_release = {
                name = "Release",
                text = {
                    "Select {C:attention}#1#{} card,",
                    "{C:red}Destroy{} it and",
                    "create a card for",
                    "every rank {C:attention}contained{}"
                },
            },
            c_cmerge_chance = {
                name = "Chance",
                text = {
                    "Add a {C:attention}random{}",
                    "rank and suit into",
                    "every card in hand,",
                    "repeats are {C:red}very likely{}",
                    "and will add nothing"
                },
            },
            c_cmerge_mitosis = {
                name = "Mitosis",
                text = {
                    "Create {C:attention}#1#{} copies of",
                    "{C:attention}#2#{} selected card with merged ranks/suits.",
                    "Copies have a chance to lose",
                    "rank/suits upon creation."
                },
            },
            c_cmerge_rotary = {
                name = "Rotary",
                text = {
                    "All {C:attention}suits{} in hand",
                    "shift to the {C:attention}left{},",
                    "all {C:attention}ranks{} in hand",
                    "shift to the {C:attention}right{}"
                },
            },
            c_cmerge_scatterrank = {
                name = "Rank Scatter",
                text = {
                    "Convert {C:attention}cards{} in hand",
                    "into a random rank,",
                    "{C:attention}including{} merged ranks",
                    "{C:inactive,s:0.75}(Maximum of 6 ranks)"
                },
            },
            c_cmerge_inspirerank = {
                name = "Rank Inspire",
                text = {
                    "Select {C:attention}#1#{} card,",
                    "{C:red}Destroy{} it and",
                    "add its {C:attention}rank{} to",
                    "the rest of hand"
                },
            },
        },
        Other = {
            p_cmerge_symbol_pack_normal = {
                name = "Symbol Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:#1#}Symbol{} cards to",
                    "be used immediately",
                },
            },
            p_cmerge_symbol_pack_jumbo = {
                name = "Jumbo Symbol Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:#1#}Symbol{} cards to",
                    "be used immediately",
                },
            },
            p_cmerge_symbol_pack_mega = {
                name = "Mega Symbol Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:#1#}Symbol{} cards to",
                    "be used immediately",
                },
            },

            cmerge_merged_suit_tooltip = {
                name = "Merged Suit",
                text = {
                    "Has the",
                    "following suits:",
                    "{C:attention}#1#{}",
                },
            },

            cmerge_merged_rank_tooltip = {
                name = "Merged Rank",
                text = {
                    "Has the",
                    "following ranks:",
                    "{C:attention}#1#{}",
                },
            },
        }
    }
}
