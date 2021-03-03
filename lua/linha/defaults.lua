local modules = require('linha/modules')

local M = {}

M.config = {
  active = {
    left = {
      {
        name = 'Mode',
        module = modules.mode,
        highlight = { fg = '#ffffff', bg = '#000000' }
      },
      {
        name = 'ModeTest',
        module = function()
          return vim.fn.mode()
        end
      },
      {
        name = 'FileName',
        module = modules.filename,
        highlight = { fg = '#ffff00' }
      },
      {
        name = 'BufferNumber',
        module = modules.buffernumber,
        highlight = { fg = '#ff0000' }
      },
      {
        name = 'BufferStatus',
        module = modules.bufferstatus,
        highlight = 'Number'
      },
      {
        name = 'Diagnostics',
        module = modules.diagnostics
      },
      {
        name = 'ShellCommand',
        module = function()
          return 'olá', { fg = '#e0e0e0', bg = '#ff00ff' }
        end
      }
    },
    right = {
      {
        name = 'FileType',
        module = modules.filetype
      }
    }
  },
  inactive = {}
}

M.theme = {
  ['ModeNormal'] = {
    fg = '#00ff00',
    bg = '#ff00ff',
  },
  ['ModeVisual'] = {
    fg = '#00ff00',
    bg = '#ff00ff',
  },
  ['ModeSelect'] = {
    fg = '#00ff00',
    bg = '#ff00ff',
  },
  ['ModeInsert'] = {
    fg = '#00ff00',
    bg = '#ff00ff',
  },
  ['ModeReplace'] = {
    fg = '#00ff00',
    bg = '#ff00ff',
  },
  ['ModeCommand'] = {
    fg = '#00ff00',
    bg = '#ff00ff',
  },
  ['ModePrompt'] = {
    fg = '#00ff00',
    bg = '#ff00ff',
  },
  ['ModeMore'] = {
    fg = '#00ff00',
    bg = '#ff00ff',
  },
  ['ModeConfirm'] = {
    fg = '#00ff00',
    bg = '#ff00ff',
  },
  ['ModeShell'] = {
    fg = '#00ff00',
    bg = '#ff00ff',
  },
  ['ModeTerminal'] = {
    fg = '#00ff00',
    bg = '#ff00ff',
  },
}

return M
