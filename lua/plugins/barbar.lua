return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			animation = false,
			auto_hide = 1,
			tabpages = false,
			icons = {
				separator = {
					left = "",
					right = "",
				},
				separator_at_end = false,
			},
		},
	},
}
