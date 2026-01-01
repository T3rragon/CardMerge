SMODS.Joker { -- Layered Joker
    key = "layered",
    atlas = 'jokers',
    pos = { x = 0, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 2,
    discovered = true,
    config = { extra = { mult = 3 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local amount = CARDMERGE.SuitAmount(context.other_card, true)
            return {
                mult = card.ability.extra.mult * amount
            }
        end
    end
}

SMODS.Joker { -- Yin Yang
    key = "yinyang",
    atlas = 'jokers',
    pos = { x = 1, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 2,
    discovered = true,
    config = { extra = { t_chips = 50, mult = 5 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_chips, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local suits = CARDMERGE.InitSuitTable(context.other_card)
            if (suits.Hearts or suits.Diamonds) and (suits.Spades or suits.Clubs) then
                return {
                    chips = card.ability.extra.t_chips,
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}

SMODS.Joker { -- Redundancy
    key = "redundant",
    atlas = 'jokers',
    pos = { x = 2, y = 0 },
    rarity = 2,
    blueprint_compat = true,
    cost = 6,
    discovered = true,
    config = { extra = { xmult = 1.5 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, colours = { G.C.CMERGE_OMNIS } } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_wild') and context.other_card.base.suit == 'cmerge_Omnis' then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
}

SMODS.Joker { -- Trail Mix
    key = "trailmix",
    atlas = 'jokers',
    pos = { x = 3, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    discovered = true,
    config = { extra = { mult = 3, poker_hand = 'High Card' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, localize(card.ability.extra.poker_hand, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if CARDMERGE.SuitAmount(context.other_card, true) > 1 and context.scoring_name == card.ability.extra.poker_hand then
                context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
                    card.ability.extra.mult
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local _poker_hands = {}
            for handname, _ in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
                    _poker_hands[#_poker_hands + 1] = handname
                end
            end
            card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'cmerge')
            return {
                message = localize('k_reset')
            }
        end
    end,
    set_ability = function(self, card, initial, delay_sprites)
        local _poker_hands = {}
        for handname, _ in pairs(G.GAME.hands) do
            if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
                _poker_hands[#_poker_hands + 1] = handname
            end
        end
        card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'cmerge')
    end
}

SMODS.Joker { -- Copper Relic
    key = "copperrelic",
    atlas = 'jokers',
    pos = { x = 4, y = 0 },
    rarity = 2,
    blueprint_compat = true,
    cost = 6,
    discovered = true,
    config = { extra = { suit1 = 'Diamonds', suit2 = 'Hearts', dollars = 3 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { localize(card.ability.extra.suit1, 'suits_singular'), localize(card.ability.extra.suit2, 'suits_singular'), card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local suits = CARDMERGE.InitSuitTable(context.other_card)
            if (suits.Hearts and suits.Diamonds) then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                return {
                    dollars = card.ability.extra.dollars,
                    func = function() -- This is for timing purposes, it runs after the dollar manipulation
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            end
        end
    end
}

SMODS.Joker { -- Relay System
    key = "relaysystem",
    atlas = 'jokers',
    pos = { x = 5, y = 0 },
    rarity = 3,
    blueprint_compat = true,
    cost = 7,
    discovered = true,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            local amount = CARDMERGE.SuitAmount(context.other_card, false)
            if amount ~= 0 then
                return {
                    repetitions = amount
                }
            end
        end
    end,
}

SMODS.Joker { -- Rule of Thirds
    key = "ruleofthirds",
    atlas = 'jokers',
    pos = { x = 6, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = { odds = 3 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'cmerge_ruleofthirds')
        return { vars = { numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local amount = CARDMERGE.SuitAmount(context.other_card, true)
            if amount == 3 and (context.other_card:get_id() == 3) and SMODS.pseudorandom_probability(card, 'cmerge_ruleofthirds', 1, card.ability.extra.odds) then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                return {
                    extra = {
                        message = localize('k_plus_tarot'),
                        message_card = card,
                        func = function() -- This is for timing purposes, everything here runs after the message
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    SMODS.add_card {
                                        set = 'Tarot',
                                        key_append = 'cmerge_ruleofthirds' -- Optional, useful for manipulating the random seed and checking the source of the creation in `in_pool`.
                                    }
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end)
                            }))
                        end
                    },
                }
            end
        end
    end
}

SMODS.Joker { -- Wallsocket
    key = "wallsocket",
    atlas = 'jokers',
    pos = { x = 0, y = 1 },
    rarity = 2,
    blueprint_compat = false,
    cost = 4,
    discovered = true,
    config = { extra = { dollars = 3 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, colours = { G.C.CMERGE_CRESCENTS } } }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local crescents = false
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card.base.suit == 'cmerge_Crescents' then
                    crescents = true
                    break
                end
            end
            if crescents then
                local faces = 0
                for _, scored_card in ipairs(context.scoring_hand) do
                    if scored_card:is_face() then
                        faces = faces + 1
                        assert(SMODS.change_base(scored_card, nil, 'Queen'))
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                scored_card:juice_up()
                                return true
                            end
                        }))
                    end
                end
                if faces > 0 then
                    G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                    return {
                        message = localize('k_cmerge_wallsocket'),
                        colour = G.C.MONEY,
                        dollars = card.ability.extra.dollars * faces,
                        func = function() -- This is for timing purposes, it runs after the dollar manipulation
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.dollar_buffer = 0
                                    return true
                                end
                            }))
                        end
                    }
                end
            end
        end
    end
}

SMODS.Joker { -- Dart Board
    key = "dartboard",
    atlas = 'jokers',
    pos = { x = 1, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    discovered = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local _card = context.other_card
            local ranks = CARDMERGE.RankAmount(_card, true)
            if ranks > 1 then
                local chosen_rank = pseudorandom_element(CARDMERGE.RankTableAsValues(_card), 'dartboard')
                return {
                    mult = chosen_rank
                }
            end
        end
    end
}

SMODS.Joker { -- Stacked Joker
    key = "stacked",
    atlas = 'jokers',
    pos = { x = 2, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = { chips = 15 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local amount = CARDMERGE.RankAmount(context.other_card, true)
            return {
                mult = card.ability.extra.chips * amount
            }
        end
    end
}

SMODS.Joker { -- Saving Grace
    key = "savinggrace",
    atlas = 'jokers',
    pos = { x = 3, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = { chips = 10, mult = 5 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if CARDMERGE.SuitAmount(context.other_card, false) == 0 or CARDMERGE.RankAmount(context.other_card, false) == 0 then
                context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
                    card.ability.extra.chips
                context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
                    card.ability.extra.mult
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            end
        end
    end
}

SMODS.Joker { -- Cloudflare
    key = "cloudflare",
    atlas = 'jokers',
    pos = { x = 4, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = { xmult = 1.5, odds = 4 }, },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'cloudflare')
        return { vars = { card.ability.extra.xmult, numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'cmerge_cloudflare', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_cmerge_cloudflare')
                }
            end
        end
        if context.individual and context.cardarea == G.play then
            local amount = CARDMERGE.RankAmount(context.other_card, true)
            if amount > 2 then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end,
}

SMODS.Joker { -- Pomni
    key = "pomni",
    atlas = 'jokers',
    pos = { x = 5, y = 1 },
    soul_pos = { x = 6, y = 1 },
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    discovered = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local amount = CARDMERGE.SuitAmount(context.other_card, true)
            if amount > 1 then
                return {
                    xmult = amount
                }
            end
        end
    end
}
