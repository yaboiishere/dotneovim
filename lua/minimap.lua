-- No need to copy this inside `setup()`. Will be used automatically.
local minimap = require('mini.map')
local setup =
{
  -- Highlight integrations (none by default)
  integrations = {
    minimap.gen_integration.builtin_search(),
    minimap.gen_integration.gitsigns(),
    minimap.gen_integration.diagnostic(),
  },

  -- Symbols used to display data
  symbols = {
    -- Encode symbols. See `:h MiniMap.config` for specification and
    -- `:h MiniMap.gen_encode_symbols` for pre-built ones.
    -- Default: solid blocks with 3x2 resolution.
    encode = nil,

    -- Scrollbar parts for view and line. Use empty string to disable any.
    scroll_line = '█',
    scroll_view = '┃',
  },

  -- Window options
  window = {
    -- Whether window is focusable in normal way (with `wincmd` or mouse)
    focusable = false,

    -- Side to stick ('left' or 'right')
    side = 'right',

    -- Whether to show count of multiple integration highlights
    show_integration_count = true,

    -- Total width
    width = 10,

    -- Value of 'winblend' option
    winblend = 25,

    -- Z-index
    zindex = 10,
  },
}

minimap.setup(setup)

vim.keymap.set('n', '<Leader>mc', minimap.close)
vim.keymap.set('n', '<Leader>mf', minimap.toggle_focus)
vim.keymap.set('n', '<Leader>mo', minimap.open)
vim.keymap.set('n', '<Leader>mr', minimap.refresh)
vim.keymap.set('n', '<Leader>ms', minimap.toggle_side)
vim.keymap.set('n', '<Leader>mt', minimap.toggle)
