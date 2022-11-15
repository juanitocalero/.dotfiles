" Plugin management with junegunn/vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')
"
" " Declare the list of plugins.
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'

Plug 'michaeljsmith/vim-indent-object'

Plug 'editorconfig/editorconfig-vim'

Plug 'fcpg/vim-waikiki'

Plug 'mcchrish/nnn.vim'

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

" Allow buffer changing without saving
set hidden

" Intuitive position of new splits
set splitbelow
set splitright

" No strange files
set nobackup
set noswapfile

" Delete current buffer without closing the window
command! Bd bp|bd #

" Nice key (spanish kb) to see open buffers and select
nnoremap ¡ :ls<CR>:b<Space>

" Ease access to [] keys in spanish keyboard
nmap Ç [
nmap ç ]
omap Ç [
omap ç ]
xmap Ç [
xmap ç ]

" " Move faster to prev/next buffer
nnoremap <C-K> :bprev<CR>
nnoremap <C-J> :bnext<CR>
" 
" " Insert blank line after current line
nnoremap <silent> <C-Space> :<C-u>call append(line("."),   repeat([""], v:count1))<CR>

" Use ripgrep as the grep program
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Waikiki
"
let g:waikiki_roots = ['~/wiki/', '~/tasks']
let maplocalleader = "ñ"
let g:waikiki_default_maps = 1

let g:markdown_folding = 1
set nofoldenable
