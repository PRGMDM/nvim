require("config.lazy")

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

-- colorscheme
vim.cmd[[colorscheme tokyonight-night]]

-- telescope keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- jump to current function name
vim.keymap.set('n', '[[', '?{<CR>w99[{?)<CR>%bzz', { noremap = true, silent = true })

-- jk to escape
vim.keymap.set('i', 'jk', '<esc>', { noremap = true, silent = true })

-- alt-t to open current buffer in a new tab
vim.api.nvim_set_keymap('n', '<m-t>', ':tab split<CR>', { noremap = true, silent = true })

-- <leader><CR> to open quickfix item in a vertical split
vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.keymap.set("n", "<leader><CR>", "<C-w><CR><C-w>L", { buffer = true, noremap = true, silent = true })
    end,
})

-- <leader>j/k to move through the quickfix list
vim.keymap.set('n', '<leader>j', ':cnext<CR>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>k', ':cprev<CR>zz', { noremap = true, silent = true })

-- <leader>n to invoke Navbuddy
vim.keymap.set('n', '<leader>n', ':Navbuddy<CR>', { noremap = true, silent = true })

-- Automatically switch to the previous tab when closing a tab
vim.api.nvim_create_autocmd("TabClosed", {
    pattern = "*",
    callback = function()
        vim.cmd("tabprevious")
    end,
})

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

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
