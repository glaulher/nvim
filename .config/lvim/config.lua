-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- lvim.builtin.treesitter.highlight.disable = {"verilog"}

--lvim.builtin.indentlines.options.show_trailing_blankline_indent = true
--lvim.builtin.indentlines.options.show_current_context = true

lvim.plugins = {
  {
    'mg979/vim-visual-multi',
  },
  {
    'brenoprata10/nvim-highlight-colors'
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    opts = {
      filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('local_detach_ufo', { clear = true }),
        pattern = opts.filetype_exclude,
        callback = function()
          require('ufo').detach()
        end,
      })
      vim.opt.foldcolumn = '1' -- '0' is not bad
      vim.opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
      vim.opt.foldenable = true
      vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.opt.foldlevelstart = 99
      require('ufo').setup(opts)
    end,

  }
}

require('nvim-highlight-colors').setup {}


local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint", filetypes = { "typescript", "typescriptreact" } }
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact" },
    args = {
      '--single-quote',
      '--semi',
      '--print-width=80',
      '--tab-width=2',
      '--trailing-comma=all',
      '--arrow-parens=always',
      '--end-of-line=auto'
    }
  },
}

lvim.format_on_save.enabled = true

-- "/texto a ser localizado" teclar enter depois / e enter para ir para a próxima ocorrência
-- %s/texto a trocar/trocado/g
-- zo  abre o bloco de código
-- zc fecha o bloco de código
-- alt + j ou k para movimentar a linha
-- ctrl + n igual ao ctrl + d do vscode
-- ctrl + shift + w move entre o buffer e o nvim-tree
