" Gotta be first
set nocompatible
filetype off

" Vundle stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'

" Colorscheme
Plugin 'morhetz/gruvbox'

" 
Plugin 'preservim/nerdtree'

call vundle#end()

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax enable
set mouse=a

set background=dark
colorscheme gruvbox

" ----- jistr/vim-nerdtree-tabs -----
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
nnoremap <ESC>u :NERDTreeFocusToggle<CR>

" Tab navigation
nnoremap <ESC>b :tabprevious<CR>
nnoremap <ESC>f :tabnext<CR>

set clipboard=unnamed
