local wezterm = require('wezterm')
local colors = require('colors')

return {
  ['Kanagawa'] = {

    foreground = '#dcd7ba',
    background = '#1f1f28',

    cursor_bg = '#c8c093',
    cursor_fg = '#c8c093',
    cursor_border = '#c8c093',

    selection_fg = '#c8c093',
    selection_bg = '#2d4f67',

    scrollbar_thumb = '#16161d',
    split = '#16161d',

    ansi = {'#090618', '#c34043', '#76946a', '#c0a36e', '#7e9cd8', '#957fb8', '#6a9589', '#c8c093'},
    brights = {'#727169', '#e82424', '#98bb6c', '#e6c384', '#7fb4ca', '#938aa9', '#7aa89f', '#dcd7ba'},
    indexed = {[16] = '#ffa066', [17] = '#ff5d62'},
  },
  ['Gruvbox Material Dark'] = {
    background = colors.dark_palette.bg0,
    foreground = colors.dark_palette.fg0,
    cursor_bg = colors.dark_palette.fg0,
    cursor_fg = colors.dark_palette.bg0,
    scrollbar_thumb = colors.dark_palette.bg5,

    ansi = {
      colors.dark_palette.bg0,
      colors.dark_palette.red,
      colors.dark_palette.green,
      colors.dark_palette.yellow,
      colors.dark_palette.blue,
      colors.dark_palette.purple,
      colors.dark_palette.aqua,
      '#ffffff',
    },
    brights = {
      '#706f8c',
      colors.dark_palette.red,
      colors.dark_palette.green,
      colors.dark_palette.yellow,
      colors.dark_palette.blue,
      colors.dark_palette.purple,
      colors.dark_palette.aqua,
      '#ffffff',
    },

    tab_bar = {
      background = colors.dark_palette.bg3,
      active_tab = {
        bg_color = colors.dark_palette.bg3,
        fg_color = colors.dark_palette.purple,
      },
      inactive_tab = {
        bg_color = colors.dark_palette.bg3,
        fg_color = colors.dark_palette.fg0,
      },
    },
  },

  ['Gruvbox Material Light'] = {
    background = colors.light_palette.bg0,
    foreground = colors.light_palette.fg0,
    cursor_bg = colors.light_palette.fg0,
    cursor_fg = colors.light_palette.bg_dim,
    scrollbar_thumb = colors.dark_palette.bg5,

    ansi = {
      colors.light_palette.fg0,
      colors.light_palette.red,
      colors.light_palette.green,
      colors.light_palette.yellow,
      colors.light_palette.blue,
      colors.light_palette.purple,
      colors.light_palette.aqua,
      '#ffffff',
    },
    brights = {
      '#706f8c',
      colors.light_palette.red,
      colors.light_palette.green,
      colors.light_palette.yellow,
      colors.light_palette.blue,
      colors.light_palette.purple,
      colors.light_palette.aqua,
      '#ffffff',
    },

    tab_bar = {
      background = colors.light_palette.bg3,
      active_tab = {
        bg_color = colors.light_palette.bg3,
        fg_color = colors.light_palette.purple,
      },
      inactive_tab = {
        bg_color = colors.light_palette.bg3,
        fg_color = colors.light_palette.fg0,
      },
    },

  },
  ['Nordic'] = {
    foreground    = '#D8DEE9',
    background    = '#242933',
    cursor_bg     = '#D8DEE9',
    cursor_border = '#D8DEE9',
    cursor_fg     = '#242933',
    selection_fg  = '#D8DEE9',
    selection_bg  = '#2E3440',
    ansi          = {'#191D24', '#BF616A', '#A3BE8C', '#EBCB8B', '#81A1C1', '#B48EAD', '#8FBCBB', '#D8DEE9',},
    brights       = {'#3B4252', '#D06F79', '#B1D196', '#F0D399', '#88C0D0', '#C895BF', '#93CCDC', '#E5E9F0',},
    tab_bar       = {
      background = '#242933',
      active_tab = {
        bg_color = '#242933',
        fg_color = '#D8DEE9',
        intensity = 'Normal',
        italic = false,
        strikethrough = false,
        underline = 'None',
      },
      inactive_tab = {
        bg_color = '#2E3440',
        fg_color = '#D8DEE9',
        intensity = 'Normal',
        italic = false,
        strikethrough = false,
        underline = 'None',
      },
      new_tab = {
        bg_color = '#242933',
        fg_color = '#D8DEE9',
        intensity = 'Normal',
        italic = false,
        strikethrough = false,
        underline = 'None',
      }
    }
  },

  ['Oxocarbon'] = {
    background = '#161616',
    foreground = '#ffffff',
    cursor_bg = '#ffffff',
    cursor_border = '#ffffff',
    cursor_fg = '#161616',
    ansi = {
      '#262626',
      '#ee5396',
      '#42be65',
      '#ffe97b',
      '#33b1ff',
      '#ff7eb6',
      '#3ddbd9',
      '#dde1e6',
    },
    brights = {
      '#393939',
      '#ee5396',
      '#42be65',
      '#ffe97b',
      '#33b1ff',
      '#ff7eb6',
      '#3ddbd9',
      '#ffffff',
    },
    tab_bar = {
      background = '#262626',
      active_tab = {
        bg_color = '#161616',
        fg_color = '#ffffff',
        intensity = 'Normal',
        italic = false,
        strikethrough = false,
        underline = 'None',
      },
      inactive_tab = {
        bg_color = '#262626',
        fg_color = '#ffffff',
        intensity = 'Normal',
        italic = false,
        strikethrough = false,
        underline = 'None',
      },
      new_tab = {
        bg_color = '#262626',
        fg_color = '#ffffff',
        intensity = 'Normal',
        italic = false,
        strikethrough = false,
        underline = 'None',
      }
    }
  },
  ['Melange'] = {
    foreground    = '#ECE1D7',
    background    = '#292522',
    cursor_bg     = '#ECE1D7',
    cursor_border = '#ECE1D7',
    cursor_fg     = '#292522',
    selection_bg  = '#403A36',
    selection_fg  = '#ECE1D7',
    ansi          = {
      '#34302C',
      '#BD8183',
      '#78997A',
      '#E49B5D',
      '#7F91B2',
      '#B380B0',
      '#7B9695',
      '#C1A78E'
    },
    brights       = {
      '#867462',
      '#D47766',
      '#85B695',
      '#EBC06D',
      '#A3A9CE',
      '#CF9BC2',
      '#89B3B6',
      '#ECE1D7'
    },

    tab_bar       = {
      background = '#292522',
      active_tab = {
        bg_color = '#292522',
        fg_color = '#ECE1D7',
        intensity = 'Normal',
        italic = false,
        strikethrough = false,
        underline = 'None',
      },
      inactive_tab = {
        bg_color = '#403A36',
        fg_color = '#ECE1D7',
        intensity = 'Normal',
        italic = false,
        strikethrough = false,
        underline = 'None',
      },
      new_tab = {
        bg_color = '#292522',
        fg_color = '#ECE1D7',
        intensity = 'Normal',
        italic = false,
        strikethrough = false,
        underline = 'None',
      }
    }
  }
}
