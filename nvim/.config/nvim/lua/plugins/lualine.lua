local enabled = false
if not enabled then
    return {}
end

return {
    {
        "nvim-lualine/lualine.nvim",
        enabled = true,
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
        config = function()
            require("lualine").setup({
                options = {
                    theme = "tokyodark",
                },
            })
        end,
    },
}
