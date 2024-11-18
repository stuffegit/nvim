local map = vim.keymap.set

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "pylsp", "lua_ls", "clangd" },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require "lspconfig"
      lspconfig.pylsp.setup { capabilities = capabilities }
      lspconfig.clangd.setup { capabilities = capabilities }
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }
        end,
      }
      map("n", "K", vim.lsp.buf.hover, {})
      map("n", "gd", vim.lsp.buf.definition, {})
      map("n", "gD", vim.lsp.buf.declaration, {})
      map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
