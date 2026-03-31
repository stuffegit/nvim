vim.keymap.set("n", "<M-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<M-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<M-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<M-l>", "<C-w>l", { silent = true })

for _, mode in ipairs({ "n", "i", "v" }) do
  vim.keymap.set(mode, "<F1>", "<nop>")
  vim.keymap.set(mode, "<F2>", "<nop>")
  vim.keymap.set(mode, "<F3>", "<nop>")
  vim.keymap.set(mode, "<F4>", "<nop>")
end

for i = 1, 9 do
  vim.keymap.set("n", "<A-" .. i .. ">", "<Cmd>BufferGoto " .. i .. "<CR>", { silent = true })
end
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", { silent = true })
vim.keymap.set("n", "<leader>bd", "<Cmd>bd<CR>", { silent = true })

vim.keymap.set("n", "<leader>t", function()
  vim.cmd("ToggleTerm direction=float")
end, { silent = true })
