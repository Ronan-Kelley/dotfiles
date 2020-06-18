" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim/plugged')

""""""""""""""""""""""""""""""""""""
"   declare the list of plugins    "
""""""""""""""""""""""""""""""""""""

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdTree'
Plug 'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar'
Plug 'cespare/vim-toml'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" load coc settings
source ~/.config/nvim/init-coc.vim

""""""""""""""""""""""""""""""""""
"          custom binds          "
""""""""""""""""""""""""""""""""""

" plugins
nmap <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"""""""""""""""""""""
"   misc settings   "
"""""""""""""""""""""

" enable hybrid line numbers
set number relativenumber

" adjust text wrapping
set wrap
set linebreak

" set tab style
set tabstop=4
set shiftwidth=4

" modify splitting behavior
set splitbelow
set splitright

""""""""""""""""""""""
"   custom aliases   "
""""""""""""""""""""""

" set the alias Config to open this file
command! Config e ~/.config/nvim/init.vim

" set the alis Reconfig to re-source this file.
command! Reconfig source ~/.config/nvim/init.vim

" set the alias JRun to compile and run single-file java programs
command! JRun w | ! javac % && echo "" && java %

" set OS copy/paste commands as an alternative to buffer copy/paste
command! OSCopy w !xclip -i -sel c
command! OSPaste r !xclip -o -sel c

""""""""""""""""""""""
"   theme settings   "
""""""""""""""""""""""

" enable truecolor
set termguicolors

" set theme preferences
let g:onedark_hide_endofbuffer=1

" enable onedark theme
syntax on
colorscheme onedark
