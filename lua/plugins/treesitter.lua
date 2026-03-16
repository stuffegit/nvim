return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
    ensure_installed = {"c", "cpp", "vim" },
    highlight = {
    enable = true,
    disable = { "vim" },
    },
	  indent = { enable = true },
    })
  end
}
