return {
  'williamboman/mason.nvim',
  dependencies = {
    --  { 'hrsh7th/cmp-nvim-lsp' },
    { 'williamboman/mason-lspconfig.nvim' },
  },
  config = function()
    -- load mason
    local mason = require("mason")
    -- load mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✔",
          package_pending = "→",
          package_unistalled = "❌"
        }
      }
    })
    mason_lspconfig.setup({
      ensure_installed = {
        'astro',
        'html',
        'htmx',
        'ts_ls',
        'marksman',
        'tailwindcss',
        'emmet_language_server',
        'intelephense',
      },
      automatic_installation = true,
    })
  end,
}
