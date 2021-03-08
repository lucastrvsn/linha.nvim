local config = require('linha/config')
local render = require('linha/renderer').render

local M = {}

M.build_active = function()
  local statusline = ''
  local buffer_number = vim.fn.bufnr('%')
  local buffer_name = vim.api.nvim_buf_get_name(buffer_number)
  local opts = {
    buffer_number = buffer_number,
    buffer_name = buffer_name
  }

  for _, module in ipairs(config.modules_active_left) do
    if type(module) == 'table' then
      statusline = statusline .. render(module, opts)
    end
  end

  statusline = statusline .. '%='

  for _, module in ipairs(config.modules_active_right) do
    if type(module) == 'table' then
      statusline = statusline .. render(module, opts)
    end
  end

  return statusline
end

M.build_inactive = function()
end

return M
