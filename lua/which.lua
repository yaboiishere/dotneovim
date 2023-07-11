local whichKey = require("which-key")
local starcraft = require("starcraft")


whichKey.register(
  {
    ["<leader>"] = {
      t = {
        name = "Terminal",
        -- Opens a terminal on the right side of the screen
        t = { "<cmd>rightbelow vnew +terminal<CR>", "Terminal" },
        -- Opens a new terminal in a new tab
        T = { "<cmd>tabnew +terminal<CR>", "Terminal Tab" },
      },
      G = {
        name = "git",
        P = { "<cmd>Git push<CR>", "Push" },
        G = { "<cmd>Git<CR>", "Status" },
        p = { "<cmd>Git pull<CR>", "Pull" },
        C = { "<cmd>Git commit<CR>", "Commit" },
        B = { "<cmd>Git blame<CR>", "Blame" },
        L = { "<cmd>Git log<CR>", "Log" },
        l = { "<cmd>Telescope git_commits<CR>", "Log" },
      },
      name = "Source files",
      S = { "<cmd>source ~/.config/nvim/lua/snippets.lua<CR>", "Snippets" },
      L = { "<cmd>source ~/.config/nvim/lua/config.lua<CR>", "Config" },
      R = { "<cmd>source ~/.config/nvim/init.vim<CR>", "Reload" },
      m = {
        name = "Starcraft",
        ["1"] = { function() starcraft.bind_buffer("1") end, "Bind Starcraft buffer #1" },
        ["2"] = { function() starcraft.bind_buffer("2") end, "Bind Starcraft buffer #2" },
        ["3"] = { function() starcraft.bind_buffer("3") end, "Bind Starcraft buffer #3" },
        ["4"] = { function() starcraft.bind_buffer("4") end, "Bind Starcraft buffer #4" },
        ["5"] = { function() starcraft.bind_buffer("5") end, "Bind Starcraft buffer #5" },
        ["6"] = { function() starcraft.bind_buffer("6") end, "Bind Starcraft buffer #6" },
        ["7"] = { function() starcraft.bind_buffer("7") end, "Bind Starcraft buffer #7" },
        ["8"] = { function() starcraft.bind_buffer("8") end, "Bind Starcraft buffer #8" },
        ["9"] = { function() starcraft.bind_buffer("9") end, "Bind Starcraft buffer #9" },
        ["0"] = { function() starcraft.bind_buffer("0") end, "Bind Starcraft buffer #10" },
      },
      ["1"] = { function() starcraft.go_to_buffer("1") end, "Go to Starcraft buffer #1" },
      ["2"] = { function() starcraft.go_to_buffer("2") end, "Go to Starcraft buffer #2" },
      ["3"] = { function() starcraft.go_to_buffer("3") end, "Go to Starcraft buffer #3" },
      ["4"] = { function() starcraft.go_to_buffer("4") end, "Go to Starcraft buffer #4" },
      ["5"] = { function() starcraft.go_to_buffer("5") end, "Go to Starcraft buffer #5" },
      ["6"] = { function() starcraft.go_to_buffer("6") end, "Go to Starcraft buffer #6" },
      ["7"] = { function() starcraft.go_to_buffer("7") end, "Go to Starcraft buffer #7" },
      ["8"] = { function() starcraft.go_to_buffer("8") end, "Go to Starcraft buffer #8" },
      ["9"] = { function() starcraft.go_to_buffer("9") end, "Go to Starcraft buffer #9" },
      ["0"] = { function() starcraft.go_to_buffer("0") end, "Go to Starcraft buffer #10" },
    },
    ["-"] = { "<cmd>NERDTreeToggle<CR>", "Toggle NERDTree" },
    ["<A-TAB>"] = { "<C-6>", "Switch to last open buffer" },
    ["<C-p>"] = { function() starcraft.pick_buffer() end, "Pick Starcraft buffer" },
  },
  {}
)
