SMODS.Atlas({ key = 'solo_suits', path = 'crossmod/AKIRS_solo_suits.png', px = 71, py = 95 })

if AKYRS then
    local other_mods_suit_to_atlas_ref = AKYRS.other_mods_suit_to_atlas
    function AKYRS:other_mods_suit_to_atlas(suit_key, card)
        local trueKey = suit_key.base.suit
        if trueKey == "cmerge_Trees" then
            return G.ASSET_ATLAS['cmerge_solo_suits'], { x = 0, y = 0 }
        end
        if trueKey == "cmerge_Suns" then
            return G.ASSET_ATLAS['cmerge_solo_suits'], { x = 1, y = 0 }
        end
        if trueKey == "cmerge_Cups" then
            return G.ASSET_ATLAS['cmerge_solo_suits'], { x = 2, y = 0 }
        end
        if trueKey == "cmerge_Squids" then
            return G.ASSET_ATLAS['cmerge_solo_suits'], { x = 3, y = 0 }
        end
        if trueKey == "cmerge_Crescents" then
            return G.ASSET_ATLAS['cmerge_solo_suits'], { x = 4, y = 0 }
        end
        if trueKey == "cmerge_Metals" then
            return G.ASSET_ATLAS['cmerge_solo_suits'], { x = 5, y = 0 }
        end
        if trueKey == "cmerge_Waters" then
            return G.ASSET_ATLAS['cmerge_solo_suits'], { x = 6, y = 0 }
        end
        if trueKey == "cmerge_Earths" then
            return G.ASSET_ATLAS['cmerge_solo_suits'], { x = 7, y = 0 }
        end
        if trueKey == "cmerge_Fires" then
            return G.ASSET_ATLAS['cmerge_solo_suits'], { x = 8, y = 0 }
        end
        if trueKey == "cmerge_Airs" then
            return G.ASSET_ATLAS['cmerge_solo_suits'], { x = 9, y = 0 }
        end
        if trueKey == "cmerge_Omnis" then
            return G.ASSET_ATLAS['cmerge_solo_suits'], { x = 10, y = 0 }
        end
        return other_mods_suit_to_atlas_ref(self, suit, bypass_debuff, flush_calc)
    end
end
