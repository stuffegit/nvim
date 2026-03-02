return {
	url = "https://codeberg.org/andyg/leap.nvim",
	dependencies = { "tpope/vim-repeat" },
	config = function()
		local leap = require("leap")
		leap.add_default_mappings()
	end,
}
