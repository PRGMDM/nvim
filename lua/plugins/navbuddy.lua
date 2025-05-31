
return {                
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
    },
    config = function()
        -- <leader>n to invoke Navbuddy
        vim.keymap.set('n', '<leader>n', ':Navbuddy<CR>', { noremap = true, silent = true })
    end
}
