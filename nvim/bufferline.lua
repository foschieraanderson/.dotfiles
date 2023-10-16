local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",

  bufferline.setup({
    options = {
      mode = "buffers",
      separator_style = 'slant',
      always_show_bufferline = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      color_icons = true
      },
      highlights = {
        separator = {
        fg = '#073642',
        bg = '#002b36',
      },
      separator_selected = {
        fg = '#073642',
      },
      background = {
        fg = '#657b83',
        bg = '#002b36'
      },
      buffer_selected = {
        fg = '#fdf6e3',
        bold = true,
      },
      fill = {
        bg = '#073642'
      }
    },
  })

  -- set keymaps
  local keymap = vim.keymap
  
  keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { silent = true })
  keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { silent = true })
  keymap.set('n', '<A-S-Left>', ':BufferLineMovePrev<CR>', { silent = true })
  keymap.set('n', '<A-S-Right>', ':BufferLineMoveNext<CR>', { silent = true })

}
