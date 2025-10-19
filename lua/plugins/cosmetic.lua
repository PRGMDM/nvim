return {
    {
        -- Colorscheme
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function(_, _)
            require("tokyonight").setup({
                style = "night",
                styles = {
                    sidebars = "dark",
                    floats = "dark",
                    comments = { italic = false },
                    keywords = { italic = false },
                },
            })
            vim.cmd("colorscheme tokyonight")
        end
    },
    {
        -- Smooth scrolling
        "psliwka/vim-smoothie",
    },
    {
        -- TODO highlighting
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
}
