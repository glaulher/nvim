local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline')
local TREE_WIDTH = 40

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
--    mappings = {
--      list = {
--        { key = "u", action = "dir_up" },
--      },
--    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false, -- false = show hiden files
  },
})

--vim.api.nvim_create_autocmd("BufEnter", {
--    group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
--    pattern = "NvimTree_*",
--    callback = function()
--    local layout = vim.api.nvim_call_function("winlayout", {})
--    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
--end
--   })
