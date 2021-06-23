local _modes = {
  ["n"] = {
    content = "normal",
    highlight = "LinhaModeNormal",
  },
  ["no"] = {
    content = "n operator pending",
    highlight = "LinhaModeNormal",
  },
  ["v"] = {
    content = "visual",
    highlight = "LinhaModeVisual",
  },
  ["V"] = {
    content = "v-line",
    highlight = "LinhaModeVisual",
  },
  [""] = {
    content = "v-block",
    highlight = "LinhaModeVisual",
  },
  ["s"] = {
    content = "select",
    highlight = "LinhaModeSelect",
  },
  ["S"] = {
    content = "s-line",
    highlight = "LinhaModeSelect",
  },
  ["^S"] = {
    content = "s-block",
    highlight = "LinhaModeSelect",
  },
  ["i"] = {
    content = "insert",
    highlight = "LinhaModeInsert",
  },
  ["ic"] = {
    content = "insert",
    highlight = "LinhaModeInsert",
  },
  ["ix"] = {
    content = "insert",
    highlight = "LinhaModeInsert",
  },
  ["R"] = {
    content = "replace",
    highlight = "LinhaModeReplace",
  },
  ["Rv"] = {
    content = "v-replace",
    highlight = "LinhaModeReplace",
  },
  ["c"] = {
    content = "command",
    highlight = "LinhaModeCommand",
  },
  ["cv"] = {
    content = "vim ex",
    highlight = "LinhaModeCommand",
  },
  ["ce"] = {
    content = "ex",
    highlight = "LinhaModeCommand",
  },
  ["r"] = {
    content = "prompt",
    highlight = "LinhaModePrompt",
  },
  ["rm"] = {
    content = "more",
    highlight = "LinhaModeMore",
  },
  ["r?"] = {
    content = "confirm",
    highlight = "LinhaModeConfirm",
  },
  ["!"] = {
    content = "shell",
    highlight = "LinhaModeShell",
  },
  ["t"] = {
    content = "terminal",
    highlight = "LinhaModeTerminal",
  },
}

local provider = function()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode = _modes[current_mode]

  if not mode then
    return "unknown"
  end

  return mode.content, mode.highlight
end

return {
  provider = provider,
  before = " ",
  after = " ",
}
