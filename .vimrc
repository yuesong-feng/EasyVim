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
" https://github.com/preservim/nerdtree
""""""""""""""""""""""""""""""""
" open nerdtree
map <Leader>n :NERDTreeToggle<CR>

" control + hjkl to switch between windows
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

""""""""""""""""""""""""""""""""
" auto-pairs
" https://github.com/jiangmiao/auto-pairs
""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""
" AutoComplPope
" https://github.com/vim-scripts/AutoComplPope
""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""
" vim-cpp-enhanced-highlight
" https://github.com/octol/vim-cpp-enhanced-highlight
""""""""""""""""""""""""""""""""
let g:cpp_posix_standard = 1

""""""""""""""""""""""""""""""""
" taglist (require ctags)
" https://www.vim.org/scripts/script.php?script_id=273
""""""""""""""""""""""""""""""""
filetype on
map <leader>m :TlistToggle<cr>

" close if taglist is the only window
let Tlist_Exit_OnlyWindow=1

" taglist on the right side
let Tlist_Use_Right_Window = 1
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


