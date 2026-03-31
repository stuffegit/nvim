local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("config.options")
require("config.keymaps")
require("config.autocmds")

require("lazy").setup("plugins")

vim.diagnostic.config({
	virtual_text = {
		format = function(diagnostic)
			local max_length = 100 -- Limit the message length
			if #diagnostic.message > max_length then
				return string.sub(diagnostic.message, 1, max_length) .. "..."
			end
			return diagnostic.message
		end,
	},
})
