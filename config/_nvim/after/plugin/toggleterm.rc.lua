local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

local Terminal = require('toggleterm.terminal').Terminal
local mem      = Terminal:new({
  cmd = "watch free -h",
  hidden = true,
  size = 6,
  --              open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persiste_size = true,
  direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
  close_on_exit = true,
  shell = vim.o.shell,
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

local new = Terminal:new({
  hidden = true,
  size = 6,
  --              open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persiste_size = true,
  direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
  close_on_exit = true,
  shell = vim.o.shell,
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

local newf = Terminal:new({
  hidden = true,
  size = 20,
  --              open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persiste_size = true,
  direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
  close_on_exit = true,
  shell = vim.o.shell,
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

local htop = Terminal:new({
  cmd = 'htop',
  hidden = true,
  size = 20,
  --              open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persiste_size = true,
  direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
  close_on_exit = true,
  shell = vim.o.shell,
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})



function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

function _mem_toggle()
  mem:toggle()
end

function _new_toggle()
  new:toggle()
end

function _newf_toggle()
  newf:toggle()
end

function _htop_toggle()
  htop:toggle()
end

vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>lua _new_toggle()<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<M-1>", "<cmd>lua _newf_toggle()<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<M-2>", "<cmd>lua _mem_toggle()<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<M-3>", "<cmd>lua _htop_toggle()<CR>", { noremap = true, silent = false })
