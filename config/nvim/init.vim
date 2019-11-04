" Plugin management with junegunn/vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')
"
" " Declare the list of plugins.
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

Plug 'vim-scripts/VOoM'

Plug 'justinmk/vim-sneak'
"
" " List ends here. Plugins become visible to Vim after this call.
call plug#end()

set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set incsearch

set number

set nobackup
set noswapfile

