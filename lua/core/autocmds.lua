-- <leader><CR> to open quickfix item in a vertical split
-- TODO: How is this any better than just always set this keymap?
vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.keymap.set("n", "<leader><CR>", "<C-w><CR><C-w>L", { buffer = true, noremap = true, silent = true })
    end,
})

-- move to previous tab when closing a tab
vim.api.nvim_create_autocmd("TabLeave", {
    pattern = "*",
    callback = function()
        vim.g.lasttab_winid_tmp = vim.g.lasttab_winid or nil
        vim.g.lasttab_winid = vim.api.nvim_get_current_win()
    end,
})

vim.api.nvim_create_autocmd("TabClosed", {
    pattern = "*",
    callback = function()
        vim.g.lasttab_winid = vim.g.lasttab_winid_tmp
        if vim.fn.tabpagenr("$") > 1 then
            pcall(function()
                local tabwin = vim.fn.win_id2tabwin(vim.g.lasttab_winid)
                vim.cmd("tabn " .. tabwin[1])
            end)
        end
    end,
})

-- lsp key bindings
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set('n', '<F3>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F4>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    end,
})
