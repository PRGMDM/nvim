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
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                "SmiteshP/nvim-navbuddy",
                dependencies = {
                    "SmiteshP/nvim-navic",
                    "MunifTanjim/nui.nvim"
                },
                opts = {
                    lsp = { auto_attach = true },
                    window = {
                        size = "75%",
                        scrolloff = 8,
                        sections = {
                            left = {
                                size = "20%",
                                border = nil, -- You can set border style for each section individually as well.
                            },
                            mid = {
                                size = "35%",
                                border = nil,
                            },
                            right = {
                                border = nil,
                                preview = "leaf", -- Right section can show previews too.
                            }
                        },
                    }
                }
            }
        },
    },
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
        opts = {
            multiline_threshold = 1,
            max_lines = 0,
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
            message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
            date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
            virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
        },

    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    },

    -- plugins used only at work
    { 'github/copilot.vim' },
}
