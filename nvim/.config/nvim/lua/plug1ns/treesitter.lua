return {
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
}
