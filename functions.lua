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
    { name = 'cmerge_Cups',      suittable = { Hearts = true, Spades = true } },
    { name = 'cmerge_Trees',     suittable = { Diamonds = true, Spades = true } },
    { name = 'cmerge_Fires',     suittable = { Diamonds = true, Hearts = true, Spades = true } },
    { name = 'cmerge_Squids',    suittable = { Clubs = true, Spades = true } },
    { name = 'cmerge_Waters',    suittable = { Clubs = true, Hearts = true, Spades = true } },
    { name = 'cmerge_Earths',    suittable = { Clubs = true, Diamonds = true, Spades = true } },
    { name = 'cmerge_Omnis',     suittable = { Clubs = true, Diamonds = true, Hearts = true, Spades = true } }
}

CARDMERGE.rankBits = {
    { name = 'cmerge_Blank', ranktable = {} },
    { name = '2',            ranktable = { ['2'] = true } },
    { name = '3',            ranktable = { ['3'] = true } },
    { name = '4',            ranktable = { ['4'] = true } },
    { name = '5',            ranktable = { ['5'] = true } },
    { name = '6',            ranktable = { ['6'] = true } },
    { name = '7',            ranktable = { ['7'] = true } },
    { name = '8',            ranktable = { ['8'] = true } },
    { name = '9',            ranktable = { ['9'] = true } },
    { name = '10',           ranktable = { ['10'] = true } },
    { name = 'Jack',         ranktable = { ['11'] = true } },
    { name = 'Queen',        ranktable = { ['12'] = true } },
    { name = 'King',         ranktable = { ['13'] = true } },
    { name = 'Ace',          ranktable = { ['14'] = true } },
}

CARDMERGE.vagueSuits = {
    'cmerge_2suits',
    'cmerge_3suits',
    'cmerge_4suits',
    'cmerge_5suits',
    'cmerge_6suits',
    'cmerge_7suits',
    'cmerge_8suits',
    'cmerge_9suits',
    'cmerge_Ultras'
}

CARDMERGE.vagueRanks = {
    'cmerge_Double',
    'cmerge_Triple',
    'cmerge_Quadruple',
    'cmerge_Pentuple',
    'cmerge_Sextuple',
    'cmerge_Heptuple',
    'cmerge_Octuple',
    'cmerge_Nonuple',
    'cmerge_Decuple',
    'cmerge_Hendecuple',
    'cmerge_Dodecuple',
    'cmerge_Deck'
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
    output[suit] = true
    return output
end

---@param rank string
---@return table
--- Returns the rank table of a given rank.
CARDMERGE.SyncRankTable = function(rank)
    if rank == nil then return {} end
    for i = 1, #CARDMERGE.rankBits do
        if CARDMERGE.rankBits[i].name == rank then
            return CARDMERGE.rankBits[i].ranktable
        end
    end

    local output = {}
    output[rank] = true
    return output
end

--MARK: Extractors

---@param suitTable table
---@return string
--- Returns the given suit as a string, from a suit table.
CARDMERGE.SuitExtractor = function(suitTable)
    local suitAmount = CARDMERGE.TableAmount(suitTable, false)
    if suitAmount == 1 then
        local key, _ = next(suitTable)
        return key
    end

    for i = 1, #CARDMERGE.suitBits do
        if TableComp(suitTable, CARDMERGE.suitBits[i].suittable) then
            return CARDMERGE.suitBits[i].name
        end
    end

    if suitAmount > 9 then
        return 'cmerge_Ultras'
    end

    return CARDMERGE.vagueSuits[suitAmount - 1]
end

---@param rankTable table
---@return string
--- Returns the given rank as a string, from a rank table.
CARDMERGE.RankExtractor = function(rankTable)
    local rankAmount = CARDMERGE.TableAmount(rankTable, false)

    for i = 1, #CARDMERGE.rankBits do
        if TableComp(rankTable, CARDMERGE.rankBits[i].ranktable) then
            return CARDMERGE.rankBits[i].name
        end
    end

    if rankAmount > 12 then
        return 'cmerge_Deck'
    end

    return CARDMERGE.vagueRanks[rankAmount - 1]
end

-- code by TomatoCo on Reddit
function TableComp(a, b)
    if not a or not b or #a ~= #b then return false end
    for k, v in pairs(a) do
        if v ~= b[k] then return false end
    end
    return true
end

--MARK: Amounts

---@param card table | Card
---@param allowNones boolean
---@return number
--- Returns the amount of suits in a card.
--- If `allowNones` is true, returns 1 if the table is empty.
CARDMERGE.SuitAmount = function(card, allowNones)
    local table = CARDMERGE.InitSuitTable(card)
    return CARDMERGE.TableAmount(table, allowNones)
end

---@param card table | Card
---@param allowNones boolean
---@return number
--- Returns the amount of ranks in a card.
--- If `allowNones` is true, returns 1 if the table is empty.
CARDMERGE.RankAmount = function(card, allowNones)
    local table = CARDMERGE.InitRankTable(card)
    return CARDMERGE.TableAmount(table, allowNones)
end

---@param table table
---@param allowNones boolean
---@return number
--- Returns the amount of items in a keyed table.
--- If `allowNones` is true, returns 1 if the table is empty.
CARDMERGE.TableAmount = function(table, allowNones)
    local count = 0
    for _ in pairs(table) do count = count + 1 end

    if count == 0 and allowNones then return 1 end

    return count
end

--MARK: Inits

---@param card table | Card
---@return table
--- Returns the suit table of a card.
CARDMERGE.InitSuitTable = function(card)
    if not card:suit_table() or card:suit_table() == {} then
        if card.base.suit == 'cmerge_Nones' then
            return {}
        else
            local output = {}
            output[card.base.suit] = true
            return output
        end
    end

    return card:suit_table()
end

---@param card table | Card
---@return table
--- Returns the rank table of a card.
CARDMERGE.InitRankTable = function(card)
    if not card:rank_table() or card:rank_table() == {} then
        if SMODS.has_no_rank(card) then
            return {}
        else
            local output = {}
            output[card:get_id()] = true
            return output
        end
    end

    return card:rank_table()
end

--MARK: Merge Tables

function MergeTables(table1, table2)
    local output = {}
    for key, _ in pairs(table1) do
        output[key] = true
    end
    for key, _ in pairs(table2) do
        if not table1[key] then
            output[key] = true
        end
    end
    return output
end

---@param card1 table | Card
---@param card2 table | Card
---@return table
--- Returns the combined suit table of two cards.
CARDMERGE.MergeSuitTables = function(card1, card2)
    local suitTable1 = CARDMERGE.InitSuitTable(card1)
    local suitTable2 = CARDMERGE.InitSuitTable(card2)

    return MergeTables(suitTable1, suitTable2)
end

---@param card1 table | Card
---@param card2 table | Card
---@return table
--- Returns the combined rank table of two cards.
CARDMERGE.MergeRankTables = function(card1, card2)
    local rankTable1 = CARDMERGE.InitRankTable(card1)
    local rankTable2 = CARDMERGE.InitRankTable(card2)

    return MergeTables(rankTable1, rankTable2)
end

--MARK: Remove from Table

function RemoveFromTable(table1, table2)
    local output = {}
    for key, _ in pairs(table1) do
        if not table2[key] then
            output[key] = true
        end
    end
    return output
end

---@param basecard table | Card
---@param remover table | Card
---@return table
--- Returns the suit table of the first card, minus the suit table of the second card.
CARDMERGE.RemoveFromSuitTable = function(basecard, remover)
    local baseCardTable = CARDMERGE.InitSuitTable(basecard)
    local removerTable = CARDMERGE.InitSuitTable(remover)

    return RemoveFromTable(baseCardTable, removerTable)
end

---@param basecard table | Card
---@param remover table | Card
---@return table
--- Returns the rank table of the first card, minus the rank table of the second card.
CARDMERGE.RemoveFromRankTable = function(basecard, remover)
    local baseCardTable = CARDMERGE.InitRankTable(basecard)
    local removerTable = CARDMERGE.InitRankTable(remover)

    return RemoveFromTable(baseCardTable, removerTable)
end

--MARK: Flip

---@param card table | Card
---@return table
--- Returns the suit table of a card, flipped.
CARDMERGE.FlipSuitTable = function(card)
    local suitTable = CARDMERGE.InitSuitTable(card)

    local vanillaSuits = { 'Clubs', 'Diamonds', 'Hearts', 'Spades' }
    local combined_table = {}

    for _, value in pairs(vanillaSuits) do
        if not suitTable[value] then
            combined_table[value] = true
        end
    end

    return combined_table
end

--MARK: Random

---@param card table | Card
---@return table
--- Returns a random element from the suit table of a card.
CARDMERGE.RandomFromSuitTable = function(card)
    local suitTable = CARDMERGE.SuitTableAsValues(card)
    local output = {}

    output[pseudorandom_element(suitTable, 'cmerge')] = true

    return output
end

---@param card table | Card
---@return table
--- Returns a random element from the suit table of a card.
CARDMERGE.RandomFromRankTable = function(card)
    local rankTable = CARDMERGE.RankTableAsValues(card)
    local output = {}

    output[pseudorandom_element(rankTable, 'cmerge')] = true

    return output
end

---@return table
--- Returns a random suit table.
CARDMERGE.RandomizeSuitTable = function()
    local suitTable = {}
    local trueFalse = { true, false }

    if pseudorandom_element(trueFalse, 'Clubs') then
        suitTable['Clubs'] = true
    end
    if pseudorandom_element(trueFalse, 'Diamonds') then
        suitTable['Diamonds'] = true
    end
    if pseudorandom_element(trueFalse, 'Hearts') then
        suitTable['Hearts'] = true
    end
    if pseudorandom_element(trueFalse, 'Spades') then
        suitTable['Spades'] = true
    end

    return suitTable
end

---@return table
--- Returns a random rank table.
CARDMERGE.RandomizeRankTable = function()
    local suitTable = {}
    local trueFalse = { true, false }

    for i = 2,14,1 do
        if pseudorandom_element(trueFalse, "cmerge_rank") then
            suitTable[i] = true
        end
        if #suitTable > 5 then break end
    end

    return suitTable
end

--MARK: Table As Values

function TableAsValues(input)
    local seen = {}
    if input then
        for key, _ in pairs(input) do
            table.insert(seen, key)
        end
    end
    return seen
end

---@param card table | Card
---@return table
--- Returns the values of the suit table of a card.
CARDMERGE.SuitTableAsValues = function(card)
    return TableAsValues(CARDMERGE.InitSuitTable(card))
end

---@param card table | Card
---@return table
--- Returns the values of the rank table of a card.
CARDMERGE.RankTableAsValues = function(card, formal)
    formal = formal or false
    local output = TableAsValues(CARDMERGE.InitRankTable(card))
    if formal then
        local rankTable = { nil, '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'}
        for i = 1, #output do
            output[i] = rankTable[i]
        end
    end
    return output
end

--MARK: Checks

CARDMERGE.CheckIfVagueSuits = function(suit)
    for i = 1, #CARDMERGE.vagueSuits do
        if suit == CARDMERGE.vagueSuits[i] then
            return true
        end
    end
    return false
end

CARDMERGE.CheckIfVagueRanks = function(rank)
    for i = 1, #CARDMERGE.vagueRanks do
        if rank == CARDMERGE.vagueRanks[i] then
            return true
        end
    end
    return false
end

-- TODO: MAKE THIS LESS JANK
CARDMERGE.PrematureMergeCheck = function(card)
    local _rank, _suit
    for k, v in pairs(SMODS.Ranks) do
        if card.value == SMODS.Ranks[k].key then
            if k:find('cmerge_') then
                _rank = pseudorandom_element({ '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A' },
                    pseudoseed('cmerge_check'))
                print("INVALID RANK UPON CREATION: "..SMODS.Ranks[k].card_key..", CHANGED TO ".._rank)
            else
                _rank = SMODS.Ranks[k].card_key
            end
            break
        end
    end
    for k, v in pairs(SMODS.Suits) do
        if card.suit == SMODS.Suits[k].key then
            if k:find('cmerge_') then
                _suit = pseudorandom_element({ 'S', 'H', 'D', 'C' }, pseudoseed('cmerge_check'))
                print("INVALID SUIT UPON CREATION: "..SMODS.Suits[k].card_key..", CHANGED TO ".._suit)
            else
                _suit = SMODS.Suits[k].card_key
            end
            break
        end
    end
    return G.P_CARDS[_suit..'_'.._rank]
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

CARDMERGE.BufferTables = function(card)
    local suitTable = CARDMERGE.InitSuitTable(card)
    local rankTable = CARDMERGE.InitRankTable(card)
    local output = {
        suits = {},
        ranks = {}
    }

    for key, _ in pairs(suitTable) do
        output.suits[key] = true
    end
    for key, _ in pairs(rankTable) do
        output.ranks[key] = true
    end

    return output
end