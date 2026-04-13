local enabled = false
if not enabled then
    return {}
end

return {
    "ej-shafran/compile-mode.nvim",
    version = "^5.0.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
