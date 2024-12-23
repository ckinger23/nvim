return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "catppuccin/nvim",
    enabled = true,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme catppuccin-mocha")
    end,
  },
}
