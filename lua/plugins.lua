return {
  {
    "psliwka/vim-smoothie",
    init = function()
      vim.g.smoothie_enabled = 1
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },
}
