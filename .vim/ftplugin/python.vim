" Python specific settings.
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal formatoptions=croql
let python_highlight_all=1

" dot phrases
nnoremap <buffer> <leader>ldb <ESC>lbywologging.debug(f"<ESC>pi: {<ESC>pi}")<ESC>lDk0w
nnoremap <buffer> <leader>bp <ESC>obreakpoint()<ESC>k0w
nnoremap <buffer> <leader>flake :call flake8#Flake8()<CR>

