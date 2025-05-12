require("config.lazy")

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- vim options
vim.opt.mouse = "nv"
vim.opt.number = true
vim.opt.ruler = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.wildmenu = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- colorscheme
vim.cmd[[colorscheme tokyonight-night]]

-- telescope keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fr', ':Telescope resume<CR>', { desc = 'Telescope resume' })

-- <leader>w to save the current buffer
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

-- jk to escape
vim.keymap.set('i', 'jk', '<esc>', { noremap = true, silent = true })

-- <leader><CR> to open quickfix item in a vertical split
vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.keymap.set("n", "<leader><CR>", "<C-w><CR><C-w>L", { buffer = true, noremap = true, silent = true })
    end,
})

-- <leader>t to move current window to a new tab
vim.keymap.set('n', '<leader>t', '<C-w>T', { noremap = true, silent = true })

-- <leader>j/k to move through the quickfix list
vim.keymap.set('n', '<leader>j', ':cnext<CR>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>k', ':cprev<CR>zz', { noremap = true, silent = true })

-- <leader>h/l to move through tabs
vim.keymap.set('n', '<leader>h', ':tabprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', ':tabnext<CR>', { noremap = true, silent = true })

-- <leader>n to invoke Navbuddy
vim.keymap.set('n', '<leader>n', ':Navbuddy<CR>', { noremap = true, silent = true })

-- <leader>b to blame and copy the commit hash
vim.keymap.set('n', '<leader>b', ':GitBlameCopySHA<CR>', { noremap = true, silent = true })

-- <leader>h to open my notes
vim.keymap.set('n', '<leader>r', ':tabe ~/notes<CR>', { noremap = true, silent = true })

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

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    ["clangd"] = function ()
      require'lspconfig'.clangd.setup{
        cmd = { "clangd-wrapper.sh" }
      }
    end,
  },
})

require('bookmarks').setup {
  -- sign_priority = 8,  --set bookmark sign priority to cover other sign
  save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
  keywords =  {
    ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
    ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
    ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
    ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
  },
  on_attach = function(bufnr)
    local bm = require "bookmarks"
    local map = vim.keymap.set
    map("n","mm",bm.bookmark_toggle) -- add or remove bookmark at current line
    map("n","mi",bm.bookmark_ann) -- add or edit mark annotation at current line
    map("n","mc",bm.bookmark_clean) -- clean all marks in local buffer
    map("n","mn",bm.bookmark_next) -- jump to next mark in local buffer
    map("n","mp",bm.bookmark_prev) -- jump to previous mark in local buffer
    map("n","ml",bm.bookmark_list) -- show marked file list in quickfix window
    map("n","mx",bm.bookmark_clear_all) -- removes all bookmarks
  end
}
