-- [ Galaxyline ]

MUtils.plugin_loaded('galaxyline')

local gl = require('galaxyline')
local gls = gl.section

gl.short_line_list = {'NvimTree', 'vista', 'dbui'}

local colors = {
  base00  = '#232227',
  base01  = '#38383c',
  base02  = '#4e4e52',
  base03  = '#6b5c7c',
  base04  = '#837593',
  base05  = '#9d8fa9',
  base06  = '#b7acbf',
  base07  = '#d2ccd6',
  red     = '#f63d81',
  pink    = '#fc65b0',
  orange  = '#f5939c',
  yellow  = '#e8ec77',
  green   = '#2dcbb0',
  blue    = '#57bbf4',
  magenta = '#a89bee',
  cyan    = '#4db9c8',
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then return true end
  return false
end

local checkwidth = function()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then return true end
  return false
end

-- [ LEFT ]

gls.left[1] = {
  ViMode = {
    provider = function()
      local mode = {
        n      = {color = colors.yellow,   name = 'N'},
        i      = {color = colors.pink,  name = 'I'},
        v      = {color = colors.green,    name = 'V'},
        [''] = {color = colors.green,    name = 'V'},
        V      = {color = colors.green,    name = 'V'},
        c      = {color = colors.orange,  name = 'C'},
        no     = {color = colors.yellow,   name = 'No'},
        s      = {color = colors.red,     name = 'S'},
        S      = {color = colors.red,     name = 'S'},
        [''] = {color = colors.red,     name = 'S'},
        ic     = {color = colors.pink,  name = 'Ic'},
        R      = {color = colors.blue,    name = 'R'},
        Rv     = {color = colors.blue,    name = 'R'},
        cv     = {color = colors.orange,  name = 'Cv'},
        ce     = {color = colors.orange,  name = 'Ce'},
        r      = {color = colors.cyan,    name = 'R'},
        rm     = {color = colors.cyan,    name = 'Rm'},
        ['r?'] = {color = colors.cyan,    name = 'R?'},
        ['!']  = {color = colors.magenta, name = '!'},
        t      = {color = colors.magenta, name = 'T'},
      }
      vim.api
        .nvim_command('hi GalaxyViMode guifg=' .. mode[vim.fn.mode()].color)
      return ' ' .. mode[vim.fn.mode()].name .. '  '
    end,
    highlight = {colors.red, colors.base00, 'bold'},
  },
}

gls.left[2] = {
  FileName = {
    provider = function()
      local fileinfo = require('galaxyline.provider_fileinfo')
      local filename = fileinfo.get_current_file_name()
      local fileicon = fileinfo.get_file_icon()
      local str = '[ %s %s]'
      return str:format(fileicon, filename)
    end,
    condition = buffer_not_empty,
    highlight = {colors.blue, colors.base00},
  },
}

gls.left[3] = {
  GitStart = {
    provider = function() return '  ( ' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.base05, colors.base00},
  },
}

gls.left[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    icon = ' ',
    highlight = {colors.base05, colors.base00},
  },
}

gls.left[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' +',
    highlight = {colors.base05, colors.base00},
  },
}
gls.left[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' »',
    highlight = {colors.base05, colors.base00},
  },
}
gls.left[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ✗',
    highlight = {colors.base05, colors.base00},
  },
}

gls.left[8] = {
  GitEnd = {
    provider = function() return ' )' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.base05, colors.base00},
  },
}

-- [ RIGHT ]

gls.right[1] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.pink, colors.base00},
  },
}
gls.right[2] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow, colors.base00},
  },
}

gls.right[3] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.blue, colors.base00},
  },
}

gls.right[4] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.cyan, colors.base00},
  },
}

gls.right[5] = {
  LineTotal = {
    provider = function()
      local line = vim.fn.line('.')
      local col = vim.fn.col('.')
      local total = vim.fn.line('$')
      local str = '   %d/%d  %d'
      return str:format(line, total, col)
    end,
    condition = buffer_not_empty,
    highlight = {colors.base05, colors.base00},
  },
}

-- [ SHORT ]

gls.short_line_left[3] = {
  SFileName = {
        provider = function()
      local fileinfo = require('galaxyline.provider_fileinfo')
      local filename = fileinfo.get_current_file_name()
      local fileicon = fileinfo.get_file_icon()
      local str = '[ %s %s]'
      return str:format(fileicon, filename)
    end,
    condition = buffer_not_empty,
    highlight = {colors.base05, colors.base00},
  },
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = 'BufferIcon',
    highlight = {colors.base05, colors.base00},
  },
}
