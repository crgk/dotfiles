set nocompatible
filetype off

" stuff was yanked from
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'


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
