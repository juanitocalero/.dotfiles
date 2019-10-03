" Plugin management with junegunn/vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
"
" " Declare the list of plugins.
Plug 'tpope/vim-surround'
"
" " List ends here. Plugins become visible to Vim after this call.
call plug#end()
