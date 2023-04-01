lua << END
-- for nvim-tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
END

call plug#begin()

" File icons for nvim-tree and lualine
Plug 'nvim-tree/nvim-web-devicons' 

" Directory file explorer viewer
Plug 'nvim-tree/nvim-tree.lua'

" Vim statusline
Plug 'nvim-lualine/lualine.nvim'

" Git wrapper
Plug 'tpope/vim-fugitive'

Plug 'terrortylor/nvim-comment'
Plug 'overcache/NeoSolarized'

" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

lua << EOF
require "nvim_comment".setup {}
require "nvim-tree".setup {}
require "lualine".setup {
      \ options = { theme = 'solarized_dark' },
      \ extensions = { 'nvim-tree' }
}
EOF

" Indent with space
" set expandtab

" Set tab width
set tabstop=2
set shiftwidth=2

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap! <Up> <Nop>
noremap! <Down> <Nop>
noremap! <Left> <Nop>
noremap! <Right> <Nop>
" and fn-ed arrow keys
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>
noremap <Home> <Nop>
noremap <End> <Nop>
noremap! <PageUp> <Nop>
noremap! <PageDown> <Nop>
noremap! <Home> <Nop>
noremap! <End> <Nop>

" Disable mouse
set mouse=

" Setup colorscheme
set termguicolors
set background=dark
colorscheme NeoSolarized
