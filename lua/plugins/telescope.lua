return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require "telescope.builtin"
      local telescope = require "telescope"

      -- Basic Find file
      vim.keymap.set("n", "<leader><leader>", function()
        require("telescope.builtin").find_files {
          previewer = false,
        }
      end, { noremap = true, silent = true })

      -- Live grep
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

      -- Diagnostics with Telescope
      vim.keymap.set("n", "<leader>dl", function()
        local diagnostics = vim.diagnostic.get(0)
        require("telescope.builtin").diagnostics {
          bufnr = 0,
          layout_strategy = "vertical",
          layout_config = {
            width = 0.9,
            height = 0.9,
          },
          previewer = false,
        }
      end, { noremap = true, silent = true })

      -- Floating diagnostic window
      vim.keymap.set("n", "<leader>do", function()
        local opts = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          height = 10,
          width = 60,
          wrap = true,
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        }
        vim.diagnostic.open_float(nil, opts)
      end, { noremap = true, silent = true })

      require("telescope").setup {
        defaults = {
          previewer = false,
          layout_strategy = "vertical",
          layout_config = {
            width = 0.9,
            height = 0.9,
          },
          path_display = { "shorten" },
        },
        previewer = false,
      }
    end,
  },
}
