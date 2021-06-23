local get_diagnostics_from_type = function(type)
  if vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    return nil
  end

  local active_clients = vim.lsp.get_active_clients()

  if active_clients then
    local count = 0

    for _, client in ipairs(active_clients) do
      local count_from_lsp = vim.lsp.diagnostic.get_count(
        vim.api.nvim_get_current_buf(),
        type,
        client.id
      )

      count = count + count_from_lsp
    end

    if count ~= 0 then
      return count
    end
  end
end

local provider = function()
  local content = ""
  local diagnostics = {
    errors = get_diagnostics_from_type "Error",
    warnings = get_diagnostics_from_type "Warning",
    hints = get_diagnostics_from_type "Hint",
    infos = get_diagnostics_from_type "Information",
  }

  for k, v in pairs(diagnostics) do
    if v ~= nil then
      content = content .. k .. v
    end
  end

  return content
end

return {
  provider = provider,
}
