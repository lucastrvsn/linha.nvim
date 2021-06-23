local M = {}

-- Execute the highlight
local attach_highlight = function(highlight)
  assert(type(highlight) == "string")
  vim.cmd(highlight)
end

--- Append a prefix and returns it
-- @return string
local create_highlight_name = function(group)
  local group_name = "Linha" .. group

  return group_name
end

--- Returns a empty highlight group
-- @return string
local create_highlight_from_empty = function(group)
  local highlight = "highlight " .. group .. " guifg=NONE guibg=NONE"

  return highlight
end

--- Returns a highlight group linking to another group
-- @return string
local create_highlight_from_string = function(group, style)
  -- TODO(lucastrvsn): better naming to this
  local highlight = "highlight link " .. group .. " " .. style

  return highlight
end

--- Returns a highlight group creating a new group for it
-- @return string
local create_highlight_from_table = function(group, style)
  local highlight = "highlight " .. group

  if style.fg then
    highlight = highlight .. " guifg=" .. style.fg
  end

  if style.bg then
    highlight = highlight .. " guibg=" .. style.bg
  end

  if style.style then
    highlight = highlight .. " gui=" .. style.style
  end

  return highlight
end

--- Creates a highlight group and caches it
-- @param table | string
-- @return string The generated highlight group
M.create_highlight = function(group, style)
  local group_name = create_highlight_name(group)
  local style_type = type(style)

  if style_type == "nil" then
    attach_highlight(create_highlight_from_empty(group_name))
    return group_name
  end

  assert(
    style_type == "string" or style_type == "table",
    'Linha: "highlight" needs to an string or table.'
  )

  -- REVIEW(lucastrvsn): this can be simplified
  if style_type == "string" then
    attach_highlight(create_highlight_from_string(group_name, style))
  elseif style_type == "table" then
    attach_highlight(create_highlight_from_table(group_name, style))
  end

  return group_name
end

--- Create the theme for all highlights
-- @param table Theme
M.init = function(theme)
  local t = theme or require("linha/defaults").theme

  for k, v in pairs(t) do
    M.create_highlight(k, v)
  end
end

return M
