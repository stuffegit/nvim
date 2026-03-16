vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Prevent accidental modeline execution from source comments like "ex: ..."
vim.opt.modeline = false
vim.opt.modelines = 0
