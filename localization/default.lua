return {
    misc = {
        -- Suits

        suits_singular = {
            cmerge_Nones = "None",
            cmerge_Kites = "Kite",
            cmerge_Suns = "Sun",
            cmerge_Cups = "Cup",
            cmerge_Squids = "Squid",
            cmerge_Crescents = "Crescent",
            cmerge_Metals = "Metal",
            cmerge_Waters = "Water",
            cmerge_Earths = "Earth",
            cmerge_Fires = "Fire",
            cmerge_Airs = "Air",
            cmerge_Omnis = "Omni"
        },
        suits_plural = {
            cmerge_Nones = "Nones",
            cmerge_Kites = "Kites",
            cmerge_Suns = "Suns",
            cmerge_Cups = "Cups",
            cmerge_Squids = "Squids",
            cmerge_Crescents = "Crescents",
            cmerge_Metals = "Metals",
            cmerge_Waters = "Waters",
            cmerge_Earths = "Earths",
            cmerge_Fires = "Fires",
            cmerge_Airs = "Airs",
            cmerge_Omnis = "Omnis"
        },

        dictionary = {
            k_cmerge_symbol_pack = "Symbol Pack",
        }
    },

    descriptions = {
        Tarot = {
            c_cmerge_merge = {
                name = "Merge",
                text = {
                    "Merge {C:attention}#1#{} cards",
                    "of differing suits",
                    "together, creating",
                    "a {C:attention}merged suit{}",
                    "{C:inactive,s:0.75}(Copies rank and abilities from right card)"
                },
            },
            c_cmerge_slice = {
                name = "Slice",
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
        },
        Joker = {
            j_cmerge_layered = {
                name = "Layered Joker",
                text = {
                    "Played cards give",
                    "{C:red,s:1.1}+#1#{} Mult for",
                    "each suit merged inside",
                },
            },
            j_cmerge_yinyang = {
                name = "Yin Yang",
                text = {
                    "Played {C:attention}merged cards{} with both a",
                    "{C:spades}dark{} {C:clubs}suit{} and a {C:hearts}light{} {C:diamonds}suit{}",
                    "give {C:chips}+#1#{} chips",
                    "and {C:mult}+#2#{} mult"
                },
            },
            j_cmerge_redundant = {
                name = "Redundancy",
                text = {
                    "Scored {C:attention}Wild card{} {V:1}Omnis{}",
                    "give {X:mult,C:white}X#1#{} Mult"
                },
            },
            j_cmerge_trailmix = {
                name = "Trail Mix",
                text = {
                    "Played cards with merged suits",
                    "permanently gain {C:mult}#1#{} Mult",
                    "if played hand is a {C:attention}#2#{},",
                    "poker hand changes at end of round"
                },
            },
            j_cmerge_copperrelic = {
                name = "Copper Relic",
                text = {
                    "Played cards with merged suits",
                    "that include a",
                    "{C:diamonds}#1#{} and a {C:hearts}#2#{}",
                    "earn {C:money}$#3#{} when scored"
                },
            },
            j_cmerge_relaysystem = {
                name = "Relay System",
                text = {
                    "Played cards {C:attention}retrigger{}",
                    "by how many suits are merged",
                    "inside of it",
                    "{C:inactive,s:0.75}(Nones have no effect)"
                },
            },
            j_cmerge_ruleofthirds = {
                name = "Rule of Thirds",
                text = {
                    "Played {C:attention}3s{} with",
                    "exactly three merged suits",
                    "have a {C:green}#1# in #2#{} chance to",
                    "create a {C:tarot}Tarot{} card"
                },
            },
        },
        Spectral = {
            c_cmerge_scatter = {
                name = "Scatter",
                text = {
                    "Convert {C:attention}cards{} in hand",
                    "into a random suit,",
                    "{C:attention}including {}merged suits"
                },
            },
            c_cmerge_inspire = {
                name = "Inspire",
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
                    "including {C:attention}itself{}",
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
        }
    }
}
