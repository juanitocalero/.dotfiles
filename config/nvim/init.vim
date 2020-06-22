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

Plug 'editorconfig/editorconfig-vim'
"
" " List ends here. Plugins become visible to Vim after this call.
call plug#end()

set backspace=indent,eol,start

set tabstop=4
set softtabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set incsearch
" I rarely need search highlighting, and can be enabled easily
set nohlsearch

" Line numbers
set number

" Allow for buffer changing without saving
set hidden

" Intuitive position of new splits
set splitbelow
set splitright

" No strange files
set nobackup
set noswapfile

" Use ripgrep as the grep program
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Delete current buffer without closing the window
command! Bd bp|bd #
