return {
	"echasnovski/mini.nvim",
	enabled = true,
	config = function()
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.clue").setup()
		require("mini.tabline").setup()
		require("mini.indentscope").setup({
			options = {
				border = "top",
			},
			symbol = "│",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "alpha", "dashboard", "fzf", "help", "lazy", "mason" },
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})

		vim.api.nvim_set_hl(0, "MiniTablineCurrent", {
			fg = "#1a1b26",
			bg = "#7aa2f7",
			bold = true,
		})

		vim.keymap.set("n", "<leader>x", function()
			local bd = require("mini.bufremove").delete
			if vim.bo.modified then
				local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
				if choice == 1 then -- Yes
					vim.cmd.write()
					bd(0)
				elseif choice == 2 then -- No
					bd(0, true)
				end
			else
				bd(0)
			end
		end, { noremap = true, silent = true, desc = "Delete Buffer" })

		vim.keymap.set("n", "<leader>bd", function()
			require("mini.bufremove").delete(0, true)
		end, { noremap = true, silent = true, desc = "Delete Buffer (Force)" })
	end,
}
