local enabled = false
if not enabled then
    return {}
end

return {
    {
        "nvim-lualine/lualine.nvim",
        enabled = true,
        config = function()
            require("lualine").setup({
                options = {
                    theme = "tokyonight",
                },
            })
        end,
    },
}
