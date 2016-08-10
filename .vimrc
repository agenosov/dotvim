set autoindent
set expandtab
set shiftwidth=4 softtabstop=4
syntax on

" navigation between split windows
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" tabs navigation
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ -s4pA1
autocmd BufNewFile,BufRead *.c set formatprg=astyle\ -s4pA1
autocmd BufNewFile,BufRead *.cxx set formatprg=astyle\ -s4pA1
autocmd BufNewFile,BufRead *.h set formatprg=astyle\ -s4pA1
autocmd BufNewFile,BufRead *.hpp set formatprg=astyle\ -s4pA1

" control row width
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%>100v.\+/

" TODO: configure path to use gf command
" let &path.="/usr/include/sys"

" Runtime path manipulation by pathogen.vim
execute pathogen#infect()
filetype plugin indent on

" Open a NERDTree automatically on start up
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Settings for nerdtree-tabs (https://github.com/jistr/vim-nerdtree-tabs)
let g:nerdtree_tabs_open_on_console_startup=1

" Enable code completion
set omnifunc=syntaxcomplete#Complete

" Specify tags file
set tags=./tags,tags;$HOME
" Navigation tricks for using CTags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
