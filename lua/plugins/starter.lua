return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    -- Disable any automatic opening of the starter screen
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- Open starter manually (you can map this to a keybinding)
        -- require("mini.starter").open()
      end,
    })

    -- Now setup mini.starter for manual use
    require("mini.starter").setup({
      items = {
        { name = "New File",     action = "enew",                 section = "" },
        { name = "Open File",    action = "Telescope find_files", section = "" },
        { name = "Recent Files", action = "Telescope oldfiles",   section = "" },
        { name = "Quit",         action = "qa",                   section = "" },
      },
      header = "",
      footer = "",
      content_hooks = {
        require("mini.starter").gen_hook.adding_bullet("» "),
        require("mini.starter").gen_hook.aligning("center", "center"),
      },
    })
  end,
}
