SMODS.Consumable { -- Merge Suit
    key = 'mergesuit',
    set = 'Tarot',
    atlas = 'consumeables',
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    cost = 3,
    config = { max_highlighted = 2, min_highlighted = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            FlipCard(G.hand.highlighted[i], 'card1', percent)
        end
        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1

                local suitTable = CARDMERGE.MergeSuitTables(G.hand.highlighted[1], G.hand.highlighted[2])
                local _card = copy_card(G.hand.highlighted[1], nil, nil, G.playing_card)
                _card = SMODS.change_base(_card, CARDMERGE.SuitExtractor(suitTable))
                if CARDMERGE.CheckIfVagueSuits(_card.base.suit) then
                    _card:set_suit_table(suitTable)
                end
                local suitAmount = CARDMERGE.SuitAmount(_card, true)
                _card:add_to_deck()

                table.insert(G.playing_cards, _card)
                G.hand:emplace(_card)
                _card:start_materialize(nil, nil)
                local cards = { _card }
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                if suitAmount > 2 then
                    play_sound('cmerge_suit_merge_super', 1, 0.4)
                elseif suitAmount > 3 then
                    play_sound('cmerge_suit_merge_hyper', 1, 0.4)
                else
                    play_sound('cmerge_suit_merge', 1, 0.4)
                end
                return true
            end,
        }))
        for i = 1, #G.hand.highlighted do
            SMODS.destroy_cards(G.hand.highlighted[i])
        end

        delay(0.5)
    end,
}

SMODS.Consumable { -- Slice Suit
    key = 'slicesuit',
    set = 'Tarot',
    atlas = 'consumeables',
    pos = { x = 1, y = 0 },
    unlocked = true,
    discovered = true,
    cost = 3,
    config = { max_highlighted = 2, min_highlighted = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            FlipCard(G.hand.highlighted[i], 'card1', percent)
        end
        delay(0.2)
        local rightmost = G.hand.highlighted[1]
        local leftmost = G.hand.highlighted[1]
        for i = 1, #G.hand.highlighted do
            if G.hand.highlighted[i].T.x > rightmost.T.x then
                rightmost = G.hand.highlighted[i]
            else
                leftmost = G.hand.highlighted[i]
            end
        end
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if G.hand.highlighted[i] ~= rightmost then
                        local suitTable = CARDMERGE.RemoveFromSuitTable(leftmost, rightmost)
                        G.hand.highlighted[i] = SMODS.change_base(G.hand.highlighted[i],
                            CARDMERGE.SuitExtractor(suitTable))
                        if CARDMERGE.CheckIfVagueSuits(G.hand.highlighted[i].base.suit) then
                            G.hand.highlighted[i]:set_suit_table(suitTable)
                        end
                    end
                    return true
                end
            }))
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
    end,
}

SMODS.Consumable { -- Flip
    key = 'flip',
    set = 'Tarot',
    atlas = 'consumeables',
    pos = { x = 2, y = 0 },
    unlocked = true,
    discovered = true,
    cost = 3,
    config = { max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            FlipCard(G.hand.highlighted[i], 'card1', percent)
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    local suitTable = CARDMERGE.FlipSuitTable(G.hand.highlighted[i])
                    G.hand.highlighted[i] = SMODS.change_base(G.hand.highlighted[i],
                        CARDMERGE.SuitExtractor(suitTable))
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.0,
            func = function()
                play_sound('cmerge_suit_flip', 1, 0.4)
                return true
            end
        }))
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
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable { -- Burn
    key = 'burn',
    set = 'Tarot',
    atlas = 'consumeables',
    pos = { x = 3, y = 0 },
    unlocked = true,
    discovered = true,
    cost = 4,
    config = { max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            FlipCard(G.hand.highlighted[i], 'card1', percent)
        end
        delay(0.1)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('cmerge_suit_burn', 1, 0.4)
                return true
            end
        }))
        delay(0.1)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    local edition = { nil, 'e_foil', 'e_holo', 'e_polychrome' }
                    local amount = CARDMERGE.SuitAmount(G.hand.highlighted[i], true)
                    local suitTable = CARDMERGE.RandomFromSuitTable(G.hand.highlighted[i])
                    G.hand.highlighted[i] = SMODS.change_base(G.hand.highlighted[i],
                        CARDMERGE.SuitExtractor(suitTable))
                    if amount > 1 then
                        G.hand.highlighted[i]:set_edition(edition[math.min(amount, 4)], false)
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
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable { -- Merge Rank
    key = 'mergerank',
    set = 'Tarot',
    atlas = 'consumeables',
    pos = { x = 0, y = 1 },
    unlocked = true,
    discovered = true,
    cost = 3,
    config = { max_highlighted = 2, min_highlighted = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            FlipCard(G.hand.highlighted[i], 'card1', percent)
        end
        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1

                local rankTable = CARDMERGE.MergeRankTables(G.hand.highlighted[1], G.hand.highlighted[2])
                local _card = copy_card(G.hand.highlighted[1], nil, nil, G.playing_card)
                _card = SMODS.change_base(_card, nil, CARDMERGE.RankExtractor(rankTable))
                if CARDMERGE.CheckIfVagueRanks(_card.base.value) then
                    _card:set_rank_table(rankTable)
                end
                _card:add_to_deck()

                table.insert(G.playing_cards, _card)
                G.hand:emplace(_card)
                _card:start_materialize(nil, nil)
                local cards = { _card }
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                play_sound('cmerge_rank_merge', 1, 0.4)
                return true
            end,
        }))
        for i = 1, #G.hand.highlighted do
            SMODS.destroy_cards(G.hand.highlighted[i])
        end

        delay(0.5)
    end,
}

SMODS.Consumable { -- Slice Rank
    key = 'slicerank',
    set = 'Tarot',
    atlas = 'consumeables',
    pos = { x = 3, y = 1 },
    unlocked = true,
    discovered = true,
    cost = 3,
    config = { max_highlighted = 2, min_highlighted = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            FlipCard(G.hand.highlighted[i], 'card1', percent)
        end
        delay(0.2)
        local rightmost = G.hand.highlighted[1]
        local leftmost = G.hand.highlighted[1]
        for i = 1, #G.hand.highlighted do
            if G.hand.highlighted[i].T.x > rightmost.T.x then
                rightmost = G.hand.highlighted[i]
            else
                leftmost = G.hand.highlighted[i]
            end
        end
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if G.hand.highlighted[i] ~= rightmost then
                        local rankTable = CARDMERGE.RemoveFromRankTable(leftmost, rightmost)
                        G.hand.highlighted[i] = SMODS.change_base(G.hand.highlighted[i], nil,
                            CARDMERGE.RankExtractor(rankTable))
                        if CARDMERGE.CheckIfVagueRanks(G.hand.highlighted[i].base.value) then
                            G.hand.highlighted[i]:set_rank_table(rankTable)
                        end
                    end
                    return true
                end
            }))
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
    end,
}

local gainValues = {
    { key = 'gainspades',   suit = 'Spades' },
    { key = 'gainhearts',   suit = 'Hearts' },
    { key = 'gainclubs',    suit = 'Clubs' },
    { key = 'gaindiamonds', suit = 'Diamonds' }
}
for j = 1, #gainValues do
    SMODS.Consumable { -- Gains
        key = gainValues[j].key,
        set = 'Tarot',
        atlas = 'consumeables',
        pos = { x = 3 + j, y = 0 },
        unlocked = true,
        discovered = true,
        cost = 3,
        config = { max_highlighted = 2 },
        loc_vars = function(self, info_queue, card)
            return { vars = { card.ability.max_highlighted } }
        end,
        use = function(self, card, area, copier)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                FlipCard(G.hand.highlighted[i], 'card1', percent)
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        local suitTable = G.hand.highlighted[i]:suit_table()
                        suitTable[gainValues[j].suit] = true
                        G.hand.highlighted[i] = SMODS.change_base(G.hand.highlighted[i],
                            CARDMERGE.SuitExtractor(suitTable))
                        if CARDMERGE.CheckIfVagueSuits(G.hand.highlighted[i].base.suit) then
                            G.hand.highlighted[i]:set_suit_table(suitTable)
                        end
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.0,
                func = function()
                    play_sound('cmerge_suit_merge', 1, 0.4)
                    return true
                end
            }))
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
        end,
        can_use = function(self, card)
            return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
        end
    }
end

SMODS.Consumable { -- Add
    key = 'add',
    set = 'Tarot',
    atlas = 'consumeables',
    pos = { x = 1, y = 1 },
    unlocked = true,
    discovered = true,
    cost = 3,
    config = { max_highlighted = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            FlipCard(G.hand.highlighted[i], 'card1', percent)
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    local rankTable = G.hand.highlighted[i]:rank_table()
                    rankTable[pseudorandom_element({ '2', '3', '4', '5', '6', '7', '8', '9', '10', '14' },
                        pseudoseed('cmerge_add'))] = true
                    G.hand.highlighted[i] = SMODS.change_base(G.hand.highlighted[i], nil,
                        CARDMERGE.RankExtractor(rankTable))
                    if CARDMERGE.CheckIfVagueRanks(G.hand.highlighted[i].base.value) then
                        G.hand.highlighted[i]:set_rank_table(rankTable)
                    end
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.0,
            func = function()
                play_sound('cmerge_suit_merge', 1, 0.4)
                return true
            end
        }))
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
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable { -- Promote
    key = 'promote',
    set = 'Tarot',
    atlas = 'consumeables',
    pos = { x = 2, y = 1 },
    unlocked = true,
    discovered = true,
    cost = 3,
    config = { max_highlighted = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            FlipCard(G.hand.highlighted[i], 'card1', percent)
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    local rankTable = G.hand.highlighted[i]:rank_table()
                    rankTable[pseudorandom_element({ '11', '12', '13' },
                        pseudoseed('cmerge_promote'))] = true
                    G.hand.highlighted[i] = SMODS.change_base(G.hand.highlighted[i], nil,
                        CARDMERGE.RankExtractor(rankTable))
                    if CARDMERGE.CheckIfVagueRanks(G.hand.highlighted[i].base.value) then
                        G.hand.highlighted[i]:set_rank_table(rankTable)
                    end
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.0,
            func = function()
                play_sound('cmerge_suit_merge', 1, 0.4)
                return true
            end
        }))
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
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable { -- Trade
    key = 'trade',
    set = 'Tarot',
    atlas = 'consumeables',
    pos = { x = 4, y = 1 },
    unlocked = true,
    discovered = true,
    cost = 4,
    config = { max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            FlipCard(G.hand.highlighted[i], 'card1', percent)
        end
        delay(0.1)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('cmerge_suit_burn', 1, 0.4)
                return true
            end
        }))
        delay(0.1)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    local edition = { nil, 'Purple', 'Purple', 'Blue', 'Blue', 'Gold', 'Gold', 'Red' }
                    local amount = CARDMERGE.RankAmount(G.hand.highlighted[i], true)
                    local rankTable = CARDMERGE.RandomFromRankTable(G.hand.highlighted[i])
                    print(rankTable)
                    G.hand.highlighted[i] = SMODS.change_base(G.hand.highlighted[i], nil,
                        CARDMERGE.RankExtractor(rankTable))
                    if amount > 1 then
                        G.hand.highlighted[i]:set_seal(edition[math.min(amount, 7)], false, true)
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
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}
