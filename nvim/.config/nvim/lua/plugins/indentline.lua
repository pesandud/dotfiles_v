local enabled = false
if not enabled then
	return {}
end

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = "▏" },
    scope = { enabled = false },
  },
}
