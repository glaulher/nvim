--'<Leader>' is \

local multirg = require('config.telescope-multi-rg')
local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- nvimTree

keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
keymap.set('i', '<C-n>', '<Esc>:NvimTreeToggle<CR>l')
keymap.set('v', '<C-n>', ':NvimTreeToggle<CR>')

-- Closed
keymap.set('n', 'q', ':q<CR>')
keymap.set('n', '<S-Q>', ':q!<CR>')

-- Search word telescope grep
keymap.set("n", "<C-f>", function()
  multirg()
end) --Normal

-- copy and paste
keymap.set("x", "<C-c>","y<CR>", { silent = true }) --Visual
keymap.set("x", "<C-v>","p<CR>", { silent = true }) --Visual
keymap.set("i", "<C-v>","<ESC>:-1<CR>p<CR>", { silent = true }) --Insert
keymap.set("i", "<C-c>","<ESC>yy<CR>", { silent = true }) --Insert
keymap.set("n", "<C-c>","yy<CR>", { silent = true }) --Normal
-- Use p to paste Normal mode

-- Move line
keymap.set("x", "<C-UP>", ":move '<-2<CR>gv-gv", { silent = true }) --Visual
keymap.set("x", "<C-DOWN>", ":move '>+1<CR>gv-gv", { silent = true }) --Visual

vim.cmd([[ nmap <C-UP> :m-2<CR> ]]) -- Normal
vim.cmd([[ nmap <C-DOWN> :m+1<CR> ]]) -- Normal
vim.cmd([[ imap <C-UP> <Esc> :m-2<CR>l ]]) -- Insert
vim.cmd([[ imap <C-DOWN> <Esc> :m+1<CR>l ]]) -- Insert

-- Save with 'Ctrl + S'  mods: Normal, Inserção e Visual
-- Need add line: stty -ixon , in ~/.bashrc
vim.cmd([[ nnoremap <C-s> :w<CR> ]])
vim.cmd([[ inoremap <C-s> <Esc>:w<CR>l ]])
vim.cmd([[ vnoremap <C-s> <Esc>:w<CR> ]])

-- Command Fold (colapse code)
vim.cmd([[ nnoremap <z-a> za]]) -- Fold colapse
vim.cmd([[ nnoremap e :edit<CR>]]) -- Reset Bug Fold colapse

------------------------------
-- Keybinds in some plugins --
------------------------------

-- line-comment keymap (use visual mode)
--
--Key tb

-- block-comment keymap
--  Make sense to be related to your opleader.block
--
--Key tt

-- ZenMode (full screen in terminal)
-- :ZenMode



