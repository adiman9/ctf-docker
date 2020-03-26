if has('python3')
  silent! python3 1
endif

set nocompatible
filetype off  

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'christoomey/vim-tmux-navigator'    
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'morhetz/gruvbox'

call vundle#end()  
filetype plugin indent on



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""    START CUSTOM SETTINGS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=UTF-8
let mapleader=" "

set t_Co=256
" Set the colorscheme
" colorscheme mopkai
" colorscheme zenburn
colorscheme gruvbox
set background=dark
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=white guibg=NONE guifg=white

" Set the hybrid numbering system. Shows absolute number of current line plus
" relative numbers of all other lines.
set relativenumber
set number

highlight ColorColumn ctermbg=lightgrey

" Enable syntax highlighting
syntax enable
syntax on

let g:UltiSnipsEditSplit="vertical"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

"Enable yanking to system clipboard
"set clipboard=unnamedplus

" Text, tab and Indent related
set expandtab
set smarttab

"making tab = 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

" setting mapping delay and keycode delay respectively
set timeoutlen=500 ttimeoutlen=0

" Linebreak on 500 characters
set lbr
set tw=500

set showcmd "show command in bottom bar

set cursorline "highlight current line

set lazyredraw "redraw only when we need to

set foldenable "enable folding
set foldlevelstart=10 "open most folds by default
set foldnestmax=10 "10 nested folds max
set foldmethod=syntax "fold based on indent level

set ai "auto indent
set si "smart indent
set wrap "Wrap lines

"set backspace to work as it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
" autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Key Mappings

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python setlocal cc=81

nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>
nnoremap <leader>bq :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>bd :%bd<CR>:e#<CR>:NERDTreeToggle<CR><C-w>l
nnoremap <leader>ba :%bd<CR>

"make jk the hotkey to return to normal mode"
inoremap jk <Esc>

" Cntl + S to save in normal and insert mode"
nnoremap <leader>ww :w<CR>
inoremap <leader>ww <Esc>:w<CR>

"Add ; to end of line in normal and insert mode"
inoremap <leader>; <Esc><S-A>;
nnoremap <leader>; <S-A>;<Esc>
"Add ; to end of the line then move back a char

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Quicker window movement
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

"quickly enter vim commands
inoremap <leader>jk <Esc>:
inoremap <leader>JK <Esc>:

"auto edit vimrc
nnoremap <leader>vim :e $MYVIMRC<CR>

"Easy close
nnoremap <leader>q :q<CR>
nnoremap <leader><leader>q :q!<CR>

"open new file easily
nnoremap <leader>o :e<space>

"open new file in splits
nnoremap <leader>v :vertical sb<space>
nnoremap <leader>s :sb<space>

"Mapping tab to be emmet expander key"
" imap <expr> <C-u> emmet#expandAbbrIntelligent("\<C-u>")
imap q<tab> <C-y>,

" enabling key map to allow cntl+c/v copy pasting
vnoremap <C-c> "+y
vnoremap <C-c><C-c> "+yy
inoremap <C-v> <Esc>j"+p`]
nnoremap <C-v> j"+p`]
nnoremap <leader>pp o<Esc>"+p`]
inoremap <leader>pp <Esc>"+p`]a
vnoremap <leader>yc "+y

"commenting
nmap <C-_> gcc
nmap co gc

inoremap <C-p> :b<space>
nnoremap <C-p> :b<space>
inoremap <C-p>v :vsplit<CR>:b<space>
nnoremap <C-p>v :vsplit<CR>:b<space>

nnoremap <leader>sp :set paste<cr>
nnoremap <leader>np :set nopaste<cr>

nnoremap v<C-]> :set splitright<CR>:vsp <CR>:exec("tag ".expand("<cword>"))<CR>:set nosplitright<CR>

au FileType python map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport pdb; pdb.set_trace()<esc>

set autoread
set updatetime=750
" Trigger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

autocmd BufRead,BufNewFile *.md setlocal spell
set complete+=kspell
