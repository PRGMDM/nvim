-- <leader>w to save
vim.keymap.set('n', '<leader>w', ':wa<CR>', { noremap = true, silent = true })

-- jk to escape
vim.keymap.set('i', 'jk', '<esc>', { noremap = true, silent = true })

-- <leader>t to move current window to a new tab
vim.keymap.set('n', '<leader>t', '<C-w>T', { noremap = true, silent = true })

-- <leader>j/k to move through the quickfix list
vim.keymap.set('n', '<leader>j', ':cnext<CR>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>k', ':cprev<CR>zz', { noremap = true, silent = true })

-- <leader>h/l to move through tabs
vim.keymap.set('n', '<leader>h', ':tabprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', ':tabnext<CR>', { noremap = true, silent = true })

-- <leader>b to blame and copy the commit hash
-- TODO: might be a better idea to find a good front end for git
vim.keymap.set('n', '<leader>b', ':GitBlameCopySHA<CR>', { noremap = true, silent = true })

-- <leader>to/c to close/keep the current tab
vim.keymap.set('n', '<leader>to', ':tabo<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tc', ':tabc<CR>', { noremap = true, silent = true })

-- <leader>fn to copy the current file name to clipboard
-- TODO: Do I need a short cut that copy the whole path?
vim.keymap.set('n', '<leader>fn', ':let @+ = expand("%:t")<CR>', { noremap = true, silent = true })

-- <leader>n to invoke navbuddy
vim.keymap.set('n', '<leader>n', ':Navbuddy<CR>', { noremap = true, silent = true })
