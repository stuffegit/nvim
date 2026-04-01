return {
	"chrisgrieser/nvim-origami",
	optis = {},

	init = function()
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
	end,
	config = function()
		require("origami").setup({
			useLspFoldsWithTreesitterFallback = {
				enabled = true,
				foldmethodIfNeitherIsAvailable = "indent", ---@type string|fun(bufnr: number): string
			},
			pauseFoldsOnSearch = true,
			foldtext = {
				enabled = true,
				padding = {
					character = " ",
					width = 3, ---@type number|fun(win: number, foldstart: number, currentVirtualTextLength: number): number
					hlgroup = nil,
				},
				lineCount = {
					template = "%d lines",
					hlgroup = "Comment",
				},
				diagnosticsCount = true,
				disableOnFt = { "snacks_picker_input" }, ---@type string[]
			},
			autoFold = {
				enabled = true,
				kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
			},
			foldKeymaps = {
				setup = true,
				closeOnlyOnFirstColumn = false,
				scrollLeftOnCaret = false,
			},
		})
	end,
}
