return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup {
        use_lsp_diagnostics = true, -- Enable LSP diagnostics
        -- Custom preview configuration for diagnostics
        preview = {
          type = "split",     -- Use floating window
          relative = "win",   -- Position relative to the editor
          position = "right", -- Position offset
          size = 0.3,         -- Size of the preview window
        },
      }
      vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>tw", function()
        local windows = vim.api.nvim_tabpage_list_wins(0)
        for _, win in ipairs(windows) do
          local buf = vim.api.nvim_win_get_buf(win)
          if buf ~= 0 then
            local buf_name = vim.api.nvim_buf_get_name(buf)
            if buf_name == "" or buf_name:match "trouble" then
              vim.api.nvim_set_current_win(win)
              break
            end
          end
        end
      end, { noremap = true, silent = true })

      vim.keymap.set(
        "n",
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        { noremap = true, silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        { noremap = true, silent = true }
      )
      vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { noremap = true, silent = true })
    end,
  },
}
