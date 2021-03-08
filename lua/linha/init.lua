local M = {}

local worker = vim.loop.new_async(vim.schedule_wrap(function()
  vim.wo.statusline = [[%!luaeval('require("linha/statusline").build_active()')]]
end))

M.on_enter = function()
  worker:send()
end

M.on_leave = function()
  --
end

M.on_colorscheme = function()
  require('linha/highlight').create_theme()
end

M.setup = function(options)
  require('linha/config').create_config(options)
  require('linha/highlight').create_theme()

  vim.cmd[[augroup Linha]]
  vim.cmd[[autocmd!]]
  vim.cmd[[autocmd ColorScheme * lua require('linha').on_colorscheme()]]
  vim.cmd[[autocmd WinEnter,BufEnter * lua require('linha').on_enter()]]
  vim.cmd[[autocmd WinLeave,BufLeave * lua require('linha').on_leave()]]
  vim.cmd[[augroup END]]
end

return M
