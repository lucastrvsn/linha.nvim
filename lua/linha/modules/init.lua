local M = {}

M._builtin = {
  BufferNumber = require "linha/modules/buffer_number",
  BufferStatus = require "linha/modules/buffer_status",
  Diagnostics = require "linha/modules/diagnostics",
  FileName = require "linha/modules/file_name",
  FilePath = require "linha/modules/file_path",
  FileFullPath = require "linha/modules/file_full_path",
  FileType = require "linha/modules/file_type",
  GitBranch = require "linha/modules/git_branch",
  GitDiff = require "linha/modules/git_diff",
  LinePercent = require "linha/modules/line_percent",
  Mode = require "linha/modules/mode",
}

M._custom = {}

M.get_module = function(name)
  if type(name) == "string" then
    local module = M._builtin[name] or M._custom[name]

    if module ~= nil then
      return module
    end
  end

  return nil
end

M.add_module = function(name, opts)
  assert(type(name) == "string")
  assert(type(opts) == "table")

  M._custom[name] = opts
end

M.init = function(custom_modules)
  if type(custom_modules) == "table" then
    M._custom = custom_modules
  end
end

return M
