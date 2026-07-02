" nocompatible
set nocompatible

" user interface
set history=1000
set laststatus=2		" Always show statusline
set lazyredraw
set matchtime=2			" Show matching brackets
set ruler			" Show cursor position
set number			" Show line numbers
set relativenumber		" Show relative line numbers
set showcmd			" Display incomplete commands
set cursorline			" Highlight current line
set display=lastline,uhex	" Show last line even when too long

" regex
set incsearch			" Incremental searching
set ignorecase			" Case insensitive
set smartcase			" Conditional sensitivity
set gdefault			" s///g by default

" whitespace
set autoindent
set listchars=tab:↹·,extends:⇉,precedes:⇇,nbsp:␠,trail:␠,nbsp:␣
set formatoptions=crqlj		" wrap comments

" wrapping
set colorcolumn=+1		" highlight n+1th column
set linebreak			" break on line boundaries
set showbreak=↳			" show at the start of wrapped lines
set virtualedit=block		" rectangular selection

" GUI
set ttymouse=xterm2		" force mouse support
set mouse=a			" terminal mouse when possible

" tab completion
set wildmenu			" show menu of completions
set wildmode=full
set wildignore+=.*.sw*,__pycache__,*.pyc
set complete-=i

" unicode
set encoding=utf-8
setglobal fileencoding=utf-8
set nobomb
set fileencodings=ucs-bom,utf-8,iso-8859-1

" others
set scrolloff=2
set autoread

set background=dark
syntax on
filetype plugin indent on
colorscheme gruvbox

" Status line
source ~/.config/vim/statusline.vim
