if not SMODS.Attribute then return end

local boosters = {"symbol_pack_1", "symbol_pack_2", "symbol_pack_3", "symbol_pack_4", "jumbo_symbol_pack_1", "jumbo_symbol_pack_2", "mega_symbol_pack_1", "mega_symbol_pack_2"}

for k,v in pairs({"merged_rank", "merged_suit", "split_suit", "split_rank"}) do
	SMODS.Attribute {
		key = v,
		keys = boosters
	}
end