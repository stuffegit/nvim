return {
	{
		'nvim-telescope/telescope.nvim', version = '*',
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			require("telescope").setup{
				pickers = {
					find_files = {
						theme = "ivy",
					},
				},
				extensions = {
					fzf = {},
				},
			}
      local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags"})
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files"})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
			vim.keymap.set("n", "<leader>en", function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.stdpath("config"),
				})
			end, { desc = "Find conf files"})
			vim.keymap.set("n", "<leader>ep", function()
				builtin.find_files({
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
				})
			end, { desc = "Lazy Find Files"})
		end,
	},
}
