return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#131313',
				base01 = '#131313',
				base02 = '#a599a2',
				base03 = '#a599a2',
				base04 = '#ffeffb',
				base05 = '#fff8fd',
				base06 = '#fff8fd',
				base07 = '#fff8fd',
				base08 = '#ff9fa7',
				base09 = '#ff9fa7',
				base0A = '#ffb8ed',
				base0B = '#bfffa5',
				base0C = '#ffd9f5',
				base0D = '#ffb8ed',
				base0E = '#ffc4f0',
				base0F = '#ffc4f0',
			})

			local bg_none = { bg = "none", ctermbg = "none" }
			vim.api.nvim_set_hl(0, "Normal", bg_none)
			vim.api.nvim_set_hl(0, "NormalNC", bg_none)
			vim.api.nvim_set_hl(0, "SignColumn", bg_none)
			vim.api.nvim_set_hl(0, "EndOfBuffer", bg_none)

			local groups = { "Normal", "NormalNC", "Comment", "Keyword", "Statement", "Type", "Function" }
			for _, group in ipairs(groups) do
				vim.api.nvim_set_hl(0, group, { 
					bold = false, 
					italic = false, 
					bg = "none",     -- Transparency fix
					ctermbg = "none" 
				})
			end

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#a599a2',
				fg = '#fff8fd',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#ffb8ed',
				fg = '#131313',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#a599a2' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffd9f5', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#ffc4f0',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#ffb8ed',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#ffb8ed',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#ffd9f5',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#bfffa5',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#ffeffb' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#ffeffb' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#a599a2',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
