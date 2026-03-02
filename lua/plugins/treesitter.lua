return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdateSync",
  config = function()
    require("nvim-treesitter").setup({
	    ensure_installed = {"lua", "c", "cpp", "markdown", "vim", "markdown_inline" },
	    highlight = { enable = true },
	    indent = { enable = true },
    })
  end,
}
