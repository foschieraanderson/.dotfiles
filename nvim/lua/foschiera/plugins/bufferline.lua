return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",

  after = "catppuccin",
  config = function ()
    local bufferline = require("bufferline")
    
      bufferline.setup({
        options = {
          mode = "buffers",
          separator_style = 'slope',
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          color_icons = true,
          hover = {
              enabled = true,
              delay = 200,
              reveal = {'close'}
          },
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
              if count ~= 0 then
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
              end
              
              return ""
          end,
          highlights = require("catppuccin.groups.integrations.bufferline").get(),
        },
      })

      -- set keymaps
      local keymap = vim.keymap
      keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { silent = true })
      keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { silent = true })
      keymap.set('n', '<A-S-Left>', ':BufferLineMovePrev<CR>', { silent = true })
      keymap.set('n', '<A-S-Right>', ':BufferLineMoveNext<CR>', { silent = true })

  end,
}
