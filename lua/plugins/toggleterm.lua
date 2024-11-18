return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
      vim.keymap.set("n", "<C-x>", ":ToggleTerm<CR>", { noremap = true, silent = true })
    end,
  },
}
