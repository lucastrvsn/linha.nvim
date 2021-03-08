local M = {}

M.render = function(module, opts)
  if not module then
    vim.cmd('echoerr "module not found."')
    return ''
  end

  local section = ''
  local module_content, module_highlight = module.module(opts)
  local prefix_to_add = nil

  -- Prefix
  if module.prefix ~= nil then
    local prefix_type = type(module.prefix)

    if prefix_type == 'string' then
      prefix_to_add = module.prefix
    elseif prefix_type == 'table' then
      if module.prefix.highlight ~= nil then
        section = section .. '%#' .. module.prefix.highlight .. '#'
        section = section .. module.prefix.content
      else
        prefix_to_add = module.prefix.content
      end
    end
  end

  -- Internal highlight has precedence over user-defined
  if module_highlight ~= nil then
    section = section .. '%#' .. module_highlight .. '#'
  elseif module.highlight ~= nil then
    section = section .. '%#' .. module.highlight .. '#'
  end

  if prefix_to_add ~= nil then
    section = section .. prefix_to_add .. module_content
  else
    section = section .. module_content
  end

  -- Suffix
  if module.suffix ~= nil then
    local suffix_type = type(module.suffix)

    if suffix_type == 'string' then
      section = section .. module.suffix
    elseif suffix_type == 'table' then
      if module.suffix.highlight ~= nil then
        section = section .. '%#' .. module.suffix.highlight .. '#'
      end

      section = section .. module.suffix.content
    end
  end

  -- Reset the highlight group
  section = section .. '%*'

  return section
end

return M
