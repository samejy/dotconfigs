" command  :so %  reloads .vimrc

set nocompatible              " be iMproved, required
filetype off                  " required

if &term =~ "-256color$"
    set t_Co=256
endif

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
" It appears the installation via this method doesn't work? Possibly a vundle
" issue? Solution: manuall clone git repo and run install script
Plugin 'junegunn/fzf', { 'dir': '~/.fzf/', 'do': './install --all'}
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'paredit.vim'
Plugin 'airblade/vim-rooter'
Plugin 'mru.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kovisoft/slimv'
Plugin 'jpalardy/vim-slime'
Plugin 'moll/vim-bbye'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'klen/python-mode'
Plugin 'eagletmt/ghcmod-vim'
" vimproc requires some manual installation - run make in bundle directory
Plugin 'Shougo/vimproc.vim'
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

set laststatus=2
set bs=2

" use system clipboard
set pastetoggle=<F2>
set clipboard+=unnamed

if has("gui_kde")
    set guifont=Consolas/13/-1/5/50/0/0/0/0/0
elseif has("gui_gtk")
    set guifont=Consolas\ 13
elseif has("gui_running")
    if has("win32") || has("win64")
        set guioptions -=m
        set guioptions -=r
        set guioptions -=L
        set guioptions -=T
        colorscheme morning
        set background=light
        set guifont=Consolas:h11
        let g:CtrlSpaceSymbols = { "File": "f", "CTab": "c", "Tabs": "t" }
    else
        set guifont=-xos4-terminus-medium-r-normal--14-140-72-72-c-80-iso8859-1
    endif
else
    let g:airline_theme='luna'
    set background=dark
endif

"Search into subfolders
"Provides tab completion
set path+=**
source $VIMRUNTIME/menu.vim
set wildmenu
set wcm=<C-Z>

" clear highlighted search items
nmap <silent> ,/ :nohlsearch<CR>

" write a readonly file with sudo (e.g. if forgot to  become root)
cmap w!! w !sudo tee % > /dev/null

" there is a single space character after the \ below
" this removes the vertical line in the vertical window separator
set fillchars+=vert:\ 


" target for vim-slime
let g:slime_target="tmux"
let g:slime_paste_file="~/.slime_paste"
let g:slime_python_ipython=1

" powerline
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
"set laststatus=2

" Vim rooter
" changes pwd for a project
" set this to only work manually
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.projectile', '.git/']

let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_autoimport_modules = ['numpy', 'sklearn']
let g:pymode_line = 0
let g:pymode_lint_on_write = 0
let g:pymode_virtualenv = 1

inoremap jk <esc>

" Map Leader
let mapleader=","
let g:mapleader=","

" disable slimv tags searching else it overrides
" default C-] tag searching behaviour
let g:slimv_tags_file=''

let g:lisp_parens=1
let g:slimv_balloon=1

" Save with ctrl-s
map <C-s> <Esc>:w<CR>

let g:tmux_navigator_no_mappings=1

noremap <silent> <C-h> :TmuxNavigateLeft<CR>
noremap <silent> <C-j> :TmuxNavigateDown<CR>
noremap <silent> <C-k> :TmuxNavigateUp<CR>
noremap <silent> <C-l> :TmuxNavigateRight<CR>

" Use ; instead of :
noremap ; :

" map some common commands to a key ,a
noremap <leader>ad :Bd<CR>
noremap <leader>al :ls<CR>
noremap <leader>ac :close<CR>
noremap <leader>af :find<space>
vnoremap <leader>as :sort<CR>
noremap <leader>an :NERDTreeToggle<CR>
" change pwd to root of current files project
noremap <leader>ar :Rooter<CR>

" generate tags at current location
command! MakeTags !ctags -R .
noremap <silent> <leader>at :MakeTags<CR>

" indent without losing selection in visual mode
vnoremap < <gv
vnoremap > >gv

nnoremap <space> za

" quicker buffer/file navigation
noremap \n :bn<CR>
noremap \p :bp<CR>
noremap \e :e<space>~/
" View pwd
noremap \d :e<space>.<CR>
" fzf searching
noremap \f :Files<CR>
noremap \b :Buffers<CR>
noremap \l :Lines<CR>
" open help in current window
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

" test abbreviations: if you type nrp<space> it will be replaced with noremap
iab nrp noremap

" nnoremap n = normal mode only, nore = non-recursive remapping, map = set key
" mapping


autocmd BufRead,BufNewFile *.{cs,xaml} setlocal makeprg=build.bat 
"autocmd FileType python set omnifunc=pythoncomplete#Complete

