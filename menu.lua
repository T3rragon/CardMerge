SMODS.current_mod.extra_tabs = function()
    local text_scale = 0.6
    return {
        {
            label = G.localization.misc.dictionary.b_credits,
            tab_definition_function = function()
                return {
                    n = G.UIT.ROOT,
                    config = { r = 0.1, minw = 4, align = "tm", padding = 0.2, colour = G.C.BLACK },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "cm", padding = 0.1, outline_colour = G.C.JOKER_GREY, r = 0.1, outline = 1 },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = G.localization.misc.dictionary.b_credits, scale = text_scale, colour = G.C.ORANGE, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0.1 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "", scale = text_scale * 0.4, colour = G.C.WHITE, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "Joker Design assistance:", scale = text_scale * 0.75, colour = G.C.WHITE, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "Jimbo Joshua Jokkeman", scale = text_scale * 0.8, colour = G.C.GREEN, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0.1 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "", scale = text_scale * 0.4, colour = G.C.WHITE, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "Sound Design assistance:", scale = text_scale * 0.75, colour = G.C.WHITE, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "Superb Thing", scale = text_scale * 0.8, colour = G.C.GREEN, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0.1 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "", scale = text_scale * 0.4, colour = G.C.WHITE, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "Special Thanks:", scale = text_scale * 0.75, colour = G.C.WHITE, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "novix, travelmydog, jamirror, thefastrunners,", scale = text_scale * 0.75, colour = G.C.BLUE, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "TheNewStone1000, Bunnet, and YOU!", scale = text_scale * 0.75, colour = G.C.BLUE, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "This mod would not have been possible without all the support! Thank you.", scale = text_scale * 0.6, colour = G.C.WHITE, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0.1 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "", scale = text_scale * 0.4, colour = G.C.WHITE, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "Wallsocket Joker skin sourced from: underscores, Mom+Pop records", scale = text_scale * 0.5, colour = G.C.WHITE, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "Cloudflare logo sourced from: CloudFlare Inc.", scale = text_scale * 0.5, colour = G.C.WHITE, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "Pomni Joker skin sourced from: The Amazing Digital Circus, Gooseworx, Glitch prod.", scale = text_scale * 0.5, colour = G.C.WHITE, shadow = true } },
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", padding = 0 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = "All rights reserved to the respective owners", scale = text_scale * 0.5, colour = G.C.WHITE, shadow = true } },
                                    }
                                },
                            }
                        }
                    }
                }
            end,
        }
    }
end
