local M = {}

M.config = {}

M.create_config = function(config)
  M.config = config or require('linha/defaults').config
end

return M
