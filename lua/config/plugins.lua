local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  vim.cmd [[!git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim]]
  return
end
-- vim.api.nvim_command("packadd packer.nvim")
vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim' -- Common utilities
  use { 'goolord/alpha-nvim' } -- Dashboard


  -- Completions
  --  use({
  --    "hrsh7th/nvim-cmp",
  --    requires = {
  --      { "hrsh7th/cmp-nvim-lsp" }, -- nvim-cmp source for neovim's built-in LSP
  --      { "hrsh7th/cmp-nvim-lua" },
  --      { "hrsh7th/cmp-buffer" }, -- nvim-cmp source for buffer words
  --      { "hrsh7th/cmp-path" },
  --      { "hrsh7th/cmp-cmdline" },
  --      { "hrsh7th/vim-vsnip" },
  --      { "hrsh7th/cmp-vsnip" },
  --      { "hrsh7th/vim-vsnip-integ" },
  --      { "hrsh7th/cmp-calc" },
  --      { "rafamadriz/friendly-snippets" },
  --    },
  --  })


  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- LSP
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'neovim/nvim-lspconfig' -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'princejoogie/tailwind-highlight.nvim'
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'L3MON4D3/LuaSnip'


  -- Toggle Terminal
  -- use 'akinsho/toggleterm.nvim'
  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }

  -- File Search
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- use({
  --   "nvim-telescope/telescope.nvim",
  --   requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
  --   cmd = "Telescope",
  -- })

  --  use { 'nvim-telescope/telescope-file-browser.nvim' }

  --  use { 'stevearc/dressing.nvim', requires = 'MunifTanjim/nui.nvim' } -- Use with session-manager
  --  use 'Shatur/neovim-session-manager'

  use 'folke/zen-mode.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use { 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons' }

  -- Git
  -- use 'github/copilot.vim'
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browser

  -- Color Scheme
  use { 'folke/tokyonight.nvim' }
  use 'norcalli/nvim-colorizer.lua'
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'lukas-reineke/indent-blankline.nvim' -- Ident Line
  use { 'p00f/nvim-ts-rainbow', after = { 'nvim-treesitter' } } -- Colors Brackets
  use { 'numToStr/Comment.nvim' }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use {
    'nvim-tree/nvim-tree.lua', --File dir
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
end)
