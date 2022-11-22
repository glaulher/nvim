# Config Neovim in Lua

Neovim-based text editor is a big part of my workflow as a developer. I will keep improving it to fit future projects.

---

**Demo the Inline Diagnostics in Hover Window Provided by nvim-lspconfig Plugin** 
![1_qC1md6d-XMzci9wNCw79yw](https://user-images.githubusercontent.com/93111441/195991340-32713056-2500-4f2e-bd03-4ad845b10f5d.gif)

**Demo the Highly Performant LSP UI Provided by Lspsaga Plugin**  
![lspsaga-tsx-keystrokes](https://user-images.githubusercontent.com/93111441/195991360-6d2949d0-39ae-4c0a-b2b9-2f93e475c6fd.gif)  

---

## Neovim Plugins

Requirements: Neovim | Lua  

- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) - A plugin manager for Neovim
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins.
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - A blazing fast and easy to configure Neovim statusline written in Lua
- [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim) - VSCode-like pictograms
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet Engine for Neovim written in Lua
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - nvim-cmp source for neovim's built-in LSP
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - nvim-cmp source for buffer words
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine plugin for neovim written in Lua
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of configurations for Neovim's built-in LSP
- [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
- [glepnir/lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) - A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - [Treesitter](https://github.com/tree-sitter/tree-sitter) configurations and abstraction layer for Neovim
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - Lua `fork` of vim-web-devicons for neovim
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - A highly extendable fuzzy finder over lists
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autopairs
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Use treesitter to auto close and auto rename html tag
- [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) - A high-performance color highlighter
- [akinsho/nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua) - A snazzy bufferline
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git integration for buffers
- [dinhhuy258/git.nvim](https://github.com/dinhhuy258/git.nvim) - A simple clone of the plugin vim-fugitive
- [folke/zen-mode.nvim](https://github.com/folke/zen-mode.nvim) - Distraction-free mode
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) - Markdown live preview
- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim) - A lua powered greeter like vim-startify / dashboard-nvim
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - Indent guides for Neovim
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - A file explorer tree for neovim written in lua
- [p00f/nvim-ts-rainbow instead](https://github.com/p00f/nvim-ts-rainbow) - Rainbow parentheses for neovim using tree-sitter
- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) -  A neovim lua plugin to help easily manage multiple terminal windows

---

## How to use

### Install Neovim

For Linux Users:

Debian:

```bash
sudo apt install xclip fzf ripgrep build-essential
```

Download package [neovim](https://github.com/neovim/neovim/releases) open terminal:

```bash
cd ~/Downloads
sudo dpkg -i nvim-linux64.deb
```

### Download or Clone This Repo

###### Download:

- Copy all the files, subdirectories of this repo to `~/.config/nvim` folder. 

###### Clone:

```bash
git clone https://github.com/glaulher/nvim ~/.config/nvim --depth 1 && nvim
```

###### Install:

```lua
-- View error - close nvim
:q! 

-- Open nvim  
:PackerInstall
 
-- View error - close nvim
:q!
 
-- Open nvim 
:PackerSync

:TSUpdate
 
-- Close nvim and open again 
:Mason -- install eslint_d e prettier,  keys 1 - 5 navigation, position above package and press i to install.
:checkhealth   -- check if everything is ok
```



---



## About me

- [Blog Glaulher](https://glaulher.github.io/)
- [Other Blog](https://terminaldopenguin.blogspot.com/)
- [Linkedin](https://www.linkedin.com/in/glaulher-medeiros-03799967/)

---

## Useful Sources and Links

I'm inspired by [amy-juan-li](https://github.com/amy-juan-li/nvim-lua), she's inspired by  [Takuya Matsuyama](https://github.com/craftzdog/dotfiles-public) and the beautiful workflow used by your coding projects. I borrow heavily from both codes to build my current Neovim-based workflow. So check your public repositories.
