return {
  {
    "stevearc/conform.nvim",
    opts = function()
      local opts = {
        default_format_opts = {
          timeout_ms = 3000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
          lsp_format = "fallback", -- not recommended to change
        },
        formatters_by_ft = {
          lua = { "stylua" },
          fish = { "fish_indent" },
          sh = { "shfmt" },
          javascript = { "prettier" },
          tsx = { "prettier" },
          typescript = { "prettier" },
          jsx = { "prettier" },
          scss = { "prettier" },
          typescriptreact = { "prettier" },
          javascriptreact = { "prettier" },
        },
        -- The options you set here will be merged with the builtin formatters.
        -- You can also define any custom formatters here.
        formatters = {
          injected = { options = { ignore_errors = true } },
          -- # Example of using dprint only when a dprint.json file is present
          -- dprint = {
          --   condition = function(ctx)
          --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
          --   end,
          -- },
          --
          -- # Example of using shfmt with extra args
          -- shfmt = {
          --   prepend_args = { "-i", "2", "-ci" },
          -- },
          prettier = {
            command = "prettier", -- Ensure Prettier is installed globally or locally
            args = { "--stdin-filepath", "$FILENAME" },
            stdin = true,
          }, --
        },
      }
      return opts
    end,
  },
}
