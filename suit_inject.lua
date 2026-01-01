SMODS.Atlas({ key = 'cmerge_suits_vague_ranks', path = 'suit_vague_rank.png', px = 71, py = 95 })
SMODS.Atlas({ key = 'cmerge_vague_suits_vague_ranks', path = 'vague_suits_vague_ranks.png', px = 71, py = 95 })

local vanilla_suits = { Clubs = true, Diamonds = true, Hearts = true, Spades = true }
CARDMERGE.extra_suits = {}

for i = 1, #CARDMERGE.cmergeSuits do
    CARDMERGE.extra_suits["cmerge_"..CARDMERGE.cmergeSuits[i].name] = {
        lc_atlas = 'cmerge_suits_vague_ranks',
        hc_atlas = 'cmerge_suits_vague_ranks'
    }
end
for i = 1, #CARDMERGE.cmergeVagueSuits do
    CARDMERGE.extra_suits["cmerge_"..CARDMERGE.cmergeVagueSuits[i].name] = {
        lc_atlas = 'cmerge_vague_suits_vague_ranks',
        hc_atlas = 'cmerge_vague_suits_vague_ranks'
    }
end
for k, v in pairs(CARDMERGE.extra_suits) do
	print("Item: "..k)
end

--Suit injection code based on Showdown by Mistyk__
local function inject_p_card_suit_compat(suit, rank)
	local card = {
		name = rank.key .. ' of ' .. suit.key,
		value = rank.key,
		suit = suit.key,
		pos = { x = rank.pos.x, y = rank.suit_map[suit.key] or suit.pos.y },
		lc_atlas = rank.suit_map[suit.key] and rank.lc_atlas or suit.lc_atlas,
		hc_atlas = rank.suit_map[suit.key] and rank.hc_atlas or suit.hc_atlas,
	}
	if not vanilla_suits[card.suit] then
		if not CARDMERGE.extra_suits[card.suit] then
			print("Warning: Unknown suit for "..card.name)
			card.lc_atlas = 'cmerge_suits_vague_ranks'
			card.hc_atlas = 'cmerge_suits_vague_ranks'
			card.pos.y = 11
		else
			card.lc_atlas = CARDMERGE.extra_suits[card.suit].lc_atlas
			card.hc_atlas = CARDMERGE.extra_suits[card.suit].hc_atlas
		end
	end
	G.P_CARDS[suit.card_key .. '_' .. rank.card_key] = card
end

local function rank_injection(self)
	print("Performing extra rank injection")
	for _, suit in pairs(SMODS.Suits) do
		inject_p_card_suit_compat(suit, self)
	end
end

--Injected Rank List, will loop over all possible ranks
--table: key = rank_key, pos_x = rank's x position
local inject_rank_list = {}

local function inject_rank_atlas(prefix)
	for k,v in pairs(SMODS.Ranks) do
		if k:find(prefix) then
			local rank = SMODS.Ranks[k]
			
			rank.inject = rank_injection
			
			inject_rank_list[#inject_rank_list+1] = {key = k, pos_x = rank.pos.x}

			print("Injecting the graphic for rank "..rank.key)
		end
	end
end

inject_rank_atlas('cmerge_')