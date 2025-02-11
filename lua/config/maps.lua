-- maps.lua
local function map(mode, lhs, rhs, opts)
	local options = { silent = true, noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "p", '"_dP') -- Better paste

-- Save and quit
map("n", "<leader>w", "<cmd>write<cr>")
map("n", "<leader>q", "<cmd>quit<cr>")

-- Exit insert mode
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

-- NeoTree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>")
map("n", "<leader>r", "<cmd>Neotree focus<cr>")

-- Split windows
map("n", "<leader>sv", "<cmd>vsplit<cr>")
map("n", "<leader>sh", "<cmd>split<cr>")

-- Clear highlights
map("n", "<leader>h", "<cmd>nohlsearch<cr>")

-- Custom functions
map("v", "\\e", ":lua EyamlEncrypt()<CR>")
map("n", "\\m", ":lua GenCommitMsg()<CR>")
