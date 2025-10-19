return {
    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        init = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.tex_flavor = 'latex'
            vim.g.vimtex_quickfix_mode = 0
        end
    },
    {
        'KeitaNakamura/tex-conceal.vim',
        init = function()
            vim.o.conceallevel = 1
            vim.g.tex_conceal = 'abdmg'
            vim.cmd('hi Conceal ctermbg=none')
        end,
    }

}
