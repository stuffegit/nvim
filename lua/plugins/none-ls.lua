return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- C / C++
				null_ls.builtins.diagnostics.cppcheck.with({
					filetypes = { "c", "cpp" },
					extra_args = {
						"--enable=warning,performance,portability",
						"--template=gcc",
					},
				}),

				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.stylua,
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				vim.lsp.buf.format({
					bufnr = args.buf,
					filter = function(c)
						return c.name == "null-ls" or c.name == "none-ls"
					end,
				})
			end,
		})

		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({
				filter = function(c)
					return c.name == "null-ls" or c.name == "none-ls"
				end,
			})
		end)
	end,
}
