return {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("tokyonight").setup({
                styles = {
                    keywords = { italic = false },
                    comments = { italic = false },
                },
                transparent = false,
                on_colors = function(colors)
                    colors.bg = "#16161e"
                end,
            })

            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },
}
