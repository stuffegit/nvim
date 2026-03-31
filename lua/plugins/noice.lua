return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("noice").setup({
			cmdline = {
				view = "cmdline_popup",
				format = {
					cmdline = { icon = "" },
				},
			},

			messages = { enabled = false },
			popupmenu = { enabled = false },

			views = {
				cmdline_popup = {
					position = {
						row = "50%",
						col = "50%",
					},
					size = {
						width = 30,
						height = 1,
					},
					border = {
						style = "none",
					},
					win_options = {
						winhighlight = "Normal:NoiceCmdlineMinimal,FloatBorder:NoiceCmdlineMinimal",
					},
				},
			},
		})
	end,
}
