---
-- Snippet engine
---

require('luasnip.loaders.from_vscode').lazy_load()

---
-- Before start, nvim-cmp, set completeopt with the following values
---

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

---
-- To configure nvim-cmp we will use two modules cmp and luasnip
---

local status, cmp = pcall(require, "cmp")
if (not status) then return end

local luasnip = require('luasnip')
local lspkind = require 'lspkind'
local tabnine = require('cmp_tabnine.config')

---
-- nvim-cmp doesn't "know" how to expand a snippet, that's why we need luasnip
---

local select_opts = { behavior = cmp.SelectBehavior.Select }

---
-- Tabnine
---

tabnine:setup({
  max_lines = 1000;
  max_num_results = 20;
  sort = true;
  run_on_every_keystroke = true;
  snippet_placeholder = '..';
})

---
-- nvim-cmp's options
---

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'cmp_tabnine' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'nvim_lua' },
  },
  window = {
    documentation = cmp.config.window.bordered(),
    border = 'rounded'
  },
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    ['<C-d>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
})


--local sign = function(opts)
--  vim.fn.sign_define(opts.name, {
--    texthl = opts.name,
--    text = opts.text,
--    numhl = ''
--  })
--end

--sign({name = 'DiagnosticSignError', text = '✘'})
--sign({name = 'DiagnosticSignWarn', text = '▲'})
--sign({name = 'DiagnosticSignHint', text = '⚑'})
--sign({name = 'DiagnosticSignInfo', text = ''})


-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end


vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})


-- Add help windows border
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
})
