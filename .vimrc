filetype plugin on
filetype plugin indent on

" Enable syntax highlighting
syntax on

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" show line numbers
set number

" don't copy line numbers when using mouse for copying on terminal
se mouse+=a

" highlight current line
set cursorline cursorcolumn
hi CursorLine   cterm=NONE ctermbg=black ctermfg=NONE
hi CursorColumn   cterm=NONE ctermbg=black ctermfg=NONE

" highlight white spaces at the end of line
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" do not comment next line automatically
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4

" let backspace delete indent
set softtabstop=4

" Show  tab characters. Visual Whitespace.
set list
set listchars=tab:>.

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" Auto indent on next line
set autoindent

" Highlight search results
set hlsearch
hi Search cterm=NONE ctermfg=black ctermbg=darkgrey

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]

" Auto wrap lines when line-length exceeds 80 chars
set wrap
set textwidth=80

" Sets how many lines of history VIM has to remember
set history=700

" Use utf-8 by default
set encoding=utf-8

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Disable folding
set nofoldenable

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Java specific stuff
let java_highlight_all=1
let java_highlight_debug=1
let java_ignore_javadoc=1
let java_highlight_functions=1
let java_mark_braces_in_parens_as_errors=1

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Split shortcuts
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Highlight characters that are over 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

Bundle 'gmarik/vundle'

" Install theme
Bundle 'chriskempson/base16-vim'
" colorscheme base16-tomorrow-night

" Instant Markdown settings
" Bundle 'suan/vim-instant-markdown'

" Install Vim again to get conceal to make indentLine plugin work. 'http://github.com/Yggdroot/indentLine.git'
Bundle 'scrooloose/nerdtree'
autocmd VimEnter * NERDTree
au VimEnter * wincmd l

" flake8 settings
Bundle 'nvie/vim-flake8'
autocmd FileType python map <buffer> <F8> :call Flake8()<CR>

" Javscript for vim
Bundle "pangloss/vim-javascript"

" scala for vim
au BufRead,BufNewFile *.scala set filetype=scala
au! Syntax scala source ~/.vim/syntax/scala.vim
Bundle 'derekwyatt/vim-scala'

" Syntastic
Bundle 'scrooloose/syntastic'

" Automatically set cwd to currently editing file
set autochdir

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
