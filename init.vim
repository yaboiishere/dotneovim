" Plugins
call plug#begin('~/.config/nvim/plugged')

" Remote work plugin
Plug 'kenn7/vim-arsync'
" vim-arsync depedencies
Plug 'prabirshrestha/async.vim'

" Misc helper functions (dependency of popular plugins)
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-dispatch'
Plug 'echasnovski/mini.map'

" Which-key
Plug 'folke/which-key.nvim'

" Splits
Plug 'kwkarlwang/bufresize.nvim'
Plug 'christoomey/vim-tmux-navigator'

" LSP
Plug 'junnplus/lsp-setup.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'onsails/lspkind.nvim'
Plug 'mfussenegger/nvim-lint'
Plug 'jubnzv/virtual-types.nvim'

" Test coverage
Plug 'nvim-lua/plenary.nvim'
Plug 'andythigpen/nvim-coverage'

" Plug 'elmcast/elm-vim'
Plug 'nvimdev/lspsaga.nvim'
Plug 'towolf/vim-helm'

" TypeScript extras
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

" Completion engine
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'onsails/lspkind.nvim'
Plug 'hrsh7th/cmp-cmdline'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'IndianBoy42/tree-sitter-just'
Plug 'p00f/nvim-ts-rainbow'
Plug 'lukas-reineke/indent-blankline.nvim'

" Misc. motions/text search
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'int3/vim-extradite'
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'


Plug 'airblade/vim-gitgutter'

" Fuzzy searching
Plug 'nvim-telescope/telescope-fzf-native.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }

Plug 'powerman/vim-plugin-AnsiEsc'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1

" File browsing, enhanced netrw
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'stevearc/oil.nvim'

" Jump to last position when reopening files
Plug 'farmergreg/vim-lastplace'

" Colorschemes
Plug 'liuchengxu/space-vim-dark'
Plug 'nanotech/jellybeans.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'fenetikm/falcon'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'iCyMind/NeoSolarized'
Plug 'chriskempson/base16-vim'
Plug 'GoNZooo/jellybeans.vim'
Plug 'haishanh/night-owl.vim'
Plug 'luochen1990/rainbow'
Plug 'folke/tokyonight.nvim'
let g:rainbow_active = 1

" org-mode
Plug 'nvim-orgmode/orgmode'

Plug 'epwalsh/obsidian.nvim'

" Copilot
Plug 'github/copilot.vim'

let g:copilot_filetypes = {
      \ 'dap-repl': v:false,
      \ 'dapui_watches': v:false,
      \ '*': v:true
      \ }

" GitHub
Plug 'ldelossa/litee.nvim'
Plug 'ldelossa/gh.nvim'
Plug 'APZelos/blamer.nvim'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'GoNZooo/nvim-dap-ui', { 'branch': 'gonz.fix-nil-index' }
Plug 'theHamsta/nvim-dap-virtual-text'

" Comments
Plug 'numToStr/Comment.nvim'

"""
" Language-specific plugins
"""

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

" Silly Python bullshit
Plug 'ahmedkhalf/jupyter-nvim', { 'do': ':UpdateRemotePlugins' }

" PureScript
Plug 'purescript-contrib/purescript-vim'

" Ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'

" Odin
Plug 'Tetralux/odin.vim'

call plug#end()

" Colorscheme
" set background=dark
syntax enable
filetype plugin indent on

set termguicolors

if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if $TERM_PROGRAM == 'tmux'
  set mouse=a
else
  set mouse=""
endif

colorscheme tokyonight

" Sane tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2

" SPACE is leader
let g:mapleader=' '
" , is localleader
let g:maplocalleader=','
" Tilde is ESC in insert mode
inoremap § <Esc>

set number
set relativenumber
set encoding=utf-8

" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" Ignore case when searching
set ignorecase
" Ignore case when searching lowercase
set smartcase
" Stop highlighting on Enter
map <CR> :noh<CR>

" Set highlight for column 100
set colorcolumn=80,100

" highlight cursor position
" set cursorline
" set cursorcolumn
set scrolloff=2

" Make it so that we always go to the last position we were at
" in the buffer when we were last in it.
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  endif

" Expansions
"
" %% expands to current path, all thanks to Gary Bernhardt & Drew Neil
" See: http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:p:h'))."/"<CR>
" %rc expands to vimrc
cnoremap %rc ~/.config/nvim/init.vim
cnoremap %ll ~/.config/nvim/lua/config.lua

map <leader>cd :lcd %:p:h<CR>

" Useful bindings for opening new files
" Current window
map <leader>ew :e %%
" New tab
map <leader>et :tabe %%
" New window from vertical split
map <leader>ev :vsp %%
" New window from horizontal split
map <leader>es :sp %%

" Map tilde (above TAB) to exit insert mode and visual mode
" For some reason it will actually press enter when trying to exit
" command line mode with tilde, meaning that if you try to cancel a :wq
" or the like it will execute it. Need a workaround...
imap § <Esc>
vmap § <Esc>

" Use easymotion
nmap <leader>s <Plug>(easymotion-s2)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"" Set higher updaterate
set updatetime=50
set ttimeoutlen=0
set switchbuf=usetab


" completion list
" inoremap <expr><tab> pumvisible() ? "\<c-y>" : "\<tab>"
" imap <expr><c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
" imap <expr><c-k> pumvisible() ? "\<c-p>" : "\<c-k>"

highlight GutterSignAdd    guifg=#009900 ctermfg=2
highlight GutterSignChange guifg=#bbbb00 ctermfg=3
highlight GutterSignDelete guifg=#ff2222 ctermfg=1
highlight link GitGutterAdd    GutterSignAdd
highlight link GitGutterChange GutterSignChange
highlight link GitGutterDelete GutterSignDelete

" Basic `:Git` mappings
nmap <leader>GG :Git<CR>
nmap <leader>GP :Git push<CR>

" Git Blame
let g:blamer_enabled = 1
let g:blamer_relative_time = 1
let g:blamer_delay = 100
highlight Blamer guifg=lightgrey

" Load our lua config
lua require("config")

" Enable per-project configurations
set exrc
set secure

set nocompatible

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Reserve space for the errors
set signcolumn=yes

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

let g:mkdp_browser = '/usr/bin/google-chrome-stable'
let g:mkdp_echo_preview_url = 1

" example
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

"" Set higher updaterate
set updatetime=50
set ttimeoutlen=0
set switchbuf=usetab

set conceallevel=1

function! ToggleGstatus() abort
  for l:winnr in range(1, winnr('$'))
    if !empty(getwinvar(l:winnr, 'fugitive_status'))
      exe l:winnr 'close'
      return
    endif
  endfor
  keepalt Git
endfunction
nnoremap gs :call ToggleGstatus()<CR>

