CARDMERGE = { vars = {}, funcs = {}, content = SMODS.current_mod }

SMODS.Atlas {
    key = "modicon",
    path = "icon.png",
    px = 34,
    py = 34
}

SMODS.load_file("initialize.lua")()
SMODS.load_file("suit_inject.lua")()
SMODS.load_file("functions.lua")()

SMODS.load_file("items/tarots.lua")()
SMODS.load_file("items/spectrals.lua")()
SMODS.load_file("items/jokers.lua")()
SMODS.load_file("items/boosters.lua")()

SMODS.load_file("crossmod.lua")()
SMODS.load_file("menu.lua")()

function Card:suit_table()
    return self.ability.suit_table
end

function Card:set_suit_table(newTable)
    self.ability.suit_table = newTable
end

function Card:rank_table()
    return self.ability.rank_table
end

function Card:set_rank_table(newTable)
    self.ability.rank_table = newTable
end

local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    if not SMODS.has_no_suit(self) then
        local suitCheck = CARDMERGE.InitSuitTable(self)
        if suitCheck[suit] then
            return true
        end
    end
    return card_is_suit_ref(self, suit, bypass_debuff, flush_calc)
end

-- TODO: Replace these with proper hooks
CARDMERGE.HasRank = function(card, rank)
    if not SMODS.has_no_rank(card) then
        if card:get_id() == rank then return true end
        local rankCheck = CARDMERGE.InitRankTable(card)
        if rankCheck[rank] then
            return true
        end
    end
    return false
end

CARDMERGE.HasRanks = function(card, rankList)
    if rankList == nil or rankList == {} or type(rankList) ~= 'table' then return false end
    if not SMODS.has_no_rank(card) then
        local rankCheck = CARDMERGE.InitRankTable(card)
        for i = 1, #rankList do
            if rankCheck[tostring(rankList[i])] or card:get_id() == rankList[i] then
                return true
            end
        end
    end
    return false
end

local is_face_ref = Card.is_face
function Card:is_face()
    local rankCheck = CARDMERGE.InitRankTable(self)
    if not SMODS.has_no_rank(self) and CARDMERGE.TableAmount(rankCheck, false) > 1 then
        if rankCheck['11'] or rankCheck['12'] or rankCheck['13'] then
            return true
        end
    end
    return is_face_ref(self)
end
