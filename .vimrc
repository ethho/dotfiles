syntax on
filetype plugin on
set nocompatible
set hidden
set relativenumber
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" leader key
let mapleader = " "

" ********************************* Functions *********************************

function! ToggleGruvboxBG()
    if &background == 'dark'
        set background=light
    else
        set background=dark
    endif
endfunction

fun! GoYCM()
    nnoremap <buffer> <leader>gd :YcmCompleter GoTo<CR>
    nnoremap <buffer> <leader>gr :YcmCompleter GoToReferences<CR>
    nnoremap <buffer> <leader>rr :YcmCompleter RefactorRename<space>
endfun

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" ************************************ Plugins ********************************

filetype plugin indent on
call plug#begin('~/.vim/plugged')

Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'kshenoy/vim-signature'
Plug 'vimwiki/vimwiki'

call plug#end()

" ripgrep
if executable('rg')
    let g:rg_derive_root='true'
endif

" ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim

" netrw
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 15

" enable YCM for all files, notably markdown and vimwiki
let g:ycm_filetype_blacklist = {}

" vimwiki: use markdown
let g:vimwiki_list = [{'path': '~/vimwiki/docsrc', 'template_path': '~/vimwiki/templates/',
          \ 'template_default': 'default', 'syntax': 'markdown', 'ext': '.md',
          \ 'path_html': '~/vimwiki/docs/', 'custom_wiki2html': 'vimwiki_markdown',
          \ 'html_filename_parameterization': 1,
          \ 'template_ext': '.tpl'}]
" add the pre tag for inserting code snippets
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr, pre, script'

" ctrl p
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ************************************ Colors *********************************

" gruvbox, baby
autocmd vimenter * colorscheme gruvbox
let g:gruvbox_contrast_light='hard'
let g:gruvbox_contrast_dark='medium'
set background=light

" ************************************ Keymaps ********************************

" pane navigation
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>b gT
nnoremap <silent> <leader>w gt
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Vex<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <leader>tn :tabnew<SPACE>

" nav remaps
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-u> <C-u>zz
nnoremap <leader>tml :tabmove -1<CR>
nnoremap <leader>tmr :tabmove +1<CR>

" misc
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>dws :s/\s\+$//g<CR>

" git aliases
nnoremap <leader>gst :Git<CR>
nnoremap <leader>gci :Git commit<CR>
nnoremap <leader>gbr :Git branch<SPACE>
nnoremap <leader>gco :Git checkout<SPACE>
nnoremap <leader>gdf :Git diff<SPACE>
nnoremap <leader>gadd :Git add<SPACE>

" toggle light/dark BG
nnoremap <leader>1 :call ToggleGruvboxBG()<CR>

" vimwiki
nmap ,wt <Plug>VimwikiTabIndex
nmap ,ws <Plug>VimwikiUISelect
nmap ,wi <Plug>VimwikiDiaryIndex
nmap ,w,w <Plug>VimwikiMakeDiaryNote
nmap ,w,t <Plug>VimwikiTabMakeDiaryNote
nmap ,w,y <Plug>VimwikiMakeYesterdayDiaryNote
nmap ,w,m <Plug>VimwikiMakeTomorrowDiaryNote
nmap ,wh <Plug>Vimwiki2HTML
nmap ,whh  <Plug>Vimwiki2HTMLBrowse
nmap ,w,wk <Plug>VimwikiDiaryGenerateLinks
nmap ,w,w <Plug>VimwikiMakeDiaryNote
nmap ,wr <Plug>VimwikiRenameFile
nmap ,wd <Plug>VimwikiDeleteFile
nmap ,wn <Plug>VimwikiGoto
nmap ,ww <Plug>VimwikiIndex
nmap <C-Tab> <Plug>VimwikiNextLink

" autocompleters
autocmd BufWritePre * :call TrimWhitespace()
call GoYCM()
" autocmd FileType typescript :call GoYCM()
"autocmd FileType cpp,cxx,h,hpp,c :call GoCoc()

