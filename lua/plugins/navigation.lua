return {
    {
        -- fuzzy finder
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            -- keybindings
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            vim.keymap.set('n', '<leader>fr', ':Telescope resume<CR>', { desc = 'Telescope resume' })
            vim.keymap.set('n', '<leader>fm', ':Telescope bookmarks list<CR>', { desc = 'Telescope bookmarks' })
            require('telescope').load_extension('bookmarks')
        end
    },
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
                sections = {
                    left = {
                        size = "20%",
                        border = nil,
                    },
                    mid = {
                        size = "35%",
                        border = nil,
                    },
                    right = {
                        border = nil,
                        preview = "leaf",
                    }
                },
            }
        },
    },
}

-- TODO: Can I make the search results go top-down instead of bottom-up?
-- TODO: make ctrl q open the first item in a new tab and open the quickfix list.
