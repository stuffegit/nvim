local map = vim.keymap.set

return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"clang-format",
			},
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd" },
				automatic_enable = false,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- local capa = require("cmp_nvim_lsp").default_capabilities()
			local capa = vim.lsp.protocol.make_client_capabilities()
			capa.offsetEncoding = { "utf-16" }

			local util = require("lspconfig.util")
			local function clangd_root(fname)
				local abs = vim.fs.normalize(vim.fn.fnamemodify(fname, ":p"))
				if abs == "" then
					return nil
				end

				return util.search_ancestors(abs, function(path)
					if util.path.exists(util.path.join(path, "build/Debug/compile_commands.json")) then
						return path
					end
					if util.path.exists(util.path.join(path, "compile_commands.json")) then
						return path
					end
					if util.path.exists(util.path.join(path, "CMakeLists.txt")) then
						return path
					end
				end)
			end

			vim.lsp.config("clangd", {
				capabilities = capa,
				root_dir = clangd_root,
				cmd = {
					"/usr/bin/clangd",
					"--background-index",
					"--completion-style=detailed",
					"--header-insertion=iwyu",
					"--compile-commands-dir=build/Debug",
					"--query-driver=/usr/bin/arm-none-eabi-*",
				},
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "c", "cpp", "objc", "objcpp", "cuda" },
				callback = function(args)
					local bufnr = args.buf
					if #vim.lsp.get_clients({ bufnr = bufnr, name = "clangd" }) > 0 then
						return
					end

					local fname = vim.api.nvim_buf_get_name(bufnr)
					local root = clangd_root(fname)
					if not root then
						return
					end

					vim.lsp.start({
						name = "clangd",
						cmd = {
							"/usr/bin/clangd",
							"--background-index",
							"--completion-style=detailed",
							"--header-insertion=iwyu",
							"--compile-commands-dir=build/Debug",
							"--query-driver=/usr/bin/arm-none-eabi-*",
						},
						capabilities = capa,
						root_dir = root,
					})
				end,
			})

			vim.api.nvim_create_user_command("LspRestartClangd", function()
				for _, client in ipairs(vim.lsp.get_clients({ name = "clangd" })) do
					client:stop(true)
				end
				vim.defer_fn(function()
					vim.cmd("edit")
				end, 100)
			end, { desc = "Restart clangd without touching null-ls" })

			map("n", "K", vim.lsp.buf.hover, {})
			map("n", "gd", vim.lsp.buf.definition, {})
			map("n", "gD", vim.lsp.buf.declaration, {})
			map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
