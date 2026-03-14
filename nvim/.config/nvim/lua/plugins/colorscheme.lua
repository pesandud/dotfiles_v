return {
    {
        "folke/tokyonight.nvim",
        enabled = false,
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("tokyonight").setup({
                styles = {
                    keywords = { italic = false },
                },
                transparent = true,
                on_colors = function(colors)
                    colors.bg = "#16161e"
                end,
            })

            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },
    {
        "tiagovla/tokyodark.nvim",
        opts = {
            transparent_background = true, -- set background to transparent
            gamma = 1.00, -- adjust the brightness of the theme
            styles = {
                comments = { italic = true }, -- style for comments
                keywords = { italic = false }, -- style for keywords
                identifiers = { italic = false }, -- style for identifiers
                functions = { italic = false }, -- style for functions
                variables = { italic = false }, -- style for variables
            },
            custom_highlights = {} or function(highlights, palette)
                return {}
            end, -- extend highlights
            custom_palette = {} or function(palette)
                return {}
            end, -- extend palette
            terminal_colors = true, -- enable terminal colors
        },
        config = function(_, opts)
            require("tokyodark").setup(opts) -- calling setup is optional
            vim.cmd([[colorscheme tokyodark]])
        end,
    },
}
