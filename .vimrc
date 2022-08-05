set nocompatible                    " 设置不兼容原始vi模式
let mapleader = ";"                 " 定义<leader>键

set noeb                            " 关闭错误的提示音
set vb                              " 错误时屏幕闪烁
syntax enable                       " 语法高亮
set nu			                    " 显示行号
set cursorline	                    " 高亮当前行
set showcmd                         " 右下角显示输入的命令
set ruler                           " 右下角显示光标位置，显示了状态栏则会被状态栏覆盖
set laststatus=2	                " 总是显示下方状态栏
set statusline=[%f]%m%=row:%l/%L,col:%c     " 状态栏显示信息设置
set nowrap                          " 行超过vim窗口时禁止折行
set wildmenu									" 输入vim命令时，按Tab键在上方显示所有补全命令

set virtualedit=block,onemore       " 允许光标出现在最后一个字符的后面
set tabstop=2			            " tab的空格数
set shiftwidth=2 		            " 使用>>和<<调整缩进的空格数
set autoindent
set smartindent
set cindent

set hlsearch			            " 高亮显示搜索结果
set ignorecase			            " 搜索时大小写不敏感
set incsearch                       " 一边输入搜索一边现实结果
map <leader><cr> :noh<cr>           " 取消搜索结果高亮

map <Leader>h ^
map <Leader>l $
map <leader>k gg
map <leader>j G
map <Leader>q :q<CR>
map <Leader>w :w<CR>
map <leader>t :shell<cr>
map <Leader>n :NERDTreeToggle<CR>
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
	Plug 'luochen1990/rainbow'

	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

let NERDTreeShowHidden = 1      "显示隐藏文件
let g:rainbow_active = 1        "彩虹括号

" asyncomplete.vim
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" vim-lsp: register
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
