return {
	"ggandor/leap.nvim",
	dependencies = { "tpope/vim-repeat" },
	config = function()
		local leap = require("leap")
		leap.add_default_mappings()
	end,
}
