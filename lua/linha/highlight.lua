local M = {}

local create_highlight_name = function(group)
  return 'Linha' .. group
end

local create_highlight_from_empty = function(group)
  local highlight = 'highlight ' .. group .. ' guifg=NONE guibg=NONE'

  vim.cmd(highlight)
end

--- Returns a highlight string linking to another group
-- @return string
local create_highlight_from_string = function(group, style)
  local highlight = 'highlight link ' .. group .. ' ' .. style

  vim.cmd(highlight)
end

--- Returns a highlight string creating a new group for it
-- @return string
local create_highlight_from_table = function(group, style)
  local highlight = 'highlight ' .. group

  if style.fg then
    highlight = highlight .. ' guifg=' .. style.fg
  end

  if style.bg then
    highlight = highlight .. ' guibg=' .. style.bg
  end

  if style.style then
    highlight = highlight .. ' gui=' .. style.style
  end

  vim.cmd(highlight)
end

--- Creates a highlight group and caches it
-- @param table | string
-- @return string The generated highlight group
M.create_highlight = function(group, style)
  local group_name = create_highlight_name(group)
  local style_type = type(style)

  if style_type == 'nil' then
    create_highlight_from_empty(group_name)
    return group_name
  end

  assert(
    style_type == 'string' or style_type == 'table',
    'Linha: "highlight" needs to an string or table.'
  )

  if style_type == 'string' then
    create_highlight_from_string(group_name, style)
  elseif style_type == 'table' then
    create_highlight_from_table(group_name, style)
  end

  return group_name
end

--- Create the theme for all highlights
-- @param table Theme
M.create_theme = function(theme)
  local t = theme or require('linha/defaults').theme

  for k, v in pairs(t) do
    M.create_highlight(k, v)
  end
end

return M
