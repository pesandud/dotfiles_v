local enabled = true
if not enabled then
	return {}
end
return {
	"catgoose/nvim-colorizer.lua",
	enabled = true,
	event = "BufReadPre",
	config = function ()
	require("colorizer").setup()
	end
}
