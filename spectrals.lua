SMODS.Atlas({ key = 'spectral', path = 'spectral.png', px = 71, py = 95 })

-- Scatter
SMODS.Consumable {
    key = 'scatter',
    set = 'Spectral',
    atlas = 'spectral',
    pos = { x = 0, y = 0 },
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
                    _card.ability.suit_table = CARDMERGE.RandomizeAbilityTable()
                    local _suit = CARDMERGE.SuitExtractor(_card.ability.suit_table)
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

-- Inspire
SMODS.Consumable {
    key = 'inspire',
    set = 'Spectral',
    atlas = 'spectral',
    pos = { x = 1, y = 0 },
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
                    local abilityTable = CARDMERGE.MergeAbilityTables(G.hand.cards[i], G.hand.highlighted[1])
                    assert(SMODS.change_base(_card, CARDMERGE.SuitExtractor(abilityTable)))
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

-- Null
SMODS.Consumable {
    key = 'null',
    set = 'Spectral',
    atlas = 'spectral',
    pos = { x = 2, y = 0 },
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
                    local abilityTable = CARDMERGE.RemoveFromAbilityTable(_card, tableMerger)
                    assert(SMODS.change_base(_card, CARDMERGE.SuitExtractor(abilityTable)))
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

-- Ritual
SMODS.Consumable {
    key = 'ritual',
    set = 'Spectral',
    atlas = 'spectral',
    pos = { x = 3, y = 0 },
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
