return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 50000,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        -- lua = { "stylua" },
        -- Conform will build multiple formatters sequentially
        -- python = { "isort", "black" },
        -- Use a sub-list to build only the first available formatter
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        blade = { "blade-formatter" },
      }
    })
    -- stopinsert
    vim.keymap.set("i", "<C-s>", function()
      vim.cmd "stopinsert"
      conform.format()
      vim.cmd "update"
    end, { desc = "Format file or range (in visual mode) and save file" })
    vim.keymap.set({ "n", "v" }, "<C-s>", function()
      conform.format()
      vim.cmd "update"
    end, { desc = "Format file or range (in visual mode) and save file" })
    vim.keymap.set({ "n", "v" }, "<leader>ff", function()
      conform.format()
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
