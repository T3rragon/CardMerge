CARDMERGE = { vars = {}, funcs = {}, content = SMODS.current_mod }

SMODS.Atlas {
    key = "modicon",
    path = "icon.png",
    px = 34,
    py = 34
}

SMODS.load_file("functions.lua")()
SMODS.load_file("tarots.lua")()
SMODS.load_file("spectrals.lua")()
SMODS.load_file("jokers.lua")()
SMODS.load_file("boosters.lua")()
SMODS.load_file("crossmod.lua")()

local cmergeSuits = {
    { name = 'Kites',     color = G.C.CMERGE_KITES },     -- Diamond + Spade
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
}

SMODS.Atlas({ key = 'cmerge_cards_temp', path = 'card_temp.png', px = 71, py = 95 })
SMODS.Atlas({ key = 'cmerge_suits_temp', path = 'ui_temp.png', px = 18, py = 18 })
SMODS.Atlas({ key = 'cmerge_cards', path = 'suits.png', px = 71, py = 95 })
SMODS.Atlas({ key = 'cmerge_cards_hc', path = 'suits_hc.png', px = 71, py = 95 })
SMODS.Atlas({ key = 'cmerge_suits', path = 'ui.png', px = 18, py = 18 })
SMODS.Atlas({ key = 'cmerge_suits_hc', path = 'ui_hc.png', px = 18, py = 18 })

SMODS.Suit { -- Temp
    key = 'Nones',
    card_key = 'NONES',
    hidden = false,

    lc_atlas = 'cmerge_cards_temp',
    lc_ui_atlas = 'cmerge_suits_temp',

    pos = { x = 0, y = 0 },
    ui_pos = { x = 0, y = 0 },

    lc_colour = G.C.CMERGE_NONES,

    in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
    end
}

for i = 1, #cmergeSuits do
    SMODS.Suit {
        key = cmergeSuits[i].name,
        card_key = string.upper(cmergeSuits[i].name),

        lc_atlas = 'cmerge_cards',
        lc_ui_atlas = 'cmerge_suits',
        hc_atlas = 'cmerge_cards_hc',
        hc_ui_atlas = 'cmerge_suits_hc',

        pos = { y = i - 1 },
        ui_pos = { x = i - 1, y = 0 },

        lc_colour = cmergeSuits[i].color,

        in_pool = function(self, args)
            if args and args.initial_deck then
                return false
            end
        end
    }
end

local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    if not SMODS.has_no_suit(self) then
        local suitCheck = CARDMERGE.InitAbilityTable(self)
        if (suitCheck['Hearts'] and suit == 'Hearts') then
            return true
        end
        if (suitCheck['Diamonds'] and suit == 'Diamonds') then
            return true
        end
        if (suitCheck['Clubs'] and suit == 'Clubs') then
            return true
        end
        if (suitCheck['Spades'] and suit == 'Spades') then
            return true
        end
    end
    return card_is_suit_ref(self, suit, bypass_debuff, flush_calc)
end
