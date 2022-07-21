set number
syntax on 
colorscheme ron
set bg=dark
set tabstop=4
set autoindent
set smartindent
set cursorline
set mouse=a
set ttymouse=xterm2
set anti
set history=1000
set scrolloff=5
set hlsearch
set incsearch
set ignorecase
set smartcase
set backup
set linebreak " set bex=DESIRED_EXTENSION 
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

autocmd VimEnter * NERDTree | wincmd p

let NERDTreeWinPos=0

" close Vim or a tab automatically when NERDTree is the last window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" have the same NERDTree on every tab automatically
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
