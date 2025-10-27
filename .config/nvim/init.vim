" Plugin management with junegunn/vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')
"
" " Declare the list of plugins.
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'

Plug 'michaeljsmith/vim-indent-object'
Plug 'gaving/vim-textobj-argument'

Plug 'editorconfig/editorconfig-vim'

Plug 'mcchrish/nnn.vim'

Plug 'github/copilot.vim'


" IDE-like features
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'sainnhe/sonokai'

Plug 'preservim/nerdtree'

" " List ends here. Plugins become visible to Vim after this call.
call plug#end()

set backspace=indent,eol,start
" Allow single character movements to move to the previous / next line
set whichwrap+=<,>,h,l,[,]

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

" Include a RgAll variation for Rg in fzf.vim with --no-ignore
command! -bang -nargs=* RgAll 
	\ call fzf#vim#grep("rg --column --line-number --no-ignore --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

" Remap the file name insertion command to use fzf
imap <c-x><c-f> <plug>(fzf-complete-path)

let g:markdown_folding = 1
set nofoldenable

" Great custom script to insert images in markdown files
runtime insert_image.vim

colorscheme sonokai

lua <<EOF

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "clangd", "ruff", "jdtls"},
}

-- require("lspconfig").clangd.setup({})
-- require("lspconfig").ruff.setup({})
-- require("lspconfig").jdtls.setup({})

vim.lsp.config('clangd', {})
vim.lsp.config('ruff', {})
vim.lsp.config('jdtls', {})

-- Create the lsp keymaps only when a 
-- language server is active
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)

    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})
EOF

