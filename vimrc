set nocompatible                                  " 设置不兼容原始vi模式
set number                                        " 显示行号
set cursorline                                    " 高亮当前行
set showcmd                                       " 右下角显示输入的命令
set nowrap                                        " 行超过vim窗口时禁止折行
set wildmenu                                      " 输入vim命令时，按Tab键在上方显示所有补全命令
set tabstop=4 shiftwidth=4 expandtab smarttab     " 缩进的空格数
set autoindent smartindent cindent                " 自动缩进设置
set hlsearch incsearch ignorecase smartcase       " 搜索相关设置
filetype plugin indent on                         " 检测文件类型，打开基于文件类型的插件和缩进
syntax enable                                     " 语法高亮，不覆盖自定义设置
let mapleader = ";"                               " 定义<leader>键

map <Leader>/ :noh<CR>
map <Leader>h ^
map <Leader>l $
map <Leader>k <C-U>
map <Leader>j <C-D>
map <Leader>t :terminal<CR><C-W>J<C-W>10-
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" gf命令文件跳转路径
set path+=/Library/Developer/CommandLineTools/usr/include/c++/v1

" 可选插件
let ctags = 1

call plug#begin()
	Plug 'morhetz/gruvbox'              " 主题
	Plug 'vim-airline/vim-airline'      " 状态栏
	Plug 'luochen1990/rainbow'          " 彩虹括号
	Plug 'preservim/nerdtree'           " 文件树
	Plug 'psliwka/vim-smoothie'         " 动态滚动
	Plug 'ctrlpvim/ctrlp.vim'           " 文件/目录模糊搜索
	Plug 'jiangmiao/auto-pairs'         " 自动补全括号
	Plug 'preservim/nerdcommenter'      " 代码注释
	Plug 'junegunn/vim-easy-align'      " 文本对齐
    Plug 'preservim/tagbar'             " 查看标签
	Plug 'ludovicchabant/vim-gutentags' " 自动生成tags文件
call plug#end()

" Plug 'morhetz/gruvbox'
autocmd vimenter * ++nested colorscheme gruvbox

" Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
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

" Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" Plug 'preservim/nerdtree'
let NERDTreeShowHidden = 1      "显示隐藏文件
map <Leader>n :NERDTreeToggle<CR>

" Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']		" 忽略.gitignore中的文件

" Plug 'preservim/nerdcommenter'
let NERDSpaceDelims = 1

" Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Plug 'preservim/tagbar'
map <leader>m :TagbarToggle<CR>

" Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = "~/.cache/tags"
let g:gutentags_modules = ['ctags']

