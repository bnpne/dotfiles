return {
  'stevearc/conform.nvim',
  event = 'LspAttach',
  opts = {
    quiet = true,
    formatters_by_ft = {
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      json = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      scss = { 'prettier' },
      markdown = { 'prettier' },
      yaml = { 'prettier' },
      sh = { 'beautysh' },
      zsh = { 'beautysh' },
      php = { 'php-cs-fixer' }
    },
    format_on_save = function(bufnr)
      -- Disable autoformat for files in a certain path
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match('/node_modules/') then
        return
      end

      return { timeout_ms = 500, lsp_fallback = true, async = false }
    end,
    format_after_save = { lsp_fallback = true },
    notify_on_error = true
  },
  config = function(_, opts)
    local conform = require('conform')
    local util = require('conform.util')

    conform.setup(opts)

    -- PHP
    conform.formatters = {
      ['php-cs-fixer'] = {
        command = "php-cs-fixer",
        args = {
          "fix",
          "--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
          "$FILENAME",
        },
        stdin = false,
      },
    }

    -- Customize prettier args
    require('conform.formatters.prettier').args = function(ctx)
      local args = { '--stdin-filepath', '$FILENAME' }
      local localPrettierConfig = vim.fs.find('.prettierrc.json', {
        upward = true,
        path = ctx.dirname,
        type = 'file'
      })[1]
      local globalPrettierConfig = vim.fs.find('.prettierrc.json', {
        path = vim.fn.expand('~/.config/nvim'),
        type = 'file'
      })[1]

      -- Project config takes precedence over global config
      if localPrettierConfig then
        vim.list_extend(args, { '--config', localPrettierConfig })
      elseif globalPrettierConfig then
        vim.list_extend(args, { '--config', globalPrettierConfig })
      end

      local isUsingTailwind = vim.fs.find('tailwind.config.js', {
        upward = true,
        path = ctx.dirname,
        type = 'file'
      })[1]
      local localTailwindcssPlugin = vim.fs.find('node_modules/prettier-plugin-tailwindcss/dist/index.mjs', {
        upward = true,
        path = ctx.dirname,
        type = 'file'
      })[1]

      if localTailwindcssPlugin then
        vim.list_extend(args, { '--plugin', localTailwindcssPlugin })
      else
        if isUsingTailwind then
          vim.notify(
            'Tailwind was detected for your project. You can really benefit from automatic class sorting. Please run npm i -D prettier-plugin-tailwindcss',
            vim.log.levels.WARN)
        end
      end

      return args
    end

    conform.formatters.beautysh = {
      prepend_args = function()
        return { '--indent-size', '2', '--force-function-style', 'fnpar' }
      end
    }
  end,
}
