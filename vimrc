set nocompatible                    " 设置不兼容原始vi模式
let mapleader = ";"                 " 定义<leader>键
filetype plugin indent on 					"检测文件类型，打开基于文件类型的插件和缩进
syntax enable                       " 语法高亮
set number
set cursorline		            " 高亮当前行
set noerrorbells visualbell " 关闭错误的提示音，错误时屏幕闪烁
set showcmd                         " 右下角显示输入的命令
set laststatus=2	                " 总是显示下方状态栏
set statusline=[%f]%m%=row:%l/%L,col:%c     " 状态栏显示信息设置
set nowrap                          " 行超过vim窗口时禁止折行
set wildmenu									" 输入vim命令时，按Tab键在上方显示所有补全命令
set smarttab tabstop=2 softtabstop=2 shiftwidth=2		            " 缩进的空格数
set autoindent smartindent cindent
set hlsearch ignorecase incsearch	smartcase		            " 搜索
map <leader>/ :noh<cr> 
map <Leader>h ^
map <Leader>l $
map <leader>k <c-u>
map <leader>j <c-d>
map <Leader>q :q<CR>
map <Leader>w :w<CR>
map <leader>s :shell<cr>
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

map <Leader>b :call SwitchBuffer()<CR>
function! SwitchBuffer()
    " Start by listing existing buffers
    buffers
    let n = input('Switch to: ', '', 'buffer')
    execute 'buffer' n
endfunction

call plug#begin()
	Plug 'preservim/nerdtree'
	Plug 'jiangmiao/auto-pairs'
	Plug 'terryma/vim-smooth-scroll'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'morhetz/gruvbox'
	Plug 'preservim/tagbar'
	Plug 'preservim/nerdcommenter'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

let NERDTreeShowHidden = 1      "显示隐藏文件

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
set path+=./src						" C/C++头文件跳转(gf)目录
set path+=./src/include
set path+=/Users/yuesong/Desktop/postgresql-9.6.24/src/include
