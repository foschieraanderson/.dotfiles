local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

require("nvim-lsp-installer").setup({
    ensure_installed = { 'pyright', 'rust_analyzer', 'tsserver', 'html', 'cssls', 'diagnosticls', 'emmet_ls', 'jedi_language_server', 'jsonls', 'lemminx', 'pylsp', 'dockerls', 'elixirls', 'spectral', 'sumneko_lua', 'graphql', 'zk', 'rome', 'tailwindcss', 'vuels' }, -- ensure these servers are always installed
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
