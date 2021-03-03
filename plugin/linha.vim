if exists('g:loaded_linha')
  finish
endif

function! ActiveStatusLine() abort
  return luaeval('require("linha").on_enter()')
endfunction

function! InactiveStatusLine() abort
  return luaeval('require("linha").on_leave()')
endfunction

" augroup Linha
"   autocmd!
"   autocmd ColorScheme,FileType,BufWinEnter,BufReadPost,BufWritePost,BufEnter,WinEnter,BufEnter,FileChangedShellPost,VimResized,TermOpen * setlocal statusline=%!ActiveStatusLine()
"   autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveStatusLine()
" augroup end

lua require('linha').setup()

let g:loaded_linha = 1
