set nocompatible
filetype off

" stuff was yanked from
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs', {'rtp': 'plugin/auto-pairs.vim'}
Plugin 'dart-lang/dart-vim-plugin'
" Plugin 'Yggdroot/indentLine'

Plugin 'Workiva/frugal', {'rtp': 'contrib/frugal.vim'}

call vundle#end()

filetype plugin indent on
syntax on

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" backspace stops working because it's colliding with <C-H> here,
set backspace=indent,eol,start

" get access to system clipboard
set clipboard=unnamed

" NERDTree settings
let NERDTreeIgnore=['\.pyc$', '\~$']
map <C-n> :NERDTreeToggle<CR>

" Relative Line Numbering
set rnu

" Visible whitespace
set listchars=space:·,tab:»·
set list

" Scroll Offset
set scrolloff=6

" Pane options
set splitbelow
set splitright

" Tabs
set expandtab
set tabstop=4
set shiftwidth=4

" Smart Indent
filetype indent on
set smartindent

" Soft wrap
set wrap
set linebreak
let &showbreak=' »» '

" Vim-Tmux-Navigator
" autosave when leaving a vim split
let g:tmux_navigator_save_on_switch = 1

" NERDTree
let NERDTreeShowHidden=1

" Vim Autosave
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mod
