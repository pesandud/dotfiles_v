local enabled = false

if enabled then
	return {
		enabled = true,
		"akinsho/bufferline.nvim",
		event = "ColorScheme",
		config = function()
			require("bufferline").setup()
		end,
	}
else
	return {}
end
