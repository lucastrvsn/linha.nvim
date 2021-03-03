local U = {}

U.get_mode = function()
  return vim.api.nvim_get_mode()['mode'];
end

U.ternary = function(condition, T, F)
  if condition then
    return T
  end

  return F
end

return U
