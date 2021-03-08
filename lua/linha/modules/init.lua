local M = {}

M.buffernumber = require('linha/modules/buffernumber')

M.bufferstatus = require('linha/modules/bufferstatus')

M.diagnostics = require('linha/modules/diagnostics')

M.filename = require('linha/modules/filename')

M.filepath = require('linha/modules/filepath')

M.filetype = require('linha/modules/filetype')

M.gitbranch = require('linha/modules/gitbranch')

M.gitdiff = require('linha/modules/gitdiff')

M.linepercent = require('linha/modules/linepercent')

M.mode = require('linha/modules/mode')

M.create_module = function()
  -- TODO(lucastrvsn): easy way to create new dynamic modules
end

return M
