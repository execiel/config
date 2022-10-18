----------------------------
-- Execiels neovim config --
----------------------------

-- Shorthand for vim functions
local g   = vim.g
local o   = vim.o
local opt = vim.opt
local A   = vim.api

-----------------
-- VIM OPTIONS --
-----------------
opt.guifont = { "CaskaydiaCove NF", "h15" }
o.termguicolors = true
o.hidden = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 10

-- UI
o.number = true
o.numberwidth = 1
o.relativenumber = true
o.signcolumn = 'no'
o.cursorline = true

-- Better editing experience
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = -1
o.list = true
o.clipboard = 'unnamedplus'
o.ignorecase = true
o.smartcase = true

-- Undo and backup
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '


-----------------
-- KEYBINDINGS --
-----------------

local function map(m, k, v)
   vim.keymap.set(m, k, v, { silent = true })
end

-- Mimic shell movements
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

-- Session keybindings
map('n', '<leader>ss', '<CMD>SessionSave<CR>')
map('n', '<leader>sl', '<CMD>SessionLoad<CR>')

-- Keybindings for telescope
map('n', '<leader>fr', '<CMD>Telescope oldfiles<CR>')
map('n', '<leader>ff', '<CMD>Telescope find_files<CR>')
map('n', '<leader>fb', '<CMD>Telescope file_browser<CR>')
map('n', '<leader>fw', '<CMD>Telescope live_grep<CR>')
map('n', '<leader>ht', '<CMD>Telescope colorscheme<CR>')

-- Navigation
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')

-- Resizing
map('n', '<A-j>', '<CMD>resize -5<CR>')
map('n', '<A-k>', '<CMD>resize +5<CR>')
map('n', '<A-l>', '<CMD>vertical resize +5<CR>')
map('n', '<A-h>', '<CMD>vertical resize -5<CR>')

-- Editorstuff
map("i", '<C-s>', "<Esc> <CMD>w<CR> <CMD>call CocAction('runCommand', 'prettier.formatFile')<CR>" )
map("n", '<C-s>', "<CMD>w<CR> <CMD>call CocAction('runCommand', 'prettier.formatFile')<CR>" )
map('n', '<C-e>', "<CMD>q<CR>")
map('n', '<Tab>', "<CMD>NERDTreeToggle<CR>")
map('n', '<Esc>', "i")
map('n', 'ä', "<CMD>vsplit<CR>")
map('n', 'å', "<CMD>split<CR>")

-- Toggle Plugins
map('n', '<C-z>', "<CMD>Goyo<CR>")

-- Brackets and qoutes
map('i', '"', '""<left>')
map('i', "'", "''<left>")
map('i', '`', '``<left>')
map('i', '(', '()<left>')
map('i', '{', '{}<left>')
map('i', '[', '[]<left>')

-------------
-- Plugins --
-------------

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
  -- Essential editor stuff
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug('neoclide/coc.nvim', {branch = 'release'})
  Plug 'nvim-lualine/lualine.nvim'

  -- Files and stuff
  Plug 'vifm/vifm.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'jreybert/vimagit'
  Plug 'nvim-lua/plenary.nvim'
  Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'puremourning/vimspector'

  -- Syntax highlighting
  Plug('nvim-treesitter/nvim-treesitter')
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'kovetskiy/sxhkd-vim'
  Plug 'vim-python/python-syntax'
  Plug 'ap/vim-css-color'
  Plug 'Fymyte/rasi.vim'
  Plug 'frazrepo/vim-rainbow'

  -- Janegunn mvp osv
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/vim-emoji'

  -- Themes and aestethics
  Plug 'RRethy/nvim-base16'
  Plug 'eddyekofo94/gruvbox-flat.nvim'
  Plug 'glepnir/dashboard-nvim'
vim.call('plug#end')

------------------
-- COLORSCHEMES --
------------------

vim.cmd("colorscheme base16-onedark")

-- Highlight copied section
A.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})

-------------------------------------------------
-- DASHBOARD
-------------------------------------------------

local db = require('dashboard')
local home = os.getenv('HOME')

db.default_banner = {
  ' ---------------------------------------- ',
  '||                   .                   |',
  '||   ##############..... ##############  |',
  '||   ##############......##############  |',
  '||     ##########..........##########    |',
  '||     ##########........##########      |',
  '||     ##########.......##########       |',
  '||     ##########.....##########..       |',
  '||     ##########....##########.....     |',
  '||   ..##########..##########.........   |',
  '|| ....##########.#########............. |',
  '||   ..################jjj............   |',
  '||     ################.............     |',
  '||     ##############.jjj.jjjjjjjjjj     |',
  '||     ############...jj...jj..jj  jj    |',
  '||     ##########....jj...jj..jj  jj     |',
  '||     ########......jjj..jjj jjj jjj    |',
  '||     ######    .........               |',
  '||                 .....                 |',
  '||                   .                   |',
  ' ======================================== ',
  '',
  '',
}
-- linux
--db.preview_command = 'ueberzug'
--
--db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
db.preview_file_height = 11
db.preview_file_width = 70

db.custom_center = {
    {icon = '  ',
    desc = 'Recent sessions  ',
    action = 'SessionLoad'},
    {icon = '  ',
    desc = 'Find recent files',
    action = 'Telescope oldfiles'},
    {icon = '  ',
    desc = 'Find files       ',
    action = 'Telescope find_files find_command=rg,--hidden,--files'},
    {icon = '  ',
    desc ='File browser     ',
    action =  'Telescope file_browser'},
    {icon = '  ',
    desc = 'Load new theme   ',
    action = 'Telescope colorscheme'},
  }
db.custom_footer = { '', '' }
db.session_directory = "/home/wspon/.config/nvim/session"

-------------------
-- PLUGIN CONFIG --
-------------------

-- NERDTree options
g.NERDTreeMinimalUI=1
g.NERDTreeShowHidden=1


-- Treesitter Setup
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

-- Lualine setup
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
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
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename', 'diagnostics'},
    -- fileformat...
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
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

