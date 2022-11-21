-- vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'

local opt = vim.opt
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

--vim.cmd([[ syntax on ]])


vim.wo.number   = true -- show window line numbers
opt.title       = true
opt.autoindent  = true
opt.smartindent = true
opt.hlsearch    = true
--opt.background     = 'dark'
opt.showcmd     = true
opt.cmdheight   = 1
opt.laststatus  = 2
opt.expandtab   = true
opt.scrolloff   = 10
opt.shell       = 'zsh'
opt.inccommand  = 'split'
opt.ignorecase  = true -- Case insensitive searching UNLESS /C or capital in search
opt.smarttab    = true
opt.breakindent = true
opt.linebreak   = true -- Stop words being broken on wrap
opt.shiftwidth  = 2
opt.wrap        = true
opt.winblend    = 0

opt.mouse          = 'a' -- Allow the use of mouse
opt.clipboard      = "unnamed,unnamedplus" --- Copy-paste between vim and everything else
opt.cursorline     = true --- Highlight of current line
--opt.foldcolumn     = "0"
--opt.foldnestmax    = 0
vim.wo.foldmethod  = "expr"
vim.wo.foldexpr    = "nvim_treesitter#foldexpr()"
opt.foldlevel      = 99 --- Using ufo provider need a large value
--opt.foldlevelstart = 99
--- Expand all folds by default
opt.lazyredraw     = true --- Makes macros faster & prevent errors in complicated mappings
-- Enable mouse
--opt.pumheight      = 10                      --- Max num of items in completion menu
opt.relativenumber = false --- Enables relative number
opt.showtabline    = 2 --- Always show tabs
opt.signcolumn     = "yes:2" --- Add extra sign column next to line number
opt.smartcase      = true --- Uses case in search
opt.smartindent    = true --- Makes indenting smart
opt.smarttab       = true --- Makes tabbing smarter will realize you have 2 vs 4
opt.softtabstop    = 2 --- Insert 2 spaces for a tab
opt.splitright     = true --- Vertical splits will automatically be to the right
opt.swapfile       = false --- Swap not needed
opt.tabstop        = 2 --- Insert 2 spaces for a tab
opt.termguicolors  = true --- Correct terminal colors
opt.timeoutlen     = 200 --- Faster completion (cannot be lower than 200 because then commenting doesn't work)
opt.undofile       = true --- Sets undo to file
opt.updatetime     = 100 --- Faster completion
opt.viminfo        = "'1000" --- Increase the size of file history
opt.wrap           = false --- Display long lines as just one line
opt.writebackup    = false --- Not needed
-- Neovim defaults
opt.autoindent     = true --- Good auto indent
opt.backspace      = "indent,eol,start" --- Making sure backspace works
opt.backup         = false --- Recommended by coc
opt.conceallevel   = 0 --- Show `` in markdown files
opt.errorbells     = false --- Disables sound effect for errors
opt.incsearch      = true --- Start searching before pressing enter
opt.showmode       = false --- Don't show things like -- INSERT -- anymore
opt.mousemoveevent = true --- Used to BufferLine mouse hover

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }

-- Add asterisks in block comments
opt.formatoptions:append { 'r' }

--theme
vim.cmd([[colorscheme tokyonight-night]])

-- Auto Compile
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
