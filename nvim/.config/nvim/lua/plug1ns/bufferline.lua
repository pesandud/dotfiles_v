local enabled = false

if not enabled then
	return {}
end

return {
	enabled = true,
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	opts = {
		options = {
			mode = "buffers",
			separator_style = "slant", -- "slant" | "thick" | "thin" | { 'any', 'any' }
			always_show_bufferline = false,
			show_close_icon = false,
			show_buffer_close_icons = false,
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					separator = true,
				},
			},
		},
	},

	config = function(_, opts)
		require("bufferline").setup(opts)
	end,
}
