return function(opts)
  return vim.fn.pathshorten(vim.fn.fnamemodify(opts.buffer_name, ':.'))
end
