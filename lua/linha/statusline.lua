local config = require "linha/config"
local render = require("linha/renderer").render

local M = {}

local build = function(left, right)
  local statusline = ""
  local buffer_number = vim.fn.bufnr "%"
  local buffer_name = vim.api.nvim_buf_get_name(buffer_number)
  local opts = {
    buffer_number = buffer_number,
    buffer_name = buffer_name,
  }

  for _, module in ipairs(left) do
    if type(module) == "table" then
      statusline = statusline .. render(module, opts)
    end
  end

  statusline = statusline .. "%="

  for _, module in ipairs(right) do
    if type(module) == "table" then
      statusline = statusline .. render(module, opts)
    end
  end

  return statusline
end

M.build_active = function()
  return build(config.modules_active_left, config.modules_active_right)
end

M.build_inactive = function()
  return build(config.modules_inactive_left, config.modules_inactive_right)
end

return M
