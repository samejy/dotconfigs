set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'paredit.vim'
" Python autocomplete:
Plugin 'davidhalter/jedi-vim'
Plugin 'valloric/youcompleteme'
" window status bar:
Plugin 'itchyny/lightline.vim'
Plugin 'kovisoft/slimv'
Plugin 'klen/python-mode'
" delete buffer without closing window
Plugin 'moll/vim-bbye'
Plugin 'ctrlpvim/ctrlp.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" powerline
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
"set laststatus=2

inoremap jk <esc>
" SPC is leader key for my command mappings
let mapleader="\\"
let g:mapleader="\\"
map <space> \

" ignore case when searching
set ignorecase
set smartcase
" for regex
set magic

set expandtab

let g:pymode_rope=0
let g:pymode_run_bind='<leader>pr'

" Save with ctrl-s
map <C-s> <Esc>:w<CR>

" nnoremap n = normal mode only, nore = non-recursive remapping, map = set key
" mapping
nnoremap <Leader>f :NERDTreeToggle<CR>
" start window commands with SPC-w
nnoremap <Leader>w <C-w>
" command  :so %  reloads .vimrc
" map SPC bd to close buffer without closing window
nnoremap <Leader>bd :Bd<CR>

" add a menu option via F4 key:
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>

