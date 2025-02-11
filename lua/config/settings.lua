-- settings.lua
local opt = vim.opt
local g = vim.g

-- Performance
opt.hidden = true
opt.lazyredraw = false -- edraw while executing macros
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- Decrease update time
opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete

-- Editor options
opt.number = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.syntax = "on"
opt.autoindent = true
opt.cursorline = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true -- Smart autoindenting on new lines
opt.encoding = "UTF-8"
opt.ruler = true
opt.mouse = "r" -- Enable mouse in all modes for better usability
opt.title = true
opt.ttimeoutlen = 0
opt.wildmenu = true
opt.showcmd = true
opt.showmatch = true
opt.inccommand = "split"

-- Split behavior
opt.splitright = true
opt.splitbelow = true

-- Search
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Don't ignore case with capitals
opt.hlsearch = true -- Highlight search results
opt.incsearch = true -- Makes search act like search in modern browsers

-- Appearance
opt.termguicolors = true
opt.showmode = false -- We don't need to see things like -- INSERT -- anymore
opt.signcolumn = "yes" -- Always show signcolumn
opt.colorcolumn = "80" -- Line length marker

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99
opt.foldenable = true

-- Backup and swap
opt.backup = false -- Don't create backup files
opt.writebackup = false -- Don't create backup files
opt.swapfile = false -- Don't create swap files

-- File type specific
vim.filetype.add({ extension = { eyaml = "yaml" } })

-- Completion
opt.completeopt = { "menuone", "noselect", "noinsert" }
opt.shortmess:append("c") -- Don't show completion messages
