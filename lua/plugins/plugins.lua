return {
    {
        -- Smooth scrolling
        "psliwka/vim-smoothie",
        init = function()
            vim.g.smoothie_enabled = 1
        end
    },
    { 'tpope/vim-surround' }, -- actions for parentheses, brackets, quotes, etc
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            "SmiteshP/nvim-navbuddy",
        },
    },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    {
        'rmagatti/goto-preview',
        event = 'BufEnter',
        config = true,
        opts = {
            default_mappings = true,
            height = 35,
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    { 'nvim-treesitter/nvim-treesitter' },
    {
        'nvim-treesitter/nvim-treesitter-context',
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",
        opts = {
            multiline_threshold = 1,
            max_lines = 5,
        },
    },
    {
        "f-person/git-blame.nvim",
        -- load the plugin at startup
        event = "VeryLazy",
        -- Because of the keys part, you will be lazy loading this plugin.
        -- The plugin wil only load once one of the keys is used.
        -- If you want to load the plugin at startup, add something like event = "VeryLazy",
        -- or lazy = false. One of both options will work.
        opts = {
            -- your configuration comes here
            -- for example
            enabled = true, -- if you want to enable the plugin
            message_template = " <summary> • <date> • <author>", -- template for the blame message, check the Message template section for more options
            date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
            virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
        },

    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
    { 'tomasky/bookmarks.nvim', },
}
