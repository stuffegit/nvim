return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local function get_size()
			local ui = vim.api.nvim_list_uis()[1]
			local width = math.floor(ui.width * 0.8)
			local height = math.floor(ui.height * 0.8)

			return {
				width = width,
				height = height,
				row = math.floor((ui.height - height) / 2),
				col = math.floor((ui.width - width) / 2),
			}
		end

		local size = get_size()

		require("toggleterm").setup({
			direction = "float",
			float_opts = {
				border = "single",
				width = size.width,
				height = size.height,
				row = size.row,
				col = size.col,
			},
			shade_terminals = true,
			shading_factor = 10,
			start_in_insert = true,
			persist_size = true,
			close_on_exit = true,
		})
	end,
}
