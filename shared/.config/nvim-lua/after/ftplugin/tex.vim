setlocal spell

augroup TexConceal
    au!
    au BufWinEnter *.tex setlocal conceallevel=1
    au BufWinEnter *.tex setlocal concealcursor=
    " au BufWinEnter *.tex let g:vimtex_compiler_progname = 'nvr'
    " au BufWinEnter *.tex let g:tex_flavor = 'latex'
    " au BufWinEnter *.tex let g:vimtex_view_method = 'skim'
    au BufWinEnter *.tex let g:tex_conceal = 'abdmg'
    au BufWinEnter *.tex let g:completion_trigger_character = [ '\\' ]
augroup END

nnoremap <leader><leader>c :VimtexCompile<cr>
nnoremap <leader><leader>cl :VimtexClean<cr>
