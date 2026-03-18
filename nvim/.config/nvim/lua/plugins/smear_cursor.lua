local enabled = false
if not enabled then
	return {}
end

return {
	"sphamba/smear-cursor.nvim",
	opts = {
		stiffness = 0.4,
		trailing_stiffness = 0.3,
		damping = 0.9,
		scroll_buffer_space = true,
		smear_between_buffers = true,
	},
}
