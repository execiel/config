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
set mouse=a
set number
set relativenumber
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
set guifont=CaskaydiaCove\ NF:h13


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
nnoremap <A-f> :Telescope find_files<CR> i 

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

" Bracket and qoute pairing
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
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'scrooloose/nerdtree'  
  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  
  " Syntax
  Plug 'gko/vim-coloresque'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'tmhedberg/SimpylFold'
  Plug 'elkowar/yuck.vim'
  Plug 'Fymyte/rasi.vim'
  
  " Themes
  Plug 'rktjmp/lush.nvim'
  Plug 'eddyekofo94/gruvbox-flat.nvim'
  Plug 'marko-cerovac/material.nvim'
  Plug 'AlessandroYorba/Alduin'
  Plug 'ahmedabdulrahman/aylin.vim'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'RRethy/nvim-base16'

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

  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'material',
      component_separators = { left = '|', right = '|'},
      section_separators = { left = ' ', right = ' '},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {'filetype', 'filename'},
      lualine_x = {'hostname','fileformat'},
      lualine_y = {'diagnostics'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
EOF

let g:material_style = "palenight"
colorscheme duskfox

hi LineNr guibg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" Formatting options
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
