return {
  {
    -- Smooth scrolling
    "psliwka/vim-smoothie",
    init = function()
      vim.g.smoothie_enabled = 1
    end,
  },
  {
    -- Colorscheme
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      styles = {
        sidebars = "dark",
	floats = "dark",
	comments = { italic = false },
	keywords = { italic = false },
      },
    },
  },
  {
    -- fuzzy finder
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
}
