" set leader
let mapleader=";"

""""""""""""""""""""""""""""""""
" VIM user interface
""""""""""""""""""""""""""""""""
" show line number
set number

" syntax highlight
syntax enable

" show command at the bottom right
set showcmd

" show the position of cursor at the bottom right
set ruler

""""""""""""""""""""""""""""""""
" tab, indent
""""""""""""""""""""""""""""""""
" tab width
set tabstop=4
set smarttab

" width of >> and <<
set shiftwidth=4

" indent
set autoindent
set smartindent

""""""""""""""""""""""""""""""""
" search
""""""""""""""""""""""""""""""""
" search while inputing every character
set incsearch

" highlight search results
set hlsearch

" ignore case while search
set ignorecase
set smartcase

" cancel search results highlight
map <leader><cr> :noh<cr>

""""""""""""""""""""""""""""""""
" shortcut keys
""""""""""""""""""""""""""""""""
" move the cursor to the begin or end of line
map <Leader>h ^
map <Leader>l $

"move the cursor to the begin or end of file
map <leader>k gg
map <leader>j G

" :q, :w, :wq
map <Leader>q :q<CR>
map <Leader>w :w<CR>

" move line
map <C-x> :m +1<cr>
map <C-s> :m -2<cr>

" show and goto buffers
function! SwitchBuffer()
    " Start by listing existing buffers
    buffers
    let n = input('Switch to: ', '', 'buffer')
    execute 'buffer' n
endfunction
map <Leader>bf :call SwitchBuffer()<CR>
""""""""""""""""""""""""""""""""
" nerdtree
""""""""""""""""""""""""""""""""
" open nerdtree
map <Leader>n :NERDTreeToggle<CR>

" control + hjkl to switch between windows
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l



""""""""""""""""""""""""""""""""
" vim-cpp-enhanced-highlight
""""""""""""""""""""""""""""""""
let g:cpp_posix_standard = 1

""""""""""""""""""""""""""""""""
" tagbar (require ctags)
""""""""""""""""""""""""""""""""
map <leader>m :TagbarToggle<cr>

""""""""""""""""""""""""""""""""
" Rainbow Parentheses Improved
" https://www.vim.org/scripts/script.php?script_id=4176
""""""""""""""""""""""""""""""""
let g:rainbow_active = 1

""""""""""""""""""""""""""""""""
" a.vim
" https://www.vim.org/scripts/script.php?script_id=31
""""""""""""""""""""""""""""""""
" path for gf (not plugin)
set path+=./include/

" path for a.vim
let g:alternateSearchPath = 'sfr:./include,sfr:..'

" shortcut

map <leader>a :A<CR>

call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/a.vim'
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/AutoComplPop'
call plug#end()
