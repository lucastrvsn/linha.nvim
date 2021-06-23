local M = {}

local colors = {
  background = "#2d2a2a",
  foreground = "#e9d7aa",
  red = "#de6763",
  green = "#8ec07c",
  yellow = "#e5aa1f",
  blue = "#88b4a3",
  magenta = "#d4879c",
}

M.builder = {
  active = "Mode|FileName|Diagnostics|=|FileType",
  inactive = "FileName|=|FileType",
}

M.theme = {
  ModeNormal = {
    fg = colors.background,
    bg = colors.foreground,
  },
  ModeVisual = {
    fg = colors.background,
    bg = colors.magenta,
  },
  ModeSelect = {
    fg = colors.background,
    bg = colors.foreground,
  },
  ModeInsert = {
    fg = colors.foreground,
    bg = colors.blue,
  },
  ModeReplace = {
    fg = colors.background,
    bg = colors.green,
  },
  ModeCommand = {
    fg = colors.foreground,
    bg = colors.red,
  },
  ModePrompt = {
    fg = colors.foreground,
    bg = colors.red,
  },
  ModeMore = {
    fg = colors.foreground,
    bg = colors.red,
  },
  ModeConfirm = {
    fg = colors.foreground,
    bg = colors.red,
  },
  ModeShell = {
    fg = colors.foreground,
    bg = colors.red,
  },
  ModeTerminal = {
    fg = colors.foreground,
    bg = colors.red,
  },
}

return M
