SMODS.Consumable { -- Scatter Suit
    key = 'scattersuit',
    set = 'Spectral',
    atlas = 'consumeables',
    pos = { x = 0, y = 2 },
    unlocked = true,
    discovered = true,
    cost = 3,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            FlipCard(G.hand.cards[i], 'card1', percent)
        end
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = G.hand.cards[i]
                    _card:set_suit_table(CARDMERGE.RandomizeSuitTable())
                    local _suit = CARDMERGE.SuitExtractor(_card:suit_table())
                    assert(SMODS.change_base(_card, _suit))
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            FlipCard(G.hand.cards[i], 'tarot2', percent, 0.6)
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,
}

SMODS.Consumable { -- Inspire Suit
    key = 'inspiresuit',
    set = 'Spectral',
    atlas = 'consumeables',
    pos = { x = 1, y = 2 },
    unlocked = true,
    discovered = true,
    cost = 3,
    config = { max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            if G.hand.cards[i] ~= G.hand.highlighted[1] then
                FlipCard(G.hand.cards[i], 'card1', percent)
            end
        end
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = G.hand.cards[i]
                    local suitTable = CARDMERGE.MergeSuitTables(G.hand.cards[i], G.hand.highlighted[1])
                    assert(SMODS.change_base(_card, CARDMERGE.SuitExtractor(suitTable)))
                    if CARDMERGE.CheckIfVagueSuits(_card.base.suit) then
                        _card:set_suit_table(suitTable)
                    end
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            SMODS.destroy_cards(G.hand.highlighted[i])
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            FlipCard(G.hand.cards[i], 'tarot2', percent, 0.6)
        end
        delay(0.5)
    end,
}

SMODS.Consumable { -- Null
    key = 'null',
    set = 'Spectral',
    atlas = 'consumeables',
    pos = { x = 2, y = 2 },
    unlocked = true,
    discovered = true,
    cost = 3,
    config = { max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local tableMerger
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            FlipCard(G.hand.cards[i], 'card1', percent)
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.0,
            func = function()
                play_sound('cmerge_suit_slice', 1, 0.4)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            tableMerger = G.hand.highlighted[i]
        end
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = G.hand.cards[i]
                    local suitTable = CARDMERGE.RemoveFromSuitTable(_card, tableMerger)
                    assert(SMODS.change_base(_card, CARDMERGE.SuitExtractor(suitTable)))
                    if CARDMERGE.CheckIfVagueSuits(_card.base.suit) then
                        _card:set_suit_table(suitTable)
                    end
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            FlipCard(G.hand.cards[i], 'tarot2', percent, 0.6)
        end
        delay(0.5)
    end,
}

SMODS.Consumable { -- Ritual
    key = 'ritual',
    set = 'Spectral',
    atlas = 'consumeables',
    pos = { x = 3, y = 2 },
    unlocked = true,
    discovered = true,
    cost = 3,
    config = { extra = { morph = 2 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.morph } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local morphed_cards = {}
        local temp_hand = {}

        for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
        table.sort(temp_hand,
            function(a, b)
                return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
            end
        )

        pseudoshuffle(temp_hand, 'immolate')

        for i = 1, card.ability.extra.morph do morphed_cards[#morphed_cards + 1] = temp_hand[i] end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #morphed_cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            FlipCard(morphed_cards[i], 'card1', percent)
        end
        for i = 1, #morphed_cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    assert(SMODS.change_base(morphed_cards[i], 'cmerge_Omnis'))
                    return true
                end
            }))
        end
        delay(0.2)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.0,
            func = function()
                play_sound('cmerge_suit_merge', 1, 0.4)
                return true
            end
        }))
        for i = 1, #morphed_cards do
            local percent = 0.85 + (i - 0.999) / (#morphed_cards - 0.998) * 0.3
            FlipCard(morphed_cards[i], 'tarot2', percent, 0.6)
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,
}

SMODS.Consumable { -- Scatter Rank
    key = 'scatterrank',
    set = 'Spectral',
    atlas = 'consumeables',
    pos = { x = 0, y = 3 },
    unlocked = true,
    discovered = true,
    cost = 3,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            FlipCard(G.hand.cards[i], 'card1', percent)
        end
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = G.hand.cards[i]
                    _card:set_rank_table(CARDMERGE.RandomizeRankTable())
                    local _rank = CARDMERGE.RankExtractor(_card:rank_table())
                    assert(SMODS.change_base(_card, nil, _rank))
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            FlipCard(G.hand.cards[i], 'tarot2', percent, 0.6)
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,
}

SMODS.Consumable { -- Inspire Rank
    key = 'inspirerank',
    set = 'Spectral',
    atlas = 'consumeables',
    pos = { x = 1, y = 3 },
    unlocked = true,
    discovered = true,
    cost = 3,
    config = { max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            if G.hand.cards[i] ~= G.hand.highlighted[1] then
                FlipCard(G.hand.cards[i], 'card1', percent)
            end
        end
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = G.hand.cards[i]
                    local rankTable = CARDMERGE.MergeRankTables(G.hand.cards[i], G.hand.highlighted[1])
                    assert(SMODS.change_base(_card, nil, CARDMERGE.RankExtractor(rankTable)))
                    if CARDMERGE.CheckIfVagueRanks(_card.base.value) then
                        _card:set_rank_table(rankTable)
                    end
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            SMODS.destroy_cards(G.hand.highlighted[i])
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            FlipCard(G.hand.cards[i], 'tarot2', percent, 0.6)
        end
        delay(0.5)
    end,
}

SMODS.Consumable { -- Release
    key = 'release',
    set = 'Spectral',
    atlas = 'consumeables',
    pos = { x = 4, y = 2 },
    unlocked = true,
    discovered = true,
    cost = 4,
    config = { max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            FlipCard(G.hand.highlighted[i], 'card1', percent)
        end
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local new_cards = {}
                    for key, _ in pairs(G.hand.highlighted[i]:rank_table()) do
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1

                        local rankTable = { [tostring(key)] = true }
                        local _card = copy_card(G.hand.highlighted[i], nil, nil, G.playing_card)
                        assert(SMODS.change_base(_card, nil, CARDMERGE.RankExtractor(rankTable)))
                        if CARDMERGE.CheckIfVagueRanks(_card.base.value) then
                            _card:set_rank_table(rankTable)
                        end
                        _card:add_to_deck()

                        table.insert(G.playing_cards, _card)
                        G.hand:emplace(_card)
                        _card:start_materialize(nil, nil)
                        new_cards[#new_cards + 1] = _card
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = new_cards })
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            SMODS.destroy_cards(G.hand.highlighted[i])
        end
        delay(0.5)
    end
}

SMODS.Consumable { -- Chance
    key = 'chance',
    set = 'Spectral',
    atlas = 'consumeables',
    pos = { x = 5, y = 2 },
    unlocked = true,
    discovered = true,
    cost = 5,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            FlipCard(G.hand.cards[i], 'card1', percent)
        end
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = G.hand.cards[i]
                    local suitTable = _card:suit_table()
                    suitTable[pseudorandom_element({ 'Spades', 'Hearts', 'Clubs', 'Diamonds' }, "chance_suit")] = true

                    local rankTable = _card:rank_table()
                    rankTable[pseudorandom_element({ '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14' },
                        "chance_rank")] = true

                    assert(SMODS.change_base(_card, CARDMERGE.SuitExtractor(suitTable),
                    CARDMERGE.RankExtractor(rankTable)))
                    if CARDMERGE.CheckIfVagueSuits(_card.base.suit) then
                        _card:set_suit_table(suitTable)
                    end
                    if CARDMERGE.CheckIfVagueRanks(_card.base.value) then
                        _card:set_rank_table(rankTable)
                    end
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            FlipCard(G.hand.cards[i], 'tarot2', percent, 0.6)
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,
}

SMODS.Consumable { -- Mitosis
    key = 'mitosis',
    set = 'Spectral',
    atlas = 'consumeables',
    pos = { x = 6, y = 2 },
    unlocked = true,
    discovered = true,
    cost = 4,
    config = { max_highlighted = 1, extra = { cards = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards, card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            FlipCard(G.hand.highlighted[i], 'card1', percent)
        end
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                func = function()
                    for j = 1, card.ability.extra.cards do
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1

                        local output = {
                            suits = {},
                            ranks = {}
                        }
                        local suitTable = G.hand.highlighted[i]:suit_table()
                        local rankTable = G.hand.highlighted[i]:rank_table()
                        for key, _ in pairs(suitTable) do
                            if not SMODS.pseudorandom_probability(card, "mitosis", 1, 4) then
                                output.suits[key] = true
                            end
                        end
                        for key, _ in pairs(rankTable) do
                            if not SMODS.pseudorandom_probability(card, "mitosis", 1, 4) then
                                output.ranks[tostring(key)] = true
                            end
                        end

                        local _card = copy_card(G.hand.highlighted[i], nil, nil, G.playing_card)
                        _card = SMODS.change_base(_card, CARDMERGE.SuitExtractor(output.suits),
                            CARDMERGE.RankExtractor(output.ranks))
                        if CARDMERGE.CheckIfVagueSuits(_card.base.suit) then
                            _card:set_suit_table(output.suits)
                        end
                        if CARDMERGE.CheckIfVagueRanks(_card.base.value) then
                            _card:set_rank_table(output.ranks)
                        end
                        _card:add_to_deck()

                        table.insert(G.playing_cards, _card)
                        G.hand:emplace(_card)
                        _card:start_materialize(nil, nil)
                        local cards = { _card }
                        SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    end
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            FlipCard(G.hand.highlighted[i], 'tarot2', percent, 0.6)
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end
}

SMODS.Consumable { -- Rotary
    key = 'rotary',
    set = 'Spectral',
    atlas = 'consumeables',
    pos = { x = 7, y = 2 },
    unlocked = true,
    discovered = true,
    cost = 5,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            FlipCard(G.hand.cards[i], 'card1', percent)
        end
        local buffer = {}
        for i = 1, #G.hand.cards do
            table.insert(buffer, CARDMERGE.BufferTables(G.hand.cards[i]))
        end
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = G.hand.cards[i]
                    local next = (i % #buffer) + 1
                    local prev = ((i - 2) % #buffer) + 1
                    local _suit = CARDMERGE.SuitExtractor(buffer[next].suits)
                    local _rank = CARDMERGE.RankExtractor(buffer[prev].ranks)
                    assert(SMODS.change_base(_card, _suit, _rank))
                    if CARDMERGE.CheckIfVagueSuits(_card.base.suit) then
                        _card:set_suit_table(buffer[next].suits)
                    end
                    if CARDMERGE.CheckIfVagueRanks(_card.base.value) then
                        _card:set_rank_table(buffer[prev].ranks)
                    end
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            FlipCard(G.hand.cards[i], 'tarot2', percent, 0.6)
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,
}
