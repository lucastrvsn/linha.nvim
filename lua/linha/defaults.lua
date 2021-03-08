local modules = require('linha/modules')

local M = {}

local color_pallete = {
  background = "#3a3735",
  foreground = "#ddc7a1",
  red = '#ea6962',
  green = '#a9b665',
  yellow = '#d8a657',
  orange = '#e78a4e',
  blue = '#7daea3',
  magenta = '#d3869b',
  cyan = '#0e363e'
}

M.config = {
  active = {
    left = {
      {
        name = 'Mode',
        module = modules.mode,
        prefix = ' ',
        suffix = ' '
      },
      {
        name = 'Space',
        module = function() return ' ' end
      },
      -- {
      --   name = 'FileName',
      --   module = modules.filename,
      --   highlight = { fg = '#ffff00' }
      -- },
      -- {
      --   name = 'FileFullPath',
      --   module = modules.filefullpath,
      --   highlight = { fg = '#ffff00' }
      -- },
      {
        name = 'FilePath',
        module = modules.filepath,
        highlight = { fg = '#ffff00' }
      },
      {
        name = 'Space',
        module = function() return ' ' end
      },
      {
        name = 'BufferStatus',
        module = modules.bufferstatus,
        highlight = {
          fg = '#ffffff'
        }
      },
      {
        name = 'Diagnostics',
        module = modules.diagnostics
      }
    },
    right = {
      {
        name = 'FileType',
        module = modules.filetype
      },
      {
        name = 'LinePercent',
        module = modules.linepercent
      }
    }
  },
  inactive = {
    left = {
      {
        name = 'FileName',
        module = modules.filename,
      },
      {
        name = 'BufferNumber',
        module = modules.buffernumber
      },
    },
    right = {
      {
        name = 'FileType',
        module = modules.filetype
      }
    }
  }
}

M.theme = {
  ['ModeNormal'] = {
    fg = color_pallete.background,
    bg = color_pallete.foreground
  },
  ['ModeVisual'] = {
    fg = color_pallete.background,
    bg = color_pallete.magenta
  },
  ['ModeSelect'] = {
    fg = color_pallete.background,
    bg = color_pallete.foreground
  },
  ['ModeInsert'] = {
    fg = color_pallete.background,
    bg = color_pallete.blue
  },
  ['ModeReplace'] = {
    fg = color_pallete.background,
    bg = color_pallete.green
  },
  ['ModeCommand'] = {
    fg = color_pallete.background,
    bg = color_pallete.red
  },
  ['ModePrompt'] = {
    fg = color_pallete.background,
    bg = color_pallete.red
  },
  ['ModeMore'] = {
    fg = color_pallete.background,
    bg = color_pallete.red
  },
  ['ModeConfirm'] = {
    fg = color_pallete.background,
    bg = color_pallete.red
  },
  ['ModeShell'] = {
    fg = color_pallete.background,
    bg = color_pallete.red
  },
  ['ModeTerminal'] = {
    fg = color_pallete.background,
    bg = color_pallete.red
  },
}

return M
