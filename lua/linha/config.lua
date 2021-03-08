local M = {}

M.config = {}
M.modules_active_left = {}
M.modules_active_right = {}
M.modules_inactive_left = {}
M.modules_inactive_right = {}

--- Parse the suffix and prefix addons.
-- @param name string Module name
-- @return prefix, suffix
local parse_addons = function(name, prefix, suffix)
  local addon_prefix = nil
  local addon_suffix = nil

  if prefix ~= nil then
    if type(prefix) == 'string' then
      addon_prefix = prefix
    elseif type(prefix) == 'table' then
      addon_prefix = { content = suffix.content }

      if prefix.highlight ~= nil then
        addon_prefix['highlight'] = require('linha/highlight')
          .create_highlight(name .. 'Prefix', prefix.highlight)
      end
    end
  end

  if suffix ~= nil then
    if type(suffix) == 'string' then
      addon_suffix = suffix
    elseif type(suffix) == 'table' then
      addon_suffix = { content = suffix.content }

      if suffix.highlight ~= nil then
        addon_suffix['highlight'] = require('linha/highlight')
          .create_highlight(name .. 'Suffix', suffix.highlight)
      end
    end
  end

  return addon_prefix, addon_suffix
end

local parse_module = function(module, prefix)
  local module_name = prefix .. module.name
  local m = { module = module.module }
  local module_prefix, module_suffix = parse_addons(module_name,
    module.prefix,
    module.suffix
  )

  if module.highlight ~= nil then
    m['highlight'] = require('linha/highlight').create_highlight(
      module_name,
      module.highlight
    )
  end

  if module_prefix ~= nil then
    m['prefix'] = module_prefix
  end

  if module_suffix ~= nil then
    m['suffix'] = module_suffix
  end

  return m
end

local parse_modules = function(modules)
  local modules_left = {}
  local modules_right = {}

  for _, module in pairs(modules.left) do
    table.insert(modules_left, parse_module(module, 'Left'))
  end

  for _, module in pairs(modules.right) do
    table.insert(modules_right, parse_module(module, 'Right'))
  end

  return modules_left, modules_right
end

M.create_config = function(config)
  M.config = config or require('linha/defaults').config
  M.modules_active_left, M.modules_active_right = parse_modules(
    M.config['active']
  )
  M.modules_inactive_left, M.modules_inactive_right = parse_modules(
    M.config['inactive']
  )
end

return M
