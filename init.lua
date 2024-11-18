local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
local opts = {}

require "vim-options"
require("lazy").setup "plugins"

vim.diagnostic.config {
  virtual_text = {
    format = function(diagnostic)
      local max_length = 100 -- Limit the message length
      if #diagnostic.message > max_length then
        return string.sub(diagnostic.message, 1, max_length) .. "..."
      end
      return diagnostic.message
    end,
  },
}

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.whichwrap:append "<>[]hl"

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"

vim.opt.updatetime = 50

vim.api.nvim_set_keymap("n", "<M-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-l>", "<C-w>l", { noremap = true, silent = true })
