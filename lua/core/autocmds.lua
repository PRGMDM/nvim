-- <leader><CR> to open quickfix item in a vertical split
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

