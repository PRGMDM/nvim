return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            { 'SirVer/ultisnips', },
            { 'lervag/vimtex' },
            { 'quangnguyen30192/cmp-nvim-ultisnips', },
            { 'hrsh7th/cmp-nvim-lsp' }
        },
        config = function()
            local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["UltiSnips#Anon"](args.body)
                    end,
                },
                sources = {
                    { name = "ultisnips" },
                    { name = 'nvim_lsp' },
                },
                -- recommended configuration for <Tab> people:
                mapping = {
                    ["<Tab>"] = cmp.mapping(
                        function(fallback)
                            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
                        end,
                        { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
                    ),
                    ["<S-Tab>"] = cmp.mapping(
                        function(fallback)
                            cmp_ultisnips_mappings.jump_backwards(fallback)
                        end,
                        { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
                    ),
                },
            })
        end,
    },
    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        init = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.tex_flavor='latex'
            vim.g.vimtex_quickfix_mode=0
        end
    },
    {
        'KeitaNakamura/tex-conceal.vim',
        init = function()
            vim.o.conceallevel=1
            vim.g.tex_conceal='abdmg'
            vim.cmd('hi Conceal ctermbg=none')
        end,
    }
}
