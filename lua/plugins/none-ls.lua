return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				--null_ls.builtins.diagnostics.cppcheck,
				null_ls.builtins.diagnostics.cppcheck.with({
					Filetypes = { "cpp", "c" },
					extra_args = {
						"--enable=warning,performance,portability",
						"--template=gcc",
						"--std=c++17",
						"--suppress=unusedStructMember",
						"$FILENAME",
					},
				}),
				null_ls.builtins.formatting.clang_format.with({
					extra_args = { "--style=file" },
				}),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				else
					print("Formatting not supported by this LSP client.")
				end

				-- Keymap for manual formatting
				vim.keymap.set("n", "<leader>gf", function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end, { buffer = bufnr })
			end,
		})
	end,
}
