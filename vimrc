set nocompatible                                  " 设置不兼容原始vi模式
let mapleader = ";"                               " 定义<leader>键
filetype plugin indent on                         " 检测文件类型，打开基于文件类型的插件和缩进
syntax enable                                     " 语法高亮，不覆盖自定义设置
set noerrorbells visualbell                       " 禁止错误提示音
set number                                        " 显示行号
set cursorline                                    " 高亮当前行
set showcmd                                       " 右下角显示输入的命令
set nowrap                                        " 行超过vim窗口时禁止折行
set wildmenu                                      " 输入vim命令时，按Tab键在上方显示所有补全命令
set smarttab tabstop=2 softtabstop=2 shiftwidth=2 " 缩进的空格数
set autoindent smartindent cindent                " 自动缩进设置
set hlsearch ignorecase incsearch	smartcase       " 搜索相关设置
map <Leader>/ :noh<CR>
map <Leader>h ^
map <Leader>l $
map <Leader>k <C-U>
map <Leader>j <C-D>
map <Leader>q :q<CR>
map <Leader>w :w<CR>
map <Leader>bd :bd<CR>
map <Leader>bn :bn<CR>
map <Leader>bp :bp<CR>
map <Leader>t :terminal<CR><C-W>J<C-W>10-
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" gf命令文件跳转路径
set path+=~/Desktop/postgresql-15.2/src/include
set path+=/Library/Developer/CommandLineTools/usr/include/c++/v1

" 可选插件
let tags = 0
let ale = 0
let rust = 0

call plug#begin()
	Plug 'morhetz/gruvbox'                " 主题
	Plug 'vim-airline/vim-airline'        " 状态栏
	
	Plug 'preservim/nerdtree'             " 文件树
	Plug 'terryma/vim-smooth-scroll'      " 动态滚动
	Plug 'ctrlpvim/ctrlp.vim'             " 文件/目录模糊搜索

	Plug 'jiangmiao/auto-pairs'           " 自动补全括号
	Plug 'preservim/nerdcommenter'        " 代码注释
	Plug 'junegunn/vim-easy-align'        " 文本对齐
		
	if tags == 1
		Plug 'preservim/tagbar'             " 查看标签
		Plug 'ludovicchabant/vim-gutentags' " 自动生成tags文件
		Plug 'skywind3000/gutentags_plus'   " 自动更新tags文件
	endif

	if ale == 1
		Plug 'dense-analysis/ale'           " 代码异步检查、LSP支持
	endif

	if rust == 1
		Plug 'rust-lang/rust.vim'           " rust插件
	endif

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
map <C-U> :call smooth_scroll#up(&scroll, 10, 1)<CR>
map <C-D> :call smooth_scroll#down(&scroll, 10, 1)<CR>
map <C-B> :call smooth_scroll#up(&scroll*2, 5, 1)<CR>
map <C-F> :call smooth_scroll#down(&scroll*2, 5, 1)<CR>

" Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']		" 忽略.gitignore中的文件

" Plug 'jiangmiao/auto-pairs'

" Plug 'preservim/nerdcommenter'
let NERDSpaceDelims = 1
" let NERDCreateDefaultMappings = 0
" map <Leader>c <plug>NERDCommenterToggle

" Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

if tags == 1

	" Plug 'preservim/tagbar'
	map <leader>m :TagbarToggle<CR>

	" Plug 'ludovicchabant/vim-gutentags'
	let g:gutentags_cache_dir = "~/.cache/tags"
	let g:gutentags_modules = ['ctags', 'gtags_cscope']

	" Plug 'skywind3000/gutentags_plus'
	let g:gutentags_plus_switch = 1 
	let g:gutentags_plus_height = 10
	let g:gutentags_plus_nomap = 1
	noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
	noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
	noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
	noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
	noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
	noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
	noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
	noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
	noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
	noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>

	function! IsQuickfixOpen()
		for buf in getbufinfo({'buflisted':1})
			if buf.variables.current_syntax == 'qf'
				return 1
			endif
		endfor
		return 0
	endfunc

	noremap <expr> J IsQuickfixOpen() ? ":cn<cr>" : "J"
	noremap <expr> K IsQuickfixOpen() ? ":cp<cr>" : "K"
	noremap <expr> q IsQuickfixOpen() ? ":ccl<cr>" : "q"

endif

if ale == 1

	" Plug 'dense-analysis/ale'
	let g:ale_completion_enabled = 1
	let g:ale_floating_preview = 1
	set completeopt=menu,menuone,popup,noselect,noinsert
	let g:ale_linters = {'rust': ['analyzer']}
	nmap <Leader>ag :ALEGoToDefinition<CR>
	nmap <Leader>as :ALESymbolSearch 
	nmap <Leader>af :ALEFindReferences<CR>
	nmap <Leader>ar :ALERename<CR>
	nmap <Leader>ah :ALEHover<CR>
	nmap <Leader>aa :ALECodeAction<CR>
	inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
	inoremap <expr> <CR>    pumvisible() ? "\<C-o>" : "\<CR>"

endif

if rust == 1

	" Plug 'rust-lang/rust.vim'
	nmap <Leader>rf :RustFmt<CR>
	nmap <Leader>rr :RustRun<CR>

endif
