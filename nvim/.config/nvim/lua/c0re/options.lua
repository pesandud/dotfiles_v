vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
vim.g.netrw_banner = 0
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
vim.o.showmode = false
vim.opt.termguicolors = true
vim.o.scrolloff = 10
vim.o.list = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.api.nvim_set_hl(0, "CursorLine", {})
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLineNr", {
      fg = "#7aa2f7",
    })
  end,
})
