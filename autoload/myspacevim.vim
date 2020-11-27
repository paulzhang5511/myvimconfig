" 函数 bootstrap_before 将在读取用户配置后执行
function! myspacevim#before() abort
  nnoremap <F8> :update<CR>:source %<CR>
  if has('win64')
    let g:tagbar_ctags_bin = 'C:\software\ctags\ctags.exe'
  endif
  let g:mapleader = ','
  let g:rustfmt_autosave = 1 
  " Language Client
  " note that if you are using Plug mapping you should not use `noremap` mappings.
  nmap <F5> <Plug>(lcn-menu)
  " Or map each action separately
  nmap <silent>K <Plug>(lcn-hover)

  nmap <silent> <Leader>rn <Plug>(lcn-rename)

  tnoremap <Esc> <C-\><C-n>
  imap jk <esc>
  nnoremap <Leader>w :<C-U>w<CR>
  nnoremap -- :<C-U>FZF<CR>
  autocmd Filetype json nnoremap <slient><buffer> ;r :<C-U>JsonLineFormatWrite<CR>
endfunction

" 函数 bootstrap_after 将在 VimEnter autocmd 之后执行
function! myspacevim#after() abort
  nmap <silent> gd :<C-U>call LanguageClient#textDocument_definition()<CR>
endfunction
