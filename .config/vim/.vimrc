""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No compatible to vi
set nocp
" Sets how many lines of history VIM has to remember
set history=10000

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=";"

" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
set updatetime=1
"au FocusGained,BufEnter,CursorHold,CursorHoldI * checktime

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Use base 10 instead of octal
set nrformats=

" Turn on wildmenu to use command completion
set wildmenu

" Set completion option
set completeopt=longest,menu

" Ignore these files when expand wildcard, completing file or directory 
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Show current command
set showcmd
set laststatus=2

" Show line number
set number

" Show relative number
set rnu

" Always show current position
set ruler

" Color column
set cc=80

" Highlight the text line
set cursorline

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" Tenths of 0.1 second to show the matching paren
set matchtime=1

" How many tenths of a second to blink when matching brackets
set mat=2

" Enable use mouse
set mouse=a

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=0

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" Allow h,l move to another line
"set whichwrap+=<,>,h,l
set smartindent
set clipboard=unnamed
set clipboard+=unnamedplus
set autochdir
set selection=exclusive
set selectmode=mouse,key
set formatoptions+=mM
noremap <space>y "*y
noremap <space>Y "*Y
noremap <space>p "*p
noremap <space>P "*P


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'kasie-zhang/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ag.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'voldikss/vim-floaterm'
Plug 'vim-autoformat/vim-autoformat'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'djoshea/vim-autoread'
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
let g:airline_theme='molokai'
" enable airline tabline
let g:airline#extensions#tabline#enabled = 1
" remove 'X' at the end of the tablin
let g:airline#extensions#tabline#show_close_button = 0
" Show text on top left
let g:airline#extensions#tabline#tabs_label = '' 
" Show text on top right
let g:airline#extensions#tabline#buffers_label = ''
" Disable file paths in the tab
let g:airline#extensions#tabline#fnamemod = ':t'
" Disables the weird ornage arrow on the tabline
let g:airline#extensions#tabline#show_tab_type = 0
" Don't show warnign in right bottom
let g:airline_section_warning=''
let g:airline_powerline_fonts = 1

" crtlsf
nmap <c-s> <Plug>CtrlSFPrompt

" NerdTree
" Open and close NerdTree
nmap <leader>1 :NERDTreeToggle<CR>
nmap <F2> :NERDTreeFind<CR>
" Show hidden files
let g:NERDTreeShowHidden=1
" NerdTree Width
let g:NERDTreeWinSize=35
" NerdTree Position in left
let g:NERDTreeWinPos = "left"
let g:NERDTreeGlyphReadOnly = "RO"

" Easymotion
" 允许设置默认快捷键
let g:EasyMotion_do_mapping = 1
" 智能大小写匹配
let g:EasyMotion_smartcase = 1
" 按回车自动跳到第一个匹配
let g:EasyMotion_enter_jump_first = 1
" s查找字符
nmap <leader>s <Plug>(easymotion-overwin-f)
nmap <leader>s <Plug>(easymotion-bd-f)

" coc
let g:coc_global_extensions = []
let g:coc_global_extensions += ['coc-clangd']
let g:coc_global_extensions += ['coc-go']
let g:coc_global_extensions += ['coc-java']
let g:coc_global_extensions += ['coc-python']
let g:coc_global_extensions += ['coc-sh']

" coc mapping and configuration
set signcolumn=yes
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use K to show documentation in preview window.
nnoremap <silent>K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc-spell-checker
vmap <leader>c <Plug>(coc-codeaction-selected)<CR>
nmap <leader>c <Plug>(coc-codeaction-selected)<CR>

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif
" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')
" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
set tags=tags;
set tags+='~/.cache/tags'

" Vista
let g:vista_cursor_delay=0
let g:vista_echo_cursor_strategy="floating_win"
let g:vista_close_on_jump=1
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
noremap <c-f> ;silent! Vista finder coc<CR>
nmap <leader>2 :Vista!!<CR>

" Float terminal
let g:floaterm_keymap_new = '<leader>X'
let g:floaterm_keymap_prev = '<leader>xb'
let g:floaterm_keymap_next = '<leader>xn'
let g:floaterm_keymap_kill = '<leader>xk'
let g:floaterm_keymap_toggle = '<leader>xx'

" autoformat
noremap <F3> :Autoformat<CR>
let g:autoformat_verbosemode=1
autocmd BufWrite *.c,*.cpp,*.py,*.java :Autoformat
let g:formatdef_clangformat_google = '"clang-format -style google -"'
let g:formatters_c = ['clangformat_google']
let g:formatters_sh = ['shfmt']

" vim-markdown
let g:vim_markdown_folding_disabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set regular expression engine automatically
set regexpengine=0

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
	let g:oceanic_next_terminal_bold=1
	colorscheme OceanicNext
    if (has("termguicolors"))
      set termguicolors
    endif
catch
endtry

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencodings=utf-8,gbk
set termencoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile
set backupcopy=yes


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Allow backspace kill 4 spaces
set shiftwidth=4

" 1 tab == 4 spaces
set softtabstop=4
set tabstop=4

" Be smart when using tabs :)
set smarttab

" Auto indent
set autoindent
" Linebreak on a screen length
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change tabs.
" Change to next tab.
nnoremap <C-n> :tabnext<CR>
" Change to previous tab.
nnoremap <C-b> :tabprevious<CR>
" Kill current tab.
nnoremap <leader>tk :tabclose<CR>
" Open a new file through buffer.
nnoremap <leader>T  :buffers<CR> :tabnew<Space>
" Open a new tab.
nnoremap <leader>tn :tabnew<CR>
" Go to last tab.
nnoremap <leader>tl :tablast<CR>
" Go to first tab.
nnoremap <leader>ta :tabfirst<CR>
" Let 'tt' toggle between this and the last accessed tab
let g:lasttab = 1
nnoremap <leader>tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Windows
noremap <leader>q :q<CR>
noremap <leader>w :w<CR>
" :sp file
" :vs file
" <C-w>o      close other windows
" <C-w>hjkl   move cursor through window
" <C-w>v      new vertical split
" <C-w>s      new horizontal split
" :new file   open a file(regardless exist) in new window horizontal
" :vnew file  open a file(regardless exist) in new window;vertical
 

" Buffers
nnoremap <Leader>b :buffers<CR>:buffer<Space>
" :ls   show buffers
" :bn   show next buffer in current window
" :bp   show prev buffer in current window
" :b1   show buffer 1 in current window
" <C-^> toggle between previous file
" :e    open a file in current window
" :bd1  delete buffer 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut Key Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal map - nmap; Visual map - vmap; No Recursion map - noremap
nmap <leader>a 0
nmap <leader>d $
noremap <leader>r :source ~/.vimrc<CR>

" Move cursor in insert mode.
" inoremap <C-S-j> <C-o>j
" inoremap <C-S-l> <C-o>l
" inoremap <C-S-h> <C-o>h
" inoremap <C-S-w> <C-o>w
" inoremap <C-S-b> <C-o>b
" inoremap <C-a> <Esc>I
" inoremap <C-e> <Esc>A

" Move current line up or down
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv
