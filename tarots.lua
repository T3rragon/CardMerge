SMODS.Atlas({ key = 'tarot', path = 'tarot.png', px = 65, py = 95 })
SMODS.Sound({ key = 'suit_merge', path = 'suit_merge.ogg' })
SMODS.Sound({ key = 'suit_slice', path = 'suit_slice.ogg' })
SMODS.Sound({ key = 'suit_flip', path = 'suit_flip.ogg' })

-- Merge
SMODS.Consumable {
    key = 'merge',
    set = 'Tarot',
    atlas = 'tarot',
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

                local abilityTable = CARDMERGE.MergeAbilityTables(G.hand.highlighted[1], G.hand.highlighted[2])
                local _card = copy_card(G.hand.highlighted[1], nil, nil, G.playing_card)
                _card = SMODS.change_base(_card, CARDMERGE.SuitExtractor(abilityTable))
                _card:add_to_deck()

                table.insert(G.playing_cards, _card)
                G.hand:emplace(_card)
                _card:start_materialize(nil, nil)
                local cards = { _card }
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                play_sound('cmerge_suit_merge', 1, 0.4)
                return true
            end,
        }))
        for i = 1, #G.hand.highlighted do
            SMODS.destroy_cards(G.hand.highlighted[i])
        end

        delay(0.5)
    end,
}

-- Slice
SMODS.Consumable {
    key = 'slice',
    set = 'Tarot',
    atlas = 'tarot',
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
                        local abilityTable = CARDMERGE.RemoveFromAbilityTable(leftmost, rightmost)
                        G.hand.highlighted[i] = SMODS.change_base(G.hand.highlighted[i], CARDMERGE.SuitExtractor(abilityTable))
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

-- Flip
SMODS.Consumable {
    key = 'flip',
    set = 'Tarot',
    atlas = 'tarot',
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
                    local abilityTable = CARDMERGE.FlipAbilityTable(G.hand.highlighted[i])
                    G.hand.highlighted[i] = SMODS.change_base(G.hand.highlighted[i], CARDMERGE.SuitExtractor(abilityTable))
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

-- Burn
SMODS.Consumable {
    key = 'burn',
    set = 'Tarot',
    atlas = 'tarot',
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
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    local edition = { nil, 'e_foil', 'e_holo', 'e_polychrome' }
                    local amount = CARDMERGE.SuitAmount(G.hand.highlighted[i], true)
                    local abilityTable = CARDMERGE.RandomFromAbilityTable(G.hand.highlighted[i])
                    G.hand.highlighted[i] = SMODS.change_base(G.hand.highlighted[i], CARDMERGE.SuitExtractor(abilityTable))
                    if amount > 1 then
                        G.hand.highlighted[i]:set_edition(edition[amount], false)
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