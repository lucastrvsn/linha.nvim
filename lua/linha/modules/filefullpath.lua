return function(opts)
  return vim.fn.fnamemodify(opts.buffer_name, ':p')
end
