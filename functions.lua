-- All relevant functions for suit manupulation will be stored here
-- Feel free to incorporate them into your mod for cross-mod compatability
-- Functions for hooking will be coming later

--- @type table[]
--- A list of suits, ordered in a bit-like order.
---
--- `Hearts` = 0001
---
--- `Diamonds` = 0010
---
--- `Clubs` = 0100
---
--- `Spades` = 1000
CARDMERGE.suitBits = {
    { name = 'cmerge_Nones',     suittable = {} },
    { name = 'Hearts',           suittable = { Hearts = true } },
    { name = 'Diamonds',         suittable = { Diamonds = true } },
    { name = 'cmerge_Metals',    suittable = { Diamonds = true, Hearts = true } },
    { name = 'Clubs',            suittable = { Clubs = true } },
    { name = 'cmerge_Crescents', suittable = { Clubs = true, Hearts = true } },
    { name = 'cmerge_Suns',      suittable = { Clubs = true, Diamonds = true } },
    { name = 'cmerge_Airs',      suittable = { Clubs = true, Diamonds = true, Hearts = true } },
    { name = 'Spades',           suittable = { Spades = true } },
    { name = 'cmerge_Cups',      suittable = { Spades = true, Hearts = true } },
    { name = 'cmerge_Kites',     suittable = { Spades = true, Diamonds = true } },
    { name = 'cmerge_Fires',     suittable = { Spades = true, Diamonds = true, Hearts = true } },
    { name = 'cmerge_Squids',    suittable = { Spades = true, Clubs = true } },
    { name = 'cmerge_Waters',    suittable = { Spades = true, Clubs = true, Hearts = true } },
    { name = 'cmerge_Earths',    suittable = { Spades = true, Clubs = true, Diamonds = true } },
    { name = 'cmerge_Omnis',     suittable = { Spades = true, Clubs = true, Diamonds = true, Hearts = true } }
}

---@param suit string
---@return table
--- Returns the suit table of a given suit.
CARDMERGE.SyncSuitTable = function(suit)
    if suit == nil then return {} end
    for i = 1, #CARDMERGE.suitBits do
        if CARDMERGE.suitBits[i].name == suit then
            return CARDMERGE.suitBits[i].suittable
        end
    end

    local output = {}
    output[card.base.suit] = true
    return output
end

---@param table table
---@return string
--- Returns the given suit as a string, from a suit table.
CARDMERGE.SuitExtractor = function(table)
    local output = 1
    if table.Hearts then output = output + 1 end
    if table.Diamonds then output = output + 2 end
    if table.Clubs then output = output + 4 end
    if table.Spades then output = output + 8 end

    return CARDMERGE.suitBits[output].name
end

---@param card table | Card
---@param allowNones boolean
---@return number
--- Returns the amount of suits in a card.
--- If `allowNones` is true, returns 1 if the table is empty.
CARDMERGE.SuitAmount = function(card, allowNones)
    local table = CARDMERGE.InitAbilityTable(card)

    local count = 0
    for _ in pairs(table) do count = count + 1 end

    if count == 0 and allowNones then return 1 end

    return count
end

---@param card table | Card
---@return table
--- Returns the suit table of a card.
CARDMERGE.InitAbilityTable = function(card)
    if not card.ability.suit_table or card.ability.suit_table == {} then
        if card.base.suit == 'cmerge_Nones' then
            return {}
        else
            local output = {}
            output[card.base.suit] = true
            return output
        end
    end

    return card.ability.suit_table
end

---@param card1 table | Card
---@param card2 table | Card
---@return table
--- Returns the combined suit table of two cards.
CARDMERGE.MergeAbilityTables = function(card1, card2)
    local suitTable1 = CARDMERGE.InitAbilityTable(card1)
    local suitTable2 = CARDMERGE.InitAbilityTable(card2)

    local combined_table = {}

    if suitTable1 then
        for key, _ in pairs(suitTable1) do
            if not combined_table[key] then
                combined_table[key] = true
            end
        end
    end

    if suitTable2 then
        for key, _ in pairs(suitTable2) do
            if not combined_table[key] then
                combined_table[key] = true
            end
        end
    end

    return combined_table
end

---comment
---@param basecard table | Card
---@param remover table | Card
---@return table
--- Returns the suit table of the first card, minus the suit table of the second card.
CARDMERGE.RemoveFromAbilityTable = function(basecard, remover)
    local baseCardTable = CARDMERGE.InitAbilityTable(basecard)
    local removerTable = CARDMERGE.InitAbilityTable(remover)

    local combined_table = {}
    local seen = {}

    if removerTable then
        for key, _ in pairs(removerTable) do
            if not seen[key] then
                seen[key] = true
            end
        end
    end

    if baseCardTable then
        for key, _ in pairs(baseCardTable) do
            if not seen[key] then
                combined_table[key] = true
            end
        end
    end

    return combined_table
end

---@param card table | Card
---@return table
--- Returns the suit table of a card, flipped.
CARDMERGE.FlipAbilityTable = function(card)
    local suitTable = CARDMERGE.InitAbilityTable(card)

    local vanillaSuits = { 'Hearts', 'Diamonds', 'Clubs', 'Spades' }
    local combined_table = {}
    local seen = {}

    if suitTable then
        for key, _ in pairs(suitTable) do
            if not seen[key] then
                seen[key] = true
            end
        end
    end

    for _, value in pairs(vanillaSuits) do
        if not seen[value] then
            combined_table[value] = true
        end
    end

    return combined_table
end

---@param card table | Card
---@return table
--- Returns a random element from the suit table of a card.
CARDMERGE.RandomFromAbilityTable = function(card)
    local suitTable = CARDMERGE.AbilityTableAsValues(card)
    local output = {}

    output[pseudorandom_element(suitTable, 'cmerge')] = true

    return output
end

---@return table
--- Returns a random suit table.
CARDMERGE.RandomizeAbilityTable = function()
    local suitTable = {}
    local trueFalse = { true, false }

    if pseudorandom_element(trueFalse, 'Hearts') then
        suitTable['Hearts'] = true
    end
    if pseudorandom_element(trueFalse, 'Diamonds') then
        suitTable['Diamonds'] = true
    end
    if pseudorandom_element(trueFalse, 'Clubs') then
        suitTable['Clubs'] = true
    end
    if pseudorandom_element(trueFalse, 'Spades') then
        suitTable['Spades'] = true
    end

    return suitTable
end

CARDMERGE.AbilityTableAsValues = function(card)
    local suitTable = CARDMERGE.InitAbilityTable(card)

    local seen = {}

    if suitTable then
        for key, _ in pairs(suitTable) do
            table.insert(seen, key)
        end
    end

    return seen
end

function FlipCard(card, sound, percent, volume)
    if not volume then volume = 1.0 end
    return G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            card:flip()
            play_sound(sound, percent, volume)
            card:juice_up(0.3, 0.3)
            return true
        end
    }))
end
