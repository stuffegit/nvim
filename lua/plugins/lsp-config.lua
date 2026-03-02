return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"mason-org/mason.nvim"},
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pylsp", "lua_ls", "clangd" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local map = vim.keymap.set
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "gD", vim.lsp.buf.declaration, opts)
      map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    end

      vim.lsp.config("pylsp", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable("pylsp")

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
          "clangd",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=iwyu",
        },
        root_dir = function(fname)
          return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
        end,
      })
      vim.lsp.enable("clangd")

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = {"vim"},
            },
          },
        },
      })
      vim.lsp.enable("lua_ls")
    end,
  },
}
