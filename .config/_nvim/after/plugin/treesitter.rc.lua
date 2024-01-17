local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  context_commentstring = { -- Used nvim-ts-context-commentstring
    enable = true,
    config = {
      javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s',
        typescript = { __default = '// %s', __multiline = '/* %s */' }
      }
    }
  }, -- end nvim-ts-context-commentstring
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "bash",
    "json",
    "yaml",
    "css",
    "html",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "graphql",
    "regex",
    "typescript",
    "javascript",
  },
  --- Automatically install missing parsers when entering buffer
  auto_install = true,

  autotag = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
