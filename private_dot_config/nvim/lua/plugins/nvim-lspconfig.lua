return {
  "neovim/nvim-lspconfig",
  config = function()
    -- require("nvim-lspconfig").setup({
    local lspconfig = require('lspconfig'),
    -- Configuration here, or leave empty to use defaults
    lspconfig.emmet_language_server.setup({})
    -- })
  end
}
