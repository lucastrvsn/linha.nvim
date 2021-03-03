local create_highlight = require('linha/highlight').create_highlight

local M = {}

local build_module_string = function(content, highlight, opts)
  local string = ''

  if type(highlight) == 'string' then
    string = string .. '%#' .. highlight .. '#'
  end

  if type(content) == 'string' then
    string = string .. content
  end

  if opts then
    if type(opts.separator) == 'string' then
      string = string .. opts.separator
      string = string .. '%*'
    elseif type(opts.separator) == 'table' then
      string = string .. 'ADAD' .. opts.separator
    end
  end

  return string .. '%#LinhaBackground#'
end

local build_statusline = function(modules)
  local statusline = ''

  for _, v in pairs(modules) do
    if type(v) == 'table' then
      assert(type(v.module) == 'function')

      local content, highlight = v.module()
      local section = ''

      if v.highlight then
        section = build_module_string(
          content,
          create_highlight(v.name, v.highlight)
        )
      else
        section = build_module_string(
          content,
          create_highlight(v.name, highlight)
        )
      end

      statusline = statusline .. section
    end
  end

  return statusline
end

local create = function(left, right)
  local statusline = ''

  if left then
    statusline = statusline .. build_statusline(left)
  end

  if right then
    statusline = statusline .. '%='
    statusline = statusline .. build_statusline(right)
  end

  return statusline
end

M.worker = vim.loop.new_async(vim.schedule_wrap(function()
  local config = require('linha/config').config
  vim.wo.statusline = create(config.active.left, config.active.right)
end))

M.on_enter = function()
  M.worker:send()
end

M.on_leave = function()
  local config = require('linha/config').config
  return create(config.inactive.left, config.inactive.right)
end

M.setup = function(options)
  require('linha/config').create_config(options)
  require('linha/highlight').create_theme()

  vim.api.nvim_command('augroup Linha')
  vim.api.nvim_command('autocmd!')
  vim.api.nvim_command('autocmd WinEnter,BufEnter * lua require("linha").on_enter()')
  vim.api.nvim_command('augroup END')
end

return M
