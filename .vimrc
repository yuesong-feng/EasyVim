"参考了VimPlus配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ";"      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
"set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
"set cmdheight=2          " 设置命令行的高度
set showcmd              " 总是显示命令
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
"set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
"set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set nowrap               " 禁止折行
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=10        " 设置向右滚动字符数
set nofoldenable         " 禁用折叠代码

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感
"set smartcase
" 取消搜索结果高亮
map <leader><cr> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set nobackup            " 设置不备份
"set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
"set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

""""""""""""""""""""""""""""""""
" 快捷键
""""""""""""""""""""""""""""""""
map <Leader>h ^
map <Leader>l $
map <leader>k gg
map <leader>j G
map <Leader>q :q<CR>
map <Leader>w :w<CR>
map <C-x> :m +1<cr>
map <C-s> :m -2<cr>
map <silent> <c-u> :call smooth_scroll#up(&scroll, 50, 2)<CR>
map <silent> <c-d> :call smooth_scroll#down(&scroll, 50, 2)<CR>
map <silent> <c-b> :call smooth_scroll#up(&scroll*2, 25, 2)<CR>
map <silent> <c-f> :call smooth_scroll#down(&scroll*2, 25, 2)<CR>

function! SwitchBuffer()
    " Start by listing existing buffers
    buffers
    let n = input('Switch to: ', '', 'buffer')
    execute 'buffer' n
endfunction
map <Leader>bf :call SwitchBuffer()<CR>

""""""""""""""""""""""""""""""""
" 跳转路径
""""""""""""""""""""""""""""""""
set path+=./include/    " gf命令跳转路径
let g:alternateSearchPath = 'sfr:./include,sfr:..'  " C/C++头(源)文件跳转路径
map <leader>a :A<CR>

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
""""""""""""""""""""""""""""""""
let g:rainbow_active = 1


call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/a.vim'
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/AutoComplPop'
Plug 'luochen1990/rainbow'
Plug 'terryma/vim-smooth-scroll'
call plug#end()

let g:airline#extensions#tabline#enabled = 1

