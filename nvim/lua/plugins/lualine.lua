return {
  'nvim-lualine/lualine.nvim',
  event = 'BufReadPre',
  dependencies = 'kyazdani42/nvim-web-devicons',
  init = function()
    vim.keymap.set('n', '<leader>l', ':lua require("lualine").refresh<CR>', { desc = 'Refresh status line' })
  end,
  opts = function()
    local lualineTheme = {}

    return {
      options = {
        theme = 'vscode',
        component_separators = '|',
        section_separators = '',
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            'mode',
            color = { gui = '' },
            padding = 0,
            fmt = function(str)
              local mode = str:sub(1, 1):upper() .. str:sub(2):lower()
              return '[' .. mode .. ']'
            end,
          }
        },
        lualine_b = {
          {
            'filename',
            file_status = true,
            path = 4,
            shorting_target = 40,
          },
          'branch',
          'diff',
        },
        lualine_c = {
          { 'diagnostics' },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          {
            'filetype',
            colored = true,
          },
          'progress',
          {
            'location',
            color = { gui = '' },
          }
        },
      },
      inactive_sections = {
        lualine_a = {
          {
            'filename',
            file_status = true,
            path = 1,
          },
          'diagnostics',
          'diff',
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {
        'trouble',
        'fzf',
      },
    }
  end,
}
