return {
    {
        -- Smooth scrolling
        "psliwka/vim-smoothie",
        init = function()
            vim.g.smoothie_enabled = 1
        end
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
	            keywords = { italic = false }
            }
        }
    },
    {
        -- fuzzy finder
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'tpope/vim-surround' }, -- actions for parentheses, brackets, quotes, etc
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    {
      'rmagatti/goto-preview',
       event = 'BufEnter',
       config = true,
       opts = {
         default_mappings = true,
         height = 30,
       },
    },
    { 'nvim-treesitter/nvim-treesitter' },
    {
        'nvim-treesitter/nvim-treesitter-context',
        opts = { multiline_threshold = 1, },
     },

    -- plugins used only at work
    { 'github/copilot.vim' },
}
