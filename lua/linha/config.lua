local get_module = require('linha/modules').get_module
local create_highlight = require('linha/highlight').create_highlight

local M = {}

M.modules_active_left = {}
M.modules_active_right = {}
M.modules_inactive_left = {}
M.modules_inactive_right = {}

--- Parse the `before` and `after` addons.
-- @param name string Module name
-- @return before, after
local parse_addons = function(name, before, after)
  local addon_before = nil
  local addon_after = nil

  if before ~= nil then
    if type(before) == 'string' then
      addon_before = before
    elseif type(before) == 'table' then
      addon_before = { content = before.content }

      if before.highlight ~= nil then
        addon_before['highlight'] = create_highlight(
          name .. 'Before',
          before.highlight
        )
      end
    end
  end

  if after ~= nil then
    if type(after) == 'string' then
      addon_after = after
    elseif type(after) == 'table' then
      addon_after = { content = after.content }

      if after.highlight ~= nil then
        addon_after['highlight'] = create_highlight(
          name .. 'After',
          after.highlight
        )
      end
    end
  end

  return addon_before, addon_after
end

local parse_module = function(name, module, prefix)
  local module_name = prefix .. name
  local m = {
    _group_name = module_name,
    provider = module.provider
  }
  local module_before, module_after = parse_addons(module_name,
    module.before,
    module.after
  )

  if module.highlight ~= nil then
    m['highlight'] = create_highlight(module_name, module.highlight)
  end

  if module_before ~= nil then
    m['before'] = module_before
  end

  if module_after ~= nil then
    m['after'] = module_after
  end

  return m
end

local parse = function(modules)
  local modules_left = {}
  local modules_right = {}
  local is_right_side = false

  for _, name in ipairs(vim.split(modules, '|')) do
    if name == '=' then
      is_right_side = true
      goto continue
    end

    local module = get_module(name)

    if module ~= nil then
      if not is_right_side then
        table.insert(modules_left, parse_module(name, module, 'Left'))
      else
        table.insert(modules_right, parse_module(name, module, 'Right'))
      end
    end

    ::continue::
  end

  return modules_left, modules_right
end

--- Initialize the configuration used by all other modules
-- @param builder table
M.init = function(opts)
  opts = opts or {}

  local active_builder = opts.active or require('linha/defaults').builder.active
  local inactive_builder = opts.inactive or require('linha/defaults').builder.inactive

  M.modules_active_left, M.modules_active_right = parse(active_builder)
  M.modules_inactive_left, M.modules_inactive_right = parse(inactive_builder)
end

return M
