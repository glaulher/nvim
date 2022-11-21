local status, bufferline = pcall(require, "bufferline")
if (not status) then return end


bufferline.setup({
  options = {
    mode = "buffers",
    buffer_close_icon = '',
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_close_icon = false, -- | false, Show close icon in left dysplay nvim
    close_command = "bdelete! %d", -- "bd %d",
    right_mouse_command = "bdelete! %d", -- "bd %d", -- can be a string | function, see "Mouse actions"

    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
        separator = true
      }
    },
    separator_style = "slant",
    diagnostics = "nvim_lsp",
    --always_show_bufferline = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' }
    },
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or ""
      return " " .. icon .. count
    end,
    --left_mouse_command = "buffer %d",
    -- color_icons = true | false, -- whether or not to add the filetype icon highlights
    --show_buffer_icons = true | false, -- disable filetype icons for buffers
    --show_buffer_close_icons = true | false,
    --show_buffer_default_icon = true | false, -- whether or not an unrecognised filetype should show a default icon
    --custom_areas = {
    --right = function()
    --local result = {}
    --local seve = vim.diagnostic.severity
    --local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
    --local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
    --local info = #vim.diagnostic.get(0, { severity = seve.INFO })
    --local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

    --if error ~= 0 then
    --table.insert(result, { text = "  " .. error, fg = "#EC5241" })
    --end

    --if warning ~= 0 then
    --table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
    --end

    --if hint ~= 0 then
    --table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
    --end

    --if info ~= 0 then
    --table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
    --end
    --return result
    --end,
    --}

  }
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
