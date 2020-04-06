function! myspacevim#before() abort
  " let g:neomake_enabled_c_makers = ['clang']
  " nnoremap jk <Esc>
endfunction


function! myspacevim#after() abort
  " let g:ale_fixers = {
  " \   'javascript': [
  " \       'eslint',
  " \       'prettier',
  " \   ],
  " \}
  "
  " augroup fmt
  " autocmd!
  " autocmd BufWritePre * undojoin | Neoformat
  " augroup END

  let g:neoformat_enabled_javascript = [ 'prettier', 'eslint' ]
  let g:neoformat_enabled_json = [ 'prettier' ]
  let g:neoformat_enabled_graphql = [ 'prettier' ]
  let g:neoformat_enabled_css = [ 'prettier' ]
  let g:neoformat_enabled_ruby = [ 'rubocop' ]
  let g:neoformat_run_all_formatters = 1


  let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\)$'

  "  let g:EditorConfig_verbose = 1

  " set autochdir

  "  tunmap <Esc>
  "tmap jk <C-\><C-N>


  let g:coc_global_extensions = [
        \ 'coc-emoji',
        \ 'coc-json',
        \ 'coc-neosnippet',
        \ 'coc-syntax',
        \ 'coc-omni',
        \ 'coc-tsserver',
        \ 'coc-html',
        \ 'coc-css',
        \ 'coc-solargraph',
        \ 'coc-rls',
        \ 'coc-yaml',
        \ 'coc-highlight',
        \ 'coc-snippets',
        \ 'coc-lists',
        \ 'coc-yank',
        \ 'coc-tailwindcss',
        \ 'coc-prettier',
        \ 'coc-eslint',
        \ ]

  autocmd CursorHold * silent call CocActionAsync('highlight')
  set cmdheight=2
  set updatetime=300

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <c-space> coc#refresh()
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  nmap <silent> [d <Plug>(coc-diagnostic-prev)
  nmap <silent> ]d <Plug>(coc-diagnostic-next)

  nmap <silent> ,gd <Plug>(coc-definition)
  nmap <silent> ,gy <Plug>(coc-type-definition)
  nmap <silent> ,gi <Plug>(coc-implementation)
  nmap <silent> ,gr <Plug>(coc-references)

  nmap <silent> ,r <Plug>(coc-rename)
  vmap <silent> ,= <Plug>(coc-format-selected)
  nmap <silent> ,= <Plug>(coc-format-selected)
  vmap <silent> ,a <Plug>(coc-codeaction-selected)
  nmap <silent> ,a <Plug>(coc-codeaction-selected)
  nmap <silent> ,ac <Plug>(coc-codeaction)
  nmap <silent> ,f <Plug>(coc-fix-current)

  command! -nargs=0 Format :call CocAction('format')
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  nnoremap <silent> <space>cca  :<C-u>CocList diagnostics<cr>
  nnoremap <silent> <space>cce  :<C-u>CocList extensions<cr>
  nnoremap <silent> <space>ccc  :<C-u>CocList commands<cr>
  nnoremap <silent> <space>cco  :<C-u>CocList outline<cr>
  nnoremap <silent> <space>ccs  :<C-u>CocList -I symbols<cr>
  nnoremap <silent> <space>ccj  :<C-u>CocNext<CR>
  nnoremap <silent> <space>cck  :<C-u>CocPrev<CR>
  nnoremap <silent> <space>ccp  :<C-u>CocListResume<CR>

  nnoremap <silent> K :call <SID>show_documentation()<CR>

  nnoremap <silent> ga :<C-u>A<CR>

  function! s:show_documentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  unmap q

  set guifont='RobotoMono\ Nerd\ Font:h16'

  if exists('veonim')
    " extensions for web dev
    let g:vscode_extensions = [
          \'vscode.typescript-language-features',
          \'vscode.json-language-features',
          \'vscode.css-language-features',
          \'vscode.html-language-features',
          \]

    " multiple nvim instances
    nno <silent> <c-t>c :Veonim vim-create<cr>
    nno <silent> <c-g> :Veonim vim-switch<cr>
    nno <silent> <c-t>, :Veonim vim-rename<cr>

    " workspace functions
    nno <silent> ,f :Veonim files<cr>
    nno <silent> ,e :Veonim explorer<cr>
    nno <silent> ,b :Veonim buffers<cr>
    nno <silent> ,d :Veonim change-dir<cr>
    "or with a starting dir: nno <silent> ,d :Veonim change-dir ~/proj<cr>

    " searching text
    nno <silent> <space>fw :Veonim grep-word<cr>
    vno <silent> <space>fw :Veonim grep-selection<cr>
    nno <silent> <space>fa :Veonim grep<cr>
    nno <silent> <space>ff :Veonim grep-resume<cr>
    nno <silent> <space>fb :Veonim buffer-search<cr>

    " language features
    nno <silent> sr :Veonim rename<cr>
    nno <silent> sd :Veonim definition<cr>
    nno <silent> si :Veonim implementation<cr>
    nno <silent> st :Veonim type-definition<cr>
    nno <silent> sf :Veonim references<cr>
    nno <silent> sh :Veonim hover<cr>
    nno <silent> sl :Veonim symbols<cr>
    nno <silent> so :Veonim workspace-symbols<cr>
    nno <silent> sq :Veonim code-action<cr>
    nno <silent> sk :Veonim highlight<cr>
    nno <silent> sK :Veonim highlight-clear<cr>
    nno <silent> ,n :Veonim next-usage<cr>
    nno <silent> ,p :Veonim prev-usage<cr>
    nno <silent> sp :Veonim show-problem<cr>
    nno <silent> <c-n> :Veonim next-problem<cr>
    nno <silent> <c-p> :Veonim prev-problem<cr>
  endif
endfunction
