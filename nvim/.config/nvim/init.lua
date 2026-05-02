-------------------
-- options --------
-------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)
-- vim.g.netrw_banner = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.undofile = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.o.inccommand = 'split'
-- vim.opt.guicursor = ""
vim.o.confirm = true
vim.opt.fillchars = { eob = " " }
-- vim.o.showmode = false
vim.opt.termguicolors = true
vim.o.scrolloff = 10
vim.o.list = false
-- vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "number"
-- vim.api.nvim_set_hl(0, "CursorLine", {})
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = function()
--     vim.api.nvim_set_hl(0, "CursorLineNr", {
--       fg = "#7aa2f7",
--     })
--   end,
-- })


-------------------
-- autocmds -------
-------------------
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-on-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- local asm_group = vim.api.nvim_create_augroup("asm_file_settings", { clear = true })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "gas" },
--   group = asm_group,
--   desc = "Set GAS assembly comment character to #",
--   callback = function()
--     vim.opt_local.commentstring = "# %s"
--   end,
-- })

-------------------
-- keymaps --------
-------------------
local map = vim.keymap.set
map("i", "jk", "<ESC>")
map("i", "<M-h>", "<left>", { noremap = true })
map("i", "<M-l>", "<right>", { noremap = true })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("v", "<leader>j", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<leader>k", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
map({ "n", "v" }, "<leader>y", '"+y', { desc = "[Y]ank to system clipboard" })
map({ "n", "v" }, "<leader>Y", '"+Y', { desc = "[Y]ank line to system clipboard" })
map({ "n", "v" }, "<leader>p", '"+p', { desc = "[P]aste from system clipboard" })
map({ "n", "v" }, "<leader>P", '"+P', { desc = "[P]aste before from system clipboard" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "[D]elete without yanking" })
-- map("n", "<leader>e", function()
-- 	vim.cmd("Ex")
-- end, { desc = "NetRW" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
-- autosession (disabled temporarily)
-- map("n", "<leader>Ss", function()
-- 	vim.cmd("AutoSession search")
-- end, { desc = "[S]earch [s]aved sessions" })
-- map("n", "<leader>Sd", function()
-- 	vim.cmd("AutoSession deletePicker")
-- end, { desc = "[S]earch [d]eletepicker" })
-- map("n", "<leader>SS", function()
-- 	vim.cmd("AutoSession save")
-- end, { desc = "[S]ave [S]ession" })
--
local function insert_comment(direction)
  local cs = vim.bo.commentstring
  if cs == "" or cs == nil then
    print("No commentstring set for this filetype")
    return
  end
  
  -- Extract the prefix (part before %s) and clean up whitespace
  local comment_prefix = cs:gsub("%%s.*", ""):gsub("%s+$", "") .. " "
  
  -- Execute the 'o' or 'O' command to create a new line
  vim.cmd("normal! " .. direction)
  
  -- Insert the comment character
  vim.api.nvim_put({comment_prefix}, "c", true, true)
  
  -- Enter insert mode at the end of the line
  vim.cmd("startinsert!")
end

vim.keymap.set("n", "gco", function() insert_comment("o") end, { desc = "Insert comment below" })
vim.keymap.set("n", "gcO", function() insert_comment("O") end, { desc = "Insert comment above" })


-- vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
-- vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
-- vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
-- vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
-- vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
-- vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
-- vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
-- vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')

-------------------
-- plugins --------
-------------------
-- lazy -----------
-------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{
			'nvim-treesitter/nvim-treesitter',
			event = { "BufReadPost", "BufNewFile" },
			build = ':TSUpdate',
			config = function(_, opts)
				require('nvim-treesitter').setup(opts)
			end,
			opts = {
				ensure_installed = {
					'bash', 'c', 'lua', 'markdown', 'markdown_inline',
					'vim', 'vimdoc', 'python', 'cpp', 'css',
				},
				auto_install = true,
				highlight = {
					enable = true,
				},
				indent = { enable = true },
			},
		},
		{
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
		},
		{
			"nvim-tree/nvim-tree.lua",
			version = "*",
			lazy = false,
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				require("nvim-tree").setup({})
				-- Recommended Keymaps
				local keymap = vim.keymap
				keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
				keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Toggle explorer on current file" })
				keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<cr>", { desc = "Refresh file explorer" })
			end,
		},
	},
	install = { colorscheme = { "habamax" } },
})
