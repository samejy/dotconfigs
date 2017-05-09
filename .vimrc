" command  :so %  reloads .vimrc

set nocompatible              " be iMproved, required
filetype off                  " required

"###############
"Plugins:
"###############
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'paredit.vim'
Plugin 'airblade/vim-rooter'
Plugin 'mru.vim'
Plugin 'powerline/powerline'
Plugin 'kovisoft/slimv'
Plugin 'moll/vim-bbye'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'wincent/command-t'
" Python autocomplete:
"Plugin 'davidhalter/jedi-vim'
"Plugin 'klen/python-mode'
"Plugin 'valloric/youcompleteme'
" window status bar:
"Plugin 'itchyny/lightline.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set hidden

" Turn on syntax highlighting always
syntax enable
set nowrap
set nobackup
set noswapfile
set nowritebackup

" nvie.com/posts/how-i-boosted-my-vim
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set copyindent

set magic
set expandtab
set showmatch " highlight matching parens
set ignorecase " ignore case in search if all lowercase
set smartcase " match case in searches only if not all lowercase
set hlsearch " highlight search items
set incsearch " incremetal searching

" use system clipboard
set clipboard+=unnamed

set background=light

" clear highlighted search items
nmap <silent> ,/ :nohlsearch<CR>

" write a readonly file with sudo (e.g. if forgot to  become root)
cmap w!! w !sudo tee % > /dev/null

" there is a single space character after the \ below
" this removes the vertical line in the vertical window separator
set fillchars+=vert:\ 

" powerline
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
"set laststatus=2

" Vim rooter
" changes pwd for a project
" set this to only work manually
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.projectile', '.git/']



inoremap jk <esc>

" Map Leader
let mapleader=","
let g:mapleader=","

let g:lisp_parens=1
"let g:pymode_rope=0
"let g:pymode_run_bind='<leader>pr'

" Save with ctrl-s
map <C-s> <Esc>:w<CR>

" Speedy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Use ; instead of :
noremap ; :

" map some common commands to a key ,a
noremap <leader>ad :Bd<CR>
noremap <leader>al :ls<CR>
noremap <leader>ac :close<CR>
noremap <leader>af :find<space>
noremap <leader>ab :CtrlPBuffer<CR>
noremap <leader>am :CtrlPMixed<CR>
" change pwd to root of current files project
noremap <leader>ar :Rooter<CR>

noremap <leader>an :NERDTreeToggle<CR>

" quicker buffer/file navigation
noremap \n :bn<CR>
noremap \p :bp<CR>
noremap \l :ls<CR>
noremap \e :e<space>~/
noremap \f :find<space>
" open hjlp in current window
nnoremap \h :Help<space>
" recent files
nnoremap \r :MRU<CR>

" nicked of the internet:
function! OpenHelpInCurrentWindow(topic)
    view $VIMRUNTIME/doc/help.txt
    setl filetype=help
    setl buftype=help
    setl nomodifiable
    exe 'keepjumps help ' . a:topic
endfunction

command! -nargs=? -complete=help Help call OpenHelpInCurrentWindow(<q-args>)

" test abbreviations: if you type iab<space> it will be replaced with noremap
iab nrp noremap

" nnoremap n = normal mode only, nore = non-recursive remapping, map = set key
" mapping

"Search into subfolders
"Provides tab completion
set path+=**
" add a menu option via F4 key:
source $VIMRUNTIME/menu.vim
set wildmenu
set wcm=<C-Z>
map <F4> :emenu <C-Z>

