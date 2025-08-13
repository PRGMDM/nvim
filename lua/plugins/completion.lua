local WIDE_HEIGHT = 40
return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            { 'SirVer/ultisnips', },
            { 'lervag/vimtex' },
            { 'quangnguyen30192/cmp-nvim-ultisnips', },
            { 'hrsh7th/cmp-nvim-lsp' },
        },
        opts = function()
            vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
            local cmp = require("cmp")
            local defaults = require("cmp.config.default")()
            local auto_select = true
            local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
            return {
                auto_brackets = {}, -- configure any filetype to auto add brackets
                completion = {
                    completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
                },
                preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
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
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                }),
                formatting = {
                    format = function(entry, item)
                        local widths = {
                            abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
                            menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
                        }

                        for key, width in pairs(widths) do
                            if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                                item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
                            end
                        end

                        return item
                    end,
                },
                experimental = {
                    -- only show ghost text when we show ai completions
                    ghost_text = vim.g.ai_cmp and {
                        hl_group = "CmpGhostText",
                    } or false,
                },
                sorting = defaults.sorting,
            }
        end,
    },

--     {
--         "lervag/vimtex",
--         lazy = false, -- we don't want to lazy load VimTeX
--         init = function()
--             vim.g.vimtex_view_method = "zathura"
--             vim.g.tex_flavor = 'latex'
--             vim.g.vimtex_quickfix_mode = 0
--         end
--     },
    {
        'KeitaNakamura/tex-conceal.vim',
        init = function()
            vim.o.conceallevel = 1
            vim.g.tex_conceal = 'abdmg'
            vim.cmd('hi Conceal ctermbg=none')
        end,
    }
}
