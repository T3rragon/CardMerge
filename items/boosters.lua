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

local symbolChoices = {
    'c_star',
    'c_moon',
    'c_sun',
    'c_world',
    'c_sigil',
    'c_cryptid',
    'c_cmerge_mergesuit',
    'c_cmerge_slicesuit',
    'c_cmerge_flip',
    'c_cmerge_burn',
    'c_cmerge_gainspades',
    'c_cmerge_gainclubs',
    'c_cmerge_gainhearts',
    'c_cmerge_gaindiamonds',
    'c_cmerge_mergerank',
    'c_cmerge_add',
    'c_cmerge_promote',
    'c_cmerge_slicerank',
    'c_cmerge_trade',
    'c_cmerge_scattersuit',
    'c_cmerge_inspiresuit',
    'c_cmerge_null',
    'c_cmerge_ritual',
    'c_cmerge_release',
    'c_cmerge_chance',
    'c_cmerge_mitosis',
    'c_cmerge_rotary',
    'c_cmerge_scatterrank',
    'c_cmerge_inspirerank'
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
