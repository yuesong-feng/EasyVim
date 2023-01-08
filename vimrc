set nocompatible                                  " 设置不兼容原始vi模式
let mapleader = ";"                               " 定义<leader>键
filetype plugin indent on                         " 检测文件类型，打开基于文件类型的插件和缩进
syntax enable                                     " 语法高亮
set number                                        " 显示行号
set cursorline                                    " 高亮当前行
set showcmd                                       " 右下角显示输入的命令
set nowrap                                        " 行超过vim窗口时禁止折行
set wildmenu                                      " 输入vim命令时，按Tab键在上方显示所有补全命令
set smarttab tabstop=2 softtabstop=2 shiftwidth=2 " 缩进的空格数
set autoindent smartindent cindent
set hlsearch ignorecase incsearch	smartcase       " 搜索
map <leader>/ :noh<cr> 
map <Leader>h ^
map <Leader>l $
map <leader>k <c-u>
map <leader>j <c-d>
map <Leader>q :q<CR>
map <Leader>w :w<CR>
map <leader>b :bd<cr>
map <leader>t :shell<cr>
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
" gf命令文件跳转路径
set path+=~/Desktop/postgresql-15.1/src/include

call plug#begin()
	Plug 'morhetz/gruvbox'
	Plug 'vim-airline/vim-airline'
	
	Plug 'preservim/nerdtree'
	Plug 'terryma/vim-smooth-scroll'
	Plug 'ctrlpvim/ctrlp.vim'

	Plug 'jiangmiao/auto-pairs'
	Plug 'preservim/nerdcommenter'
	Plug 'junegunn/vim-easy-align'
	
	Plug 'preservim/tagbar'
	Plug 'ludovicchabant/vim-gutentags'

	Plug 'dense-analysis/ale'
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

" Plug 'preservim/nerdtree'
let NERDTreeShowHidden = 1      "显示隐藏文件
map <Leader>n :NERDTreeToggle<CR>

" Plug 'terryma/vim-smooth-scroll'
map <c-u> :call smooth_scroll#up(&scroll, 20, 1)<CR>
map <c-d> :call smooth_scroll#down(&scroll, 20, 1)<CR>
map <c-b> :call smooth_scroll#up(&scroll*2, 10, 1)<CR>
map <c-f> :call smooth_scroll#down(&scroll*2, 10, 1)<CR>

" Plug 'ctrlpvim/ctrlp.vim'

" Plug 'jiangmiao/auto-pairs'

" Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1

" Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Plug 'preservim/tagbar'
map <leader>m :TagbarToggle<cr>

" Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir="~/.cache/tags"

" Plug 'dense-analysis/ale'
let g:ale_completion_enabled = 1
let g:ale_floating_preview = 1
nmap <leader>g :ALEGoToDefinition<cr>
nmap <leader>s :ALESymbolSearch 
nmap <leader>f :ALEFindReferences<cr>
nmap <leader>i :ALEGoToImplementation<cr>
nmap <leader>rn :ALERename<cr>
nmap <space> :ALEHover<cr>
set completeopt=menu,menuone,popup,noselect,noinsert
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-o>" : "\<cr>"
