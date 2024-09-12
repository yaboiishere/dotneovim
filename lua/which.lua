local whichKey = require("which-key")
local starcraft = require("starcraft")

whichKey.add({
  -- Terminal
  { "<leader>t",      group = "Terminal" },
  { "<leader>tt",     "<cmd>rightbelow vnew +terminal<CR>",              desc = "Terminal",                   mode = "n" },
  { "<leader>tT",     "<cmd>tabnew +terminal<CR>",                       desc = "Terminal Tab",               mode = "n" },

  -- Git
  { "<leader>G",      group = "git" },
  { "<leader>Gp",     "<cmd>Git push<CR>",                               desc = "Push",                       mode = "n" },
  { "<leader>GG",     "<cmd>Git<CR>",                                    desc = "Status",                     mode = "n" },
  { "<leader>Gp",     "<cmd>Git pull<CR>",                               desc = "Pull",                       mode = "n" },
  { "<leader>GC",     "<cmd>Git commit<CR>",                             desc = "Commit",                     mode = "n" },
  { "<leader>GB",     "<cmd>Git blame<CR>",                              desc = "Blame",                      mode = "n" },
  { "<leader>GL",     "<cmd>Git log<CR>",                                desc = "Log",                        mode = "n" },
  { "<leader>Gl",     "<cmd>Telescope git_commits<CR>",                  desc = "Log",                        mode = "n" },
  { "<leader>S",      "<cmd>source ~/.config/nvim/lua/snippets.lua<CR>", desc = "Snippets",                   mode = "n" },
  { "<leader>L",      "<cmd>source ~/.config/nvim/lua/config.lua<CR>",   desc = "Config",                     mode = "n" },
  { "<leader>R",      "<cmd>source ~/.config/nvim/init.vim<CR>",         desc = "Reload",                     mode = "n" },

  -- Starcraft
  { "<leader>m",      group = "Starcraft" },
  { "<leader>m1",     function() starcraft.bind_buffer("1") end,         desc = "Bind Starcraft buffer #1",   mode = "n" },
  { "<leader>m2",     function() starcraft.bind_buffer("2") end,         desc = "Bind Starcraft buffer #2",   mode = "n" },
  { "<leader>m3",     function() starcraft.bind_buffer("3") end,         desc = "Bind Starcraft buffer #3",   mode = "n" },
  { "<leader>m4",     function() starcraft.bind_buffer("4") end,         desc = "Bind Starcraft buffer #4",   mode = "n" },
  { "<leader>m5",     function() starcraft.bind_buffer("5") end,         desc = "Bind Starcraft buffer #5",   mode = "n" },
  { "<leader>m6",     function() starcraft.bind_buffer("6") end,         desc = "Bind Starcraft buffer #6",   mode = "n" },
  { "<leader>m7",     function() starcraft.bind_buffer("7") end,         desc = "Bind Starcraft buffer #7",   mode = "n" },
  { "<leader>m8",     function() starcraft.bind_buffer("8") end,         desc = "Bind Starcraft buffer #8",   mode = "n" },
  { "<leader>m9",     function() starcraft.bind_buffer("9") end,         desc = "Bind Starcraft buffer #9",   mode = "n" },
  { "<leader>m0",     function() starcraft.bind_buffer("0") end,         desc = "Bind Starcraft buffer #10",  mode = "n" },
  { "<leader>1",      function() starcraft.go_to_buffer("1") end,        desc = "Go to Starcraft buffer #1",  mode = "n" },
  { "<leader>2",      function() starcraft.go_to_buffer("2") end,        desc = "Go to Starcraft buffer #2",  mode = "n" },
  { "<leader>3",      function() starcraft.go_to_buffer("3") end,        desc = "Go to Starcraft buffer #3",  mode = "n" },
  { "<leader>4",      function() starcraft.go_to_buffer("4") end,        desc = "Go to Starcraft buffer #4",  mode = "n" },
  { "<leader>5",      function() starcraft.go_to_buffer("5") end,        desc = "Go to Starcraft buffer #5",  mode = "n" },
  { "<leader>6",      function() starcraft.go_to_buffer("6") end,        desc = "Go to Starcraft buffer #6",  mode = "n" },
  { "<leader>7",      function() starcraft.go_to_buffer("7") end,        desc = "Go to Starcraft buffer #7",  mode = "n" },
  { "<leader>8",      function() starcraft.go_to_buffer("8") end,        desc = "Go to Starcraft buffer #8",  mode = "n" },
  { "<leader>9",      function() starcraft.go_to_buffer("9") end,        desc = "Go to Starcraft buffer #9",  mode = "n" },
  { "<leader>0",      function() starcraft.go_to_buffer("0") end,        desc = "Go to Starcraft buffer #10", mode = "n" },
  { "<C-p>",          function() starcraft.pick_buffer() end,            desc = "Pick Starcraft buffer",      mode = "n" },

  --LSP
  { "<localleader>",  group = "lsp" },
  { "<localleader>r", desc = "References" },
  { "<localleader>S", desc = "Document Symbols" },
  { "<localleader>s", desc = "Workspace Symbols" },
  { "<localleader>d", desc = "Diagnostics" },
  { "<leader>q",      desc = "Quickfix" },
  { "<leader>e",      proxy = "<C-e>",                                   desc = "Floating Quickfix" },


  -- Telescope
  { "<leader>",       group = "Telescope" },
  { "<leader>f",      desc = "Find File" },
  { "<leader>g",      desc = "Find Git File" },
  { "<leader>b",      desc = "Buffers" },
  { "<A-TAB>",        proxy = "<C-6>",                                   desc = "Switch to last open buffer", mode = "n" },

  --MiniMap
  { "<leader>",       group = "MiniMap" },
  { "<leader>mc",     desc = "Close MiniMap" },
  { "<leader>mf",     desc = "Toggle MiniMap Focus" },
  { "<leader>mo",     desc = "Open MiniMap" },
  { "<leader>mr",     desc = "Refresh MiniMap" },
  { "<leader>ms",     desc = "Toggle MiniMap Side" },
  { "<leader>mt",     desc = "Toggle MiniMap" },
})
