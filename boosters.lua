SMODS.Sound({
    key = "symbol_booster_pack_music",
    path = "symbol_pack_music.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    select_music_track = function(self)
        return G.booster_pack and not G.booster_pack.REMOVED and SMODS.OPENED_BOOSTER and
            SMODS.OPENED_BOOSTER.config.center.kind == 'symbol_pack' and 100 or nil
    end
})

SMODS.Atlas {
    key = "booster_symbol_pack",
    path = "booster_symbol_pack.png",
    px = 71,
    py = 95,
}

local symbolChoices = {
    'c_star',
    'c_moon',
    'c_sun',
    'c_world',
    'c_sigil',
    'c_cryptid',
    'c_cmerge_merge',
    'c_cmerge_slice',
    'c_cmerge_flip',
    'c_cmerge_burn', -- TODO: FINISH LIST
}

local ease_bg_symbol = function(self)
    ease_background_colour({ new_colour = G.C.CMERGE_SYMBOL_PACK_DARK, special_colour = G.C.CMERGE_SYMBOL_PACK_LIGHT })
end

SMODS.Booster {
    key = "symbol_pack_1",
    set = "Booster",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.choose, card.ability.extra, colours = { G.C.CMERGE_SYMBOL_PACK_MEDIUM } },
            key = "p_cmerge_symbol_pack_normal"
        }
    end,
    atlas = 'booster_symbol_pack',
    pos = { x = 0, y = 0 },
    group_key = "k_cmerge_symbol_pack",
    cost = 4,
    weight = 0.5,
    draw_hand = true,
    kind = "symbol_pack",
    create_card = function(self, card, i)
        local pick = pseudorandom("cmerge_symbol_pack", 1, #symbolChoices)


        return create_card("Consumable", G.pack_cards, nil, nil, true, nil, symbolChoices[pick], "cmerge_symbol_pack")
    end,
    ease_background_colour = ease_bg_symbol,
}

SMODS.Booster {
    key = "symbol_pack_2",
    set = "Booster",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.choose, card.ability.extra, colours = { G.C.CMERGE_SYMBOL_PACK_MEDIUM } },
            key = "p_cmerge_symbol_pack_normal"
        }
    end,
    atlas = 'booster_symbol_pack',
    pos = { x = 1, y = 0 },
    group_key = "k_cmerge_symbol_pack",
    cost = 4,
    weight = 0.5,
    draw_hand = true,
    kind = "symbol_pack",
    create_card = function(self, card, i)
        local pick = pseudorandom("cmerge_symbol_pack", 1, #symbolChoices)


        return create_card("Consumable", G.pack_cards, nil, nil, true, nil, symbolChoices[pick], "cmerge_symbol_pack")
    end,
    ease_background_colour = ease_bg_symbol,
}

SMODS.Booster {
    key = "symbol_pack_3",
    set = "Booster",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.choose, card.ability.extra, colours = { G.C.CMERGE_SYMBOL_PACK_MEDIUM } },
            key = "p_cmerge_symbol_pack_normal"
        }
    end,
    atlas = 'booster_symbol_pack',
    pos = { x = 2, y = 0 },
    group_key = "k_cmerge_symbol_pack",
    cost = 4,
    weight = 0.5,
    draw_hand = true,
    kind = "symbol_pack",
    create_card = function(self, card, i)
        local pick = pseudorandom("cmerge_symbol_pack", 1, #symbolChoices)


        return create_card("Consumable", G.pack_cards, nil, nil, true, nil, symbolChoices[pick], "cmerge_symbol_pack")
    end,
    ease_background_colour = ease_bg_symbol,
}

SMODS.Booster {
    key = "symbol_pack_4",
    set = "Booster",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.choose, card.ability.extra, colours = { G.C.CMERGE_SYMBOL_PACK_MEDIUM } },
            key = "p_cmerge_symbol_pack_normal"
        }
    end,
    atlas = 'booster_symbol_pack',
    pos = { x = 3, y = 0 },
    group_key = "k_cmerge_symbol_pack",
    cost = 4,
    weight = 0.5,
    draw_hand = true,
    kind = "symbol_pack",
    create_card = function(self, card, i)
        local pick = pseudorandom("cmerge_symbol_pack", 1, #symbolChoices)


        return create_card("Consumable", G.pack_cards, nil, nil, true, nil, symbolChoices[pick], "cmerge_symbol_pack")
    end,
    ease_background_colour = ease_bg_symbol,
}

SMODS.Booster {
    key = "jumbo_symbol_pack_1",
    set = "Booster",
    config = { extra = 5, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.choose, card.ability.extra, colours = { G.C.CMERGE_SYMBOL_PACK_MEDIUM } },
            key = "p_cmerge_symbol_pack_jumbo"
        }
    end,
    atlas = 'booster_symbol_pack',
    pos = { x = 0, y = 1 },
    group_key = "k_cmerge_symbol_pack",
    cost = 6,
    weight = 0.5,
    draw_hand = true,
    kind = "symbol_pack",
    create_card = function(self, card, i)
        local pick = pseudorandom("cmerge_symbol_pack", 1, #symbolChoices)


        return create_card("Consumable", G.pack_cards, nil, nil, true, nil, symbolChoices[pick], "cmerge_symbol_pack")
    end,
    ease_background_colour = ease_bg_symbol,
}

SMODS.Booster {
    key = "jumbo_symbol_pack_2",
    set = "Booster",
    config = { extra = 5, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.choose, card.ability.extra, colours = { G.C.CMERGE_SYMBOL_PACK_MEDIUM } },
            key = "p_cmerge_symbol_pack_jumbo"
        }
    end,
    atlas = 'booster_symbol_pack',
    pos = { x = 1, y = 1 },
    group_key = "k_cmerge_symbol_pack",
    cost = 6,
    weight = 0.5,
    draw_hand = true,
    kind = "symbol_pack",
    create_card = function(self, card, i)
        local pick = pseudorandom("cmerge_symbol_pack", 1, #symbolChoices)


        return create_card("Consumable", G.pack_cards, nil, nil, true, nil, symbolChoices[pick], "cmerge_symbol_pack")
    end,
    ease_background_colour = ease_bg_symbol,
}

SMODS.Booster {
    key = "mega_symbol_pack_1",
    set = "Booster",
    config = { extra = 5, choose = 2 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.choose, card.ability.extra, colours = { G.C.CMERGE_SYMBOL_PACK_MEDIUM } },
            key = "p_cmerge_symbol_pack_mega"
        }
    end,
    atlas = 'booster_symbol_pack',
    pos = { x = 2, y = 1 },
    group_key = "k_cmerge_symbol_pack",
    cost = 8,
    weight = 0.4,
    draw_hand = true,
    kind = "symbol_pack",
    create_card = function(self, card, i)
        local pick = pseudorandom("cmerge_symbol_pack", 1, #symbolChoices)


        return create_card("Consumable", G.pack_cards, nil, nil, true, nil, symbolChoices[pick], "cmerge_symbol_pack")
    end,
    ease_background_colour = ease_bg_symbol,
}

SMODS.Booster {
    key = "mega_symbol_pack_2",
    set = "Booster",
    config = { extra = 5, choose = 2 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.choose, card.ability.extra, colours = { G.C.CMERGE_SYMBOL_PACK_MEDIUM } },
            key = "p_cmerge_symbol_pack_mega"
        }
    end,
    atlas = 'booster_symbol_pack',
    pos = { x = 3, y = 1 },
    group_key = "k_cmerge_symbol_pack",
    cost = 8,
    weight = 0.4,
    draw_hand = true,
    kind = "symbol_pack",
    create_card = function(self, card, i)
        local pick = pseudorandom("cmerge_symbol_pack", 1, #symbolChoices)


        return create_card("Consumable", G.pack_cards, nil, nil, true, nil, symbolChoices[pick], "cmerge_symbol_pack")
    end,
    ease_background_colour = ease_bg_symbol,
}
