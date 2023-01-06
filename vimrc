set nocompatible                    " 设置不兼容原始vi模式
let mapleader = ";"                 " 定义<leader>键
filetype plugin indent on 					"检测文件类型，打开基于文件类型的插件和缩进
syntax enable                       " 语法高亮
set number                   " 显示行号
set cursorline		            " 高亮当前行
set showcmd                         " 右下角显示输入的命令
set nowrap                          " 行超过vim窗口时禁止折行
set wildmenu									" 输入vim命令时，按Tab键在上方显示所有补全命令
set smarttab tabstop=2 softtabstop=2 shiftwidth=2		    " 缩进的空格数
set autoindent smartindent cindent
set hlsearch ignorecase incsearch	smartcase		          " 搜索
map <leader>/ :noh<cr> 
map <Leader>h ^
map <Leader>l $
map <leader>k <c-u>
map <leader>j <c-d>
map <Leader>q :q<CR>
map <Leader>w :w<CR>
map <leader>s :shell<cr>
map <leader>b :bd<cr>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>t :TagbarToggle<CR>
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <c-u> :call smooth_scroll#up(&scroll, 20, 1)<CR>
map <c-d> :call smooth_scroll#down(&scroll, 20, 1)<CR>
map <c-b> :call smooth_scroll#up(&scroll*2, 10, 1)<CR>
map <c-f> :call smooth_scroll#down(&scroll*2, 10, 1)<CR>

call plug#begin()
	Plug 'preservim/nerdtree'
	Plug 'preservim/tagbar'
	Plug 'preservim/nerdcommenter'
	Plug 'jiangmiao/auto-pairs'
	Plug 'terryma/vim-smooth-scroll'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'morhetz/gruvbox'
	Plug 'vim-airline/vim-airline'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

let NERDTreeShowHidden = 1      "显示隐藏文件

let g:airline#extensions#tabline#enabled = 1 "show tabline
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <Tab> <Plug>AirlineSelectNextTab
nmap <S-Tab> <Plug>AirlineSelectPrevTab

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \ })
endif

set path+=./src						" C/C++头文件跳转(gf)目录
set path+=./src/include

