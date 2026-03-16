return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.isort,

        -- C / C++
        null_ls.builtins.diagnostics.cppcheck.with({
          filetypes = { "c", "cpp" },
          extra_args = {
            "--enable=warning,performance,portability",
            "--template=gcc",
            "--std=c++17",
            "--suppress=unusedStructMember,assertWithSideEffect",
          },
        }),

        null_ls.builtins.formatting.clang_format.with({
          filetypes = { "c", "cpp" },
          extra_args = { "--style=file" },
        }),
      },

      on_attach = function(client, bufnr)
        if client:supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                filter = function(c)
                  return c.name == "null-ls"
                end,
              })
            end,
          })
        end

        vim.keymap.set("n", "<leader>gf", function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(c)
              return c.name == "null-ls"
            end,
          })
        end, { buffer = bufnr })
      end,
    })
  end,
}

