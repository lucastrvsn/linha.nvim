local provider = function()
  local total_lines = vim.fn.line "$"
  local current_line = vim.fn.line "."

  if current_line == 1 then
    return "Top"
  end

  if current_line == total_lines then
    return "Bot"
  end

  return math.modf((current_line / total_lines) * 100) .. "%%"
end

return {
  provider = provider,
}
