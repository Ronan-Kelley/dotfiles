" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim/plugged')

" declare the list of plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdTree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

""""""""""""""""""
" other settings "
""""""""""""""""""

" load coc settings
source ~/.config/nvim/init-coc.vim

" set ctrl+n to open up nerdtree
nmap <C-n> :NERDTreeToggle<CR>

" enable absolute line numbers
" set nu

" enable relative line numbers
" set relativenumber

" enable hybrid line numbers
set number relativenumber

" adjust text wrapping
set wrap
set linebreak

" set tab style
set tabstop=4
set shiftwidth=4

" set the alias Config to open this file
command! Config e ~/.config/nvim/init.vim

" set the alis Reconfig to re-source this file.
command! Reconfig source ~/.config/nvim/init.vim

" set the alias JRun to compile and run single-file java programs
command! JRun w | ! javac % && echo "" && java %

" set OS copy/paste commands as an alternative to buffer copy/paste
command! OSCopy w !xclip -i -sel c
command! OSPaste r !xclip -o -sel c

" enable truecolor
set termguicolors

" set theme preferences
let g:onedark_hide_endofbuffer=1

" enable onedark theme
syntax on
colorscheme onedark
