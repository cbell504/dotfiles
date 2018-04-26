" Show line numbers and length
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233


" Useful settings
set history=700
set undolevels=700

" Tabs/Spacing
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Remove annoying things
set noswapfile

set ruler
set nocompatible

" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Better Copy and Pase
set pastetoggle=<F2>
set clipboard=unnamed   

" Enable Mouse
set mouse=a

" Quicksave
noremap <C-Z> :update<CR>
vnoremap <C-C> :update<CR>
inoremap <C-Z> <C-O> :update<CR>

" Moving Code blocks with > <
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Auto Commands
" General
" Removw all trailing whitespace upon write
autocmd BufWritePre * %s/\s\+$//e


" Show whitepace
" Must be inserted before colorscheme command
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/

" Plugins
" Python mode
" Install link to plugin manager
"  curl -fLo ~/.local/share/nvim/sites/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cal plug#begin('~/.local/share/nvim/plugged')
" Make sure to use single quotes
" Examples
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align
"
" Any valid git URL is allowed
" Plug 'https://github.com/junegunn.vim-github-dashboard.git'
"
" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" On-Demand loading
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToogle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
" Using a non-master branch 
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
" Initaialize plugin system

Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'autue-shaik/vim-javacomplete2'
Plug 'vim-arline/vim-arline'
Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
" Plug 'nvim/vim-flake8'
" Plug 'vim-syntastic/syntastic'

call plug#end()

" Python-mode configs
" Install neovim via pip3
let g:pymode_python = 'python3'
hi pythonSelf ctermfg=68 guifg=#5f87d7 cterm=bold gui=bold

" JavaComplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" To enable smart inseeeeeting class imports with F4
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

" To enable usual inserting class imports with F5
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)

" To add all missing imports with F6
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

" To remove all unused imports with F7
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" Deoplete
let g:deoplete#enable_at_startup = 1

" Vim Syntastic Configs
let python_highlight_all=1
