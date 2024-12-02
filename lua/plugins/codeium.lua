return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	config = function()
		vim.g.codeium_enabled = false
		vim.g.codeium_disable_bindings = true
		vim.g.codeium_no_map_tab = true
		vim.keymap.set("i", "<C-g>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true })
		vim.keymap.set("i", "<C-f>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true })
	end,
}
