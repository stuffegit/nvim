local map = vim.keymap.set

return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"clang-format",
				"cppcheck",
				"stylua",
			},
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capa = require("cmp_nvim_lsp").default_capabilities()
			capa.offsetEncoding = { "utf-16" }

			vim.lsp.config("clangd", {
				capabilities = capa,
				cmd = {
					"clangd",
					"--background-index",
					"--completion-style=detailed",
					"--header-insertion=iwyu",
					"--clang-tidy",
					"--compile-commands-dir=build",
					"--query-driver=/usr/bin/arm-none-eabi-*",
				},
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})

			map("n", "K", vim.lsp.buf.hover, {})
			map("n", "gd", vim.lsp.buf.definition, {})
			map("n", "gD", vim.lsp.buf.declaration, {})
			map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
