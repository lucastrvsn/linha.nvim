local provider = function()
  return vim.fn.expand "%:t"
end

return {
  provider = provider,
}
