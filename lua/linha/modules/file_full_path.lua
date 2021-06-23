local provider = function(opts)
  return vim.fn.fnamemodify(opts.buffer_name, ":p")
end

return {
  provider = provider,
}
