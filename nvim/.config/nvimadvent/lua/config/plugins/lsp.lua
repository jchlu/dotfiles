return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'saghen/blink.cmp' },
    {
      "folke/lazydev.nvim",
      -- ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    local capabilitites = require('blink.cmp').get_lsp_capabilities()
    require 'lspconfig'.pyright.setup {}
    require 'lspconfig'.lua_ls.setup { capabilitites = capabilitites }
    require 'lspconfig'.tailwindcss.setup {}
    require 'lspconfig'.intelephense.setup({
      root_dir = function()
        return vim.loop.cwd()
      end,
      filetypes = { "php", "blade", "php_only" },
      settings = {
        intelephense = {
          filetypes = { "php", "blade", "php_only" },
          files = {
            associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
            maxSize = 5000000,
          },
        },
      },
    })
    require 'lspconfig'.astro.setup {}
    -- require 'lspconfig'.phpactor.setup {}
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        if client:supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            end,
          })
        end
      end,
    })
    require 'lspconfig'.emmet_ls.setup({
      -- on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
      init_options = {
        html = {
          options = {
            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
            ["bem.enabled"] = true,
          },
        },
      }
    })
  end,
}
