local M = {}

M.on_enter = function()
  vim.o.statusline = [[%!luaeval('require("linha/statusline").build_active()')]]
end

M.on_leave = function()
  vim.o.statusline =
    [[%!luaeval('require("linha/statusline").build_inactive()')]]
end

M.on_colorscheme = function()
  -- require('linha/highlight').init()
end

M.add_module = require("linha/modules").add_module

--- Setup the statusline
-- @param table opts
M.setup = function(opts)
  opts = opts or {}

  require("linha/highlight").init(opts.theme)
  require("linha/modules").init(opts.modules)
  require("linha/config").init(opts.builder)

  vim.cmd "augroup Linha"
  vim.cmd "autocmd!"
  vim.cmd "autocmd ColorScheme * lua require('linha').on_colorscheme()"
  vim.cmd "autocmd WinEnter,BufEnter * lua require('linha').on_enter()"
  vim.cmd "autocmd WinLeave,BufLeave * lua require('linha').on_leave()"
  vim.cmd "augroup END"
end

return M
