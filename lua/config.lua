require("fuzzy_search")
require("snippets")
require("github")
require("table-of-contents").setup()
require("treesitter")
require("ufo-config")
require("lsp")
require("completion")
require("debugging")

-- Sourcing configuration files
vim.keymap.set("n", "<leader><leader>S", "<cmd>source ~/.config/nvim/lua/snippets.lua<CR>")
vim.keymap.set("n", "<leader><leader>L", "<cmd>source ~/.config/nvim/lua/config.lua<CR>")
vim.keymap.set("n", "<leader><leader>R", "<cmd>source ~/.config/nvim/init.vim<CR>")
vim.keymap.set("n", "<leader><TAB>", "<C-6>")
-- Exiting insert mode in the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

require("which")
require("comments")
require("lsp_saga")
require("indent_guides")

require("coverage").setup()
require("oil-nvim")
require("nvimtree")
require("minimap")
-- require("obsidian-nvim")
