" Some nonesense
"       __          __                        
"       \ \        / /                        
"        \ \  /\  / /__ _ __   ___  _ __  ___ 
"         \ \/  \/ / __| '_ \ / _ \| '_ \/ __|
"          \  /\  /\__ \ |_) | (_) | | | \__ \
"           \/  \/ |___/ .__/ \___/|_| |_|___/
"                      | |                    
"                      |_|  
"  , __                               ___            _        
" /|/  \            *                /   )          | |*      
"  |   |  _  __         _  _  _     |     __  _  _  | |   __, 
"  |   | |/ /  \|  ||  / |/ |/ |    |    /  \/ |/ | |/ | /  | 
"  |   |_|__\__/ \/ |_/  |  |  |_/   \___\__/  |  |_|__|_\_/|/
"                                                   |\     /| 
"                                                   |/     \|


" Editor options

set path+=**
set modelines=0
set autoread
au FocusGained,BufEnter * :silent! !
set encoding=UTF-8
set visualbell
set backspace=indent,eol,start
set nobackup
set noswapfile
" set mouse=a
set number
set scrolloff=2
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set showmode showcmd
set lazyredraw
set showmatch
set hlsearch incsearch ignorecase smartcase
set autochdir
set nocompatible 
set hidden
set wildmenu wildmode=list:longest,full
set laststatus=2 statusline=%F
set clipboard=unnamedplus
set foldmethod=indent
set foldnestmax=1
set foldlevelstart=1
set termguicolors
set noshowmode
set conceallevel=1


" Keymapping options
"Navigation  
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Resizing
nnoremap <A-h> :vertical resize -5<CR> 
nnoremap <A-l> :vertical resize +5<CR> 
nnoremap <A-j> :resize +5<CR> 
nnoremap <A-k> :resize -5<CR> 

"Other editor stuff
nnoremap <C-s> :w<CR> :call CocAction('runCommand', 'prettier.formatFile')<CR>
inoremap <C-s> <Esc>:w<CR>:call CocAction('runCommand', 'prettier.formatFile')<CR>a
nnoremap <C-z> u
inoremap <C-z> <Esc>u i<Up>
nnoremap <C-z> u
nnoremap <C-e> :q<CR>
nnoremap <Esc> a
nnoremap <Tab> :NERDTreeToggle<CR>
inoremap <C-f> <Esc>/
nnoremap q ciw <Esc>
nnoremap qd ciW <Esc>

"Terminal stuff
nnoremap ä :vsplit<CR>
nnoremap å :split<CR>
nnoremap <C-t> :split<CR> <C-w>j :res -13<CR> :terminal<CR> i
nnoremap t <C-w>j i
tnoremap <Esc> <C-\><C-n><C-w>k

"Bracket and qoute pairing
inoremap " ""<left>
inoremap ` ``<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {;<CR> {<CR>};<ESC>O


" Plugins
call plug#begin('~/.local/share/nvim/plugged')
  " Essentials
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'scrooloose/nerdtree'  
  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips'
  Plug 'itchyny/lightline.vim'

  " Syntax
  Plug 'gko/vim-coloresque'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'tmhedberg/SimpylFold'
  Plug 'elkowar/yuck.vim'
  Plug 'Fymyte/rasi.vim'
  
  " Themes
  Plug 'rktjmp/lush.nvim'
  Plug 'sainnhe/gruvbox-material'
  Plug 'eddyekofo94/gruvbox-flat.nvim'
  Plug 'meliora-theme/neovim', {'requires': 'rktjmp/lush.nvim'}
  Plug 'mangeshrex/everblush.vim'
  Plug 'jacoborus/tender.vim'
  Plug 'marko-cerovac/material.nvim'
  Plug 'junegunn/seoul256.vim'
  Plug 'savq/melange'
  Plug 'joshdick/onedark.vim'
  Plug 'AlessandroYorba/Alduin'
  Plug 'romainl/Apprentice'
  Plug 'ahmedabdulrahman/aylin.vim'
  Plug 'sainnhe/everforest'
  Plug 'sainnhe/sonokai'
  Plug 'EdenEast/nightfox.nvim'

  " icons
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1


" Syntax options
au BufReadPost *.conf set syntax=dosini

lua <<EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    --ignore_install = {"python"},
    sync_install = false,

    highlight = {
      enable = true,
      --disable = {"python"},
      additional_vim_regex_highlighting = false,
    },
  }

require 'meliora'.setup({
    dim_inactive = false,
    neutral = false, -- set this to `true` for neutral background and greys.
    styles = {
        comments = 'italic',
        conditionals = 'NONE',
        folds = 'NONE',
        loops = 'NONE',
        functions = 'NONE',
        keywords = 'NONE',
        strings = 'NONE',
        variables = 'NONE',
        numbers = 'NONE',
        booleans = 'NONE',
        properties = 'NONE',
        types = 'NONE',
        operators = 'NONE',
    },
    plugins = {
        cmp = true,
        indent_blankline = true,
        nvim_tree = {
            enabled = true,
            show_root = false,
        },
        telescope = {
            enabled = true,
            nvchad_like = true,
        },
    }
})
EOF

let g:gruvbox_flat_style = "dark"
colorscheme gruvbox-flat

hi LineNr guibg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" Lightline options
let g:lightline = {
    \ 'colorscheme': 'gruvbox-material', 
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'filename', 'modified' ] ],
    \   'right': [['lineinfo'], ['percent']] 
    \ },
    \ 'component_function': {
    \   'mode': 'LightlineMode',
    \ },
    \ 'separator': { 'left': '', 'right': ''}
    \ }

function! LightlineMode()
  return expand('%:t') =~# '^__Tagbar__' ? 'Tagbar':
    \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
    \ &filetype ==# 'javascript' ? '' :
    \ &filetype ==# 'json' ? '' :
    \ &filetype ==# 'python' ? '' :
    \ &filetype ==# 'css' ? '' :
    \ &filetype ==# 'vim' ? '' :
    \ &filetype ==# 'html' ? '' :
    \ &filetype ==# 'lua' ? '' : 
    \ &filetype ==# 'typescript' ? '' : 
    \ &filetype ==# 'java' ? '' : 
    \ &filetype ==# 'cpp' ? 'ﭱ' : 
    \ &filetype ==# 'c' ? '' : 
    \ ''
endfunction

" Formatting options
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
