local create_highlight = require("linha/highlight").create_highlight

local M = {}

M.render = function(module, opts)
  if not module then
    vim.cmd 'echoerr "module not found."'
    return ""
  end

  local section = ""
  local module_content, module_highlight = module.provider(opts)

  -- If internal highlight is a table, generate the highlight for it
  if type(module_highlight) == "table" then
    module_highlight = create_highlight(module._group_name, module_highlight)
  end

  local prefix_to_add = nil

  -- Prefix
  if module.before ~= nil then
    local before_type = type(module.before)

    if before_type == "string" then
      prefix_to_add = module.before
    elseif before_type == "table" then
      if module.before.highlight ~= nil then
        section = section .. "%#" .. module.before.highlight .. "#"
        section = section .. module.before.content
      else
        prefix_to_add = module.before.content
      end
    end
  end

  -- Internal highlight has precedence over user-defined
  if module_highlight ~= nil then
    section = section .. "%#" .. module_highlight .. "#"
  elseif module.highlight ~= nil then
    section = section .. "%#" .. module.highlight .. "#"
  end

  if prefix_to_add ~= nil then
    section = section .. prefix_to_add .. module_content
  else
    section = section .. module_content
  end

  -- After
  if module.after ~= nil then
    local after_type = type(module.after)

    if after_type == "string" then
      section = section .. module.after
    elseif after_type == "table" then
      if module.after.highlight ~= nil then
        section = section .. "%#" .. module.after.highlight .. "#"
      end

      section = section .. module.after.content
    end
  end

  -- Reset the highlight group
  section = section .. "%*"

  return section
end

return M
