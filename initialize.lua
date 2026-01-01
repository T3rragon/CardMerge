CARDMERGE.cmergeSuits = {
    { name = 'Trees',     color = G.C.CMERGE_TREES },     -- Diamond + Spade
    { name = 'Suns',      color = G.C.CMERGE_SUNS },      -- Diamond + Club
    { name = 'Cups',      color = G.C.CMERGE_CUPS },      -- Heart + Spade
    { name = 'Squids',    color = G.C.CMERGE_SQUIDS },    -- Spade + Club
    { name = 'Crescents', color = G.C.CMERGE_CRESCENTS }, -- Heart + Club
    { name = 'Metals',    color = G.C.CMERGE_METALS },    -- Diamond + Heart
    { name = 'Waters',    color = G.C.CMERGE_WATERS },    -- Heart + Club + Spade
    { name = 'Earths',    color = G.C.CMERGE_EARTHS },    -- Diamond + Spade + Club
    { name = 'Fires',     color = G.C.CMERGE_FIRES },     -- Heart + Spade + Diamond
    { name = 'Airs',      color = G.C.CMERGE_AIRS },      -- Heart + Club + Diamond
    { name = 'Omnis',     color = G.C.CMERGE_OMNIS },     -- Heart + Club + Diamond + Spade
    { name = 'Nones',     color = G.C.CMERGE_NONES }
}

CARDMERGE.cmergeVagueSuits = {
    { name = '2suits', color = G.C.CMERGE_NONES },
    { name = '3suits', color = G.C.CMERGE_NONES },
    { name = '4suits', color = G.C.CMERGE_NONES },
    { name = '5suits', color = G.C.CMERGE_NONES },
    { name = '6suits', color = G.C.CMERGE_NONES },
    { name = '7suits', color = G.C.CMERGE_NONES },
    { name = '8suits', color = G.C.CMERGE_NONES },
    { name = '9suits', color = G.C.CMERGE_NONES },
    { name = 'Ultras', color = G.C.CMERGE_NONES },
}

CARDMERGE.cmergeVagueRanks = {
    { name = 'Blank',      shorthand = 'X' },
    { name = 'Double',     shorthand = '2R' },
    { name = 'Triple',     shorthand = '3R' },
    { name = 'Quadruple',  shorthand = '4R' },
    { name = 'Pentuple',   shorthand = '5R' },
    { name = 'Sextuple',   shorthand = '6R' },
    { name = 'Heptuple',   shorthand = '7R' },
    { name = 'Octuple',    shorthand = '8R' },
    { name = 'Nonuple',    shorthand = '9R' },
    { name = 'Decuple',    shorthand = '10R' },
    { name = 'Hendecuple', shorthand = '11R' },
    { name = 'Dodecuple',  shorthand = '12R' },
    { name = 'Deck',       shorthand = 'D!' },
}

-- SMODS.Atlas({ key = 'cmerge_suits_temp', path = 'card_temp.png', px = 71, py = 95 })
-- SMODS.Atlas({ key = 'cmerge_ui_temp', path = 'ui_temp.png', px = 18, py = 18 })
-- SMODS.Atlas({ key = 'cmerge_rank_temp', path = 'rank_temp.png', px = 71, py = 95 })

-- TODO: IMPLEMENT HIGH CONTRAST SUITS
SMODS.Atlas({ key = 'cmerge_suits', path = 'suits.png', px = 71, py = 95 })
-- SMODS.Atlas({ key = 'cmerge_suits_hc', path = 'suits_hc.png', px = 71, py = 95 })
SMODS.Atlas({ key = 'cmerge_vauge_suits', path = 'vague_suits.png', px = 71, py = 95 })
SMODS.Atlas({ key = 'cmerge_ui', path = 'ui.png', px = 18, py = 18 })
-- SMODS.Atlas({ key = 'cmerge_ui_hc', path = 'ui_hc.png', px = 18, py = 18 })
SMODS.Atlas({ key = 'cmerge_vauge_ui', path = 'vague_ui.png', px = 18, py = 18 })

SMODS.Atlas({ key = 'cmerge_ranks', path = 'ranks.png', px = 71, py = 95 })

for i = 1, #CARDMERGE.cmergeSuits do
    SMODS.Suit {
        key = CARDMERGE.cmergeSuits[i].name,
        card_key = string.upper(CARDMERGE.cmergeSuits[i].name),

        lc_atlas = 'cmerge_suits',
        lc_ui_atlas = 'cmerge_ui',

        pos = { y = i - 1 },
        ui_pos = { x = i - 1, y = 0 },

        lc_colour = CARDMERGE.cmergeSuits[i].color,

        in_pool = function(self, args)
            if args and args.initial_deck then
                return false
            end
        end
    }
end

for i = 1, #CARDMERGE.cmergeVagueSuits do
    SMODS.Suit {
        key = CARDMERGE.cmergeVagueSuits[i].name,
        card_key = string.upper(CARDMERGE.cmergeVagueSuits[i].name),

        lc_atlas = 'cmerge_vauge_suits',
        lc_ui_atlas = 'cmerge_vauge_ui',

        pos = { y = i - 1 },
        ui_pos = { x = i - 1, y = 0 },

        lc_colour = CARDMERGE.cmergeVagueSuits[i].color,

        in_pool = function(self, args)
            if args and args.initial_deck then
                return false
            end
        end
    }
end

for i = 1, #CARDMERGE.cmergeVagueRanks do
    local nominalKey = 6 + (i * 2)
    if i == 1 then
        nominalKey = 0
    end
    SMODS.Rank {
        key = CARDMERGE.cmergeVagueRanks[i].name,
        card_key = string.upper(CARDMERGE.cmergeVagueRanks[i].name),

        nominal = nominalKey,
        strength_effect = {
            ignore = true
        },
        shorthand = CARDMERGE.cmergeVagueRanks[i].shorthand,

        lc_atlas = 'cmerge_ranks',
        hc_atlas = 'cmerge_ranks',
        pos = { x = i - 1 },

        in_pool = function(self, args)
            if args and args.initial_deck then
                return false
            end
        end
    }
end

SMODS.Sound({ key = 'suit_merge', path = 'suit_merge.ogg' })
SMODS.Sound({ key = 'suit_merge_super', path = 'suit_merge_super.ogg' })
SMODS.Sound({ key = 'suit_merge_hyper', path = 'suit_merge_hyper.ogg' })
SMODS.Sound({ key = 'suit_slice', path = 'suit_slice.ogg' })
SMODS.Sound({ key = 'suit_flip', path = 'suit_flip.ogg' })
SMODS.Sound({ key = 'suit_burn', path = 'suit_burn.ogg' })

SMODS.Sound({ key = 'rank_merge', path = 'rank_merge.ogg' })

SMODS.Atlas({ key = 'consumeables', path = 'consumeables.png', px = 71, py = 95 })
SMODS.Atlas({ key = 'jokers', path = 'jokers.png', px = 71, py = 95 })
SMODS.Atlas { key = "booster_symbol_pack", path = "booster_symbol_pack.png", px = 71, py = 96, }
