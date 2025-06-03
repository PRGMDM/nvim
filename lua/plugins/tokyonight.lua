return {
    {
        -- Colorscheme
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "night",
            styles = {
                sidebars = "dark",
                floats = "dark",
                comments = { italic = false },
                keywords = { italic = false }
            }
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd("colorscheme tokyonight")
        end,
    },
}
