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

" Show whitepace
" Must be inserted before colorscheme command
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/

" Plugins
" Python mode
