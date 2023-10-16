local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

return {
  {
    "nvim-treesitter/nvim-treesitter",

    config = function()

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        -- ensure these language parsers are installed
        ensure_installed = {"python", "html"},

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = true,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        
        highlight = {
          enable = true,
          disable = {},
        },
        -- enable indentation
        indent = {
            enable = true,
            disable = {},
        },
      })
    end,
  },
}
