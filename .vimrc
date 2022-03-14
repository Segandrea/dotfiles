"""""""""""""""""""""""""""
" Basic vim configuration "
"""""""""""""""""""""""""""
" disable vi compatibility
set nocompatible
" set colorscheme
colorscheme delek
" syntax highlight
syntax on
" show completions
set wildmenu
" hide mouse while typing
set mousehide
" vertical scrolloff
set scrolloff=5
" enable folding
set foldenable
" fold by indentation
set foldmethod=indent
" don't fold
set foldlevel=99
" show white chars
set list listchars=tab:\ \ ,trail:·
" set utf-8 as encoding
set encoding=utf-8
" show line number
set number
" relative numbers for the lines
set relativenumber
" use system clipboard (works only in xorg, use nvim instead)
set clipboard+=unnamedplus
" ignore case during searches
set ignorecase
" only upper case are not ignored
set smartcase
" highlight matches
set showmatch
" show partial command
set showcmd
" highlight search
set hlsearch
" incremental search
set incsearch
" tab related
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set smartindent
" side scroll related
set nowrap
set sidescroll=1
" splits
set splitbelow
set splitright
" hide status bar
set laststatus=0
" conceal particular characters
set conceallevel=2

autocmd InsertEnter * norm zz
autocmd InsertEnter * set nohlsearch
" restore position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" navigate through splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" resize splits
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-
nnoremap <C-Right> <C-w>>
nnoremap <C-Left> <C-w><
" hlsearch
nnoremap <silent> n :set<space>hlsearch<cr>nzzzv
nnoremap <silent> N :set<space>hlsearch<cr>Nzzzv
nnoremap <silent> / :set<space>hlsearch<cr>mb/
nnoremap <silent> ? :set<space>hlsearch<cr>mb?
nnoremap <silent> * :set<space>hlsearch<cr>mb*
" Y behaves like D and C
nnoremap Y y$
" center text when joining lines
nnoremap J mtJ`t
" move lines in visual mode
vnoremap <silent> K :m<space>'<-2<cr>gv=gv
vnoremap <silent> J :m<space>'>+1<cr>gv=gv
" indent/dedent
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv
" increment/decrement
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv
vnoremap <C-i> g<C-a>gv
vnoremap <C-d> g<C-x>gv

" fold colors to make it more readable with alacritty's dracula theme
hi Folded ctermfg=2
hi Folded ctermbg=8
