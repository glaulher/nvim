print('init.lua is loaded!')

require('config.plugins')
require('config.options')
require('config.maps')

--

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "eslint", filetypes = { "typescript", "typescriptreact" } }
-- }

-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   {
--     command = "prettier",
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
