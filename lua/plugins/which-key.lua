
return {
  "folke/which-key.nvim",
  opts = {
    delay = 0,
  },
  config = function()
    local wk = require("which-key")
    wk.add({
      -- File Management
        { "<leader>ff", desc = "Find File" },
        { "<leader>fg", desc = "Fuzzy Find File" },
        { "<leader>fh", desc = "Find Help" },

      -- LSP Finding
        { "<leader>gd", desc = "Go to Definition" },
        { "<leader>gD", desc = "Go to Declaration" },
        { "<leader>ca", desc = "Exec Code Action" },

      -- Misc
        { "<leader>gf", desc = "Exec Formatting" },
        { "<leader>lg", desc = "LazyGit" },
      })
  end,
}
