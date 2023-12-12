return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    event = 'BufAdd',
    opts = {
      variant = 'auto',
      dark_variant = 'moon',
      disable_background = true,
      disable_float_background = true,
      disable_italics = true,
      highlight_groups = {
        FloatBorder = {fg = 'subtle', bg = 'none'},
        TelescopeBorder = {fg = 'subtle', bg = 'none'},
        TelescopeNormal = {fg = 'none'},
        TelescopePromptNormal = {bg = 'none'},
        TelescopeResultsNormal = {fg = 'subtle', bg = 'none'},
        TelescopeSelection = {fg = 'text', bg = 'text', blend = 10},
        TelescopeSelectionCaret = {fg = 'base', bg = 'text'},
        Cursor = {fg = 'base', bg = 'text'},
        ColorColumn = {bg = 'rose'},
        CursorLine = {bg = 'text', blend = 30},
        StatusLine = {fg = 'love', bg = 'love', blend = 10},
        StatusLineNC = {fg = 'subtle', bg = 'surface'},
        GitSignsAdd = {fg = 'iris', bg = 'none'},
        GitSignsChange = {fg = 'foam', bg = 'none'},
        GitSignsDelete = {fg = 'rose', bg = 'none'},
      }
    },
  },

  {
    'ellisonleao/gruvbox.nvim',
    name = 'gruvbox',
    priority = 1000,
    config = true,
    opts = {
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true,      -- invert background for search, diffs, statuslines and errors
      contrast = 'medium', -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,

    },
    config = function()
      -- vim.cmd([[colorscheme gruvbox]])
    end


  },

  {
    'sainnhe/gruvbox-material',
    name = 'gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      -- Fonts
      vim.g.gruvbox_material_disable_italic_comment = 1
      vim.g.gruvbox_material_enable_italic = 0
      vim.g.gruvbox_material_enable_bold = 0
      vim.g.gruvbox_material_transparent_background = 1
      -- Themes
      vim.g.gruvbox_material_foreground = 'mix'
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_ui_contrast = 'flat' -- The contrast of line numbers, indent lines, etc.
      vim.g.gruvbox_material_float_style = 'dim'  -- Background of floating windows

      -- vim.cmd.colorscheme('gruvbox-material')     -- For highlights customizations go to lua/core/highlights
    end
  },
  {
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    lazy = false,
    priority = 1000,
    opts = {
      compile = false,
      undercurl = true, -- enable undercurls
      commentStyle = {italic = true},
      functionStyle = {},
      keywordStyle = {italic = true},
      statementStyle = {bold = true},
      typeStyle = {},
      transparent = true,    -- do not set background color
      dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {             -- add/modify theme and palette colors
        palette = {},
        theme = {wave = {}, lotus = {}, dragon = {}, all = {}},
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = 'dragon',  -- Load "wave" theme when 'background' option is not set
      background = {     -- map the value of 'background' option to a theme
        dark = 'dragon', -- try "dragon" !
        light = 'lotus'
      },
    },
    config = function()
      -- vim.cmd([[colorscheme kanagawa-dragon]])
    end
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
    name = 'oxocarbon',
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = 'dark'
      -- vim.cmd('colorscheme oxocarbon')
    end
  },
  {
    'AlexvZyl/nordic.nvim',
    name = 'nordic',
    lazy = false,
    priority = 1000,
    config = function()
      -- require 'nordic'.load()
      vim.cmd('colorscheme nordic')
    end
  },
  {
    'savq/melange-nvim',
    name = 'melange',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd('colorscheme melange')
    end
  }
}
