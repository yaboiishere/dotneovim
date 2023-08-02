require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "tsserver", "tailwindcss", "elixirls", "rubocop", "solargraph", "ruby_ls" },
}

local lspconfig = require("lspconfig")
local telescope = require("telescope.builtin")
local null_ls = require("null-ls")
local lint = require("lint")

lint.linters_by_ft = {
  javascript = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
  javascriptreact = { "eslint" },
  lua = { "luacheck" },
  elixir = { "credo" },
  ruby = { "erb_lint", "rubocop" },
  html = { "tidy" },
  css = { "stylelint" }
}


local servers = {
  tsserver = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "literal",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayVariableTypeHints = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
  lua_ls = {
    settings = { Lua = { diagnostics = { globals = { "vim" } } } },
  },
  tailwindcss = {
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
          },
        },
      },
    },
  },
}

null_ls.setup({
  on_attach = function(client, _) -- client, bufnr
    if client.server_capabilities.documentFormattingProvider then
      -- format on save
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format {async = true}")
    end

    if client.server_capabilities.documentRangeFormattingProvider then
      vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
  sources = {
    null_ls.builtins.formatting.prettierd
  },
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Disable formatting for tsserver (this should be handled by null-ls)
  if client.name == 'tsserver' then
    client.server_capabilities.documentFormattingProvider = false
  end

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<localleader>r", telescope.lsp_references, bufopts)
  vim.keymap.set("n", "<localleader>S", telescope.lsp_document_symbols, bufopts)
  vim.keymap.set("n", "<localleader>s", telescope.lsp_workspace_symbols, bufopts)
  vim.keymap.set("n", "<localleader>d", telescope.diagnostics, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", ",=", vim.lsp.buf.formatting, bufopts)


  vim.keymap.set("n", "<leader>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
  vim.keymap.set("n", "<leader>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
  vim.keymap.set("v", "<leader>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
  vim.keymap.set("n", "<leader>tr", vim.lsp.codelens.run(), { buffer = true, noremap = true })

  -- enable codelens

  if client.resolved_capabilities.code_lens then
    vim.cmd [[
      augroup lsp_codelens
        autocmd!
        autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()
      augroup END
    ]]
  end

  if client.resolved_capabilities.document_highlight then
    vim.cmd [[
      hi! LspReferenceRead cterm=bold ctermbg=235 guibg=LightYellow
      hi! LspReferenceText cterm=bold ctermbg=235 guibg=LightYellow
      hi! LspReferenceWrite cterm=bold ctermbg=235 guibg=LightYellow
    ]]
    vim.api.nvim_create_augroup('lsp_document_highlight', {})
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'lsp_document_highlight',
      buffer = 0,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = 'lsp_document_highlight',
      buffer = 0,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
--
-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.lua_ls.setup {
  on_attach = on_attach, flags = lsp_flags, capabilities = capabilities
}


lspconfig.hls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    ["haskell"] = {
      plugin = {
        tactics = {
          globalOn = false,
        },
      }
    }
  }
}


lspconfig.purescriptls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    ["purescript"] = {
      ["formatter"] = "tidy",
      ["addImportOnCompletion"] = true,
      ["codegenTargets"] = { "corefn" }
    }
  }
}

lspconfig.pyright.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

lspconfig.tsserver.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities, filetypes = {
  "typescript", "typescriptreact", "typescript.tsx" }, settings = servers.tsserver.settings }

lspconfig.rust_analyzer.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

lspconfig.clangd.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

lspconfig.jsonls.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

lspconfig.eslint.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

lspconfig.elixirls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  filetypes = { "elixir", "eelixir", "heex", "surface", "exs" },
  settings = {
    elixirLS = { enableTestLenses = true },
    credo = { enabled = true }
  }
}

lspconfig.erlangls.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

lspconfig.elmls.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

lspconfig.serve_d.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

lspconfig.tailwindcss.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities,
  settings = servers.tailwindcss.settings }

lspconfig.ruby_ls.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

lspconfig.solargraph.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

vim.opt.signcolumn = "yes"
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    vim.lsp.start {
      name = "rubocop",
      cmd = { "bundle", "exec", "rubocop", "--lsp" },
    }
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})

local prettier = require("prettier")

prettier.setup({
  bin = "prettierd",
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
  },
})

-- Lua
vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.format()]]

-- Haskell
vim.cmd [[autocmd BufWritePre *.hs lua vim.lsp.buf.format()]]

-- PureScript
vim.cmd [[autocmd BufWritePre *.purs lua vim.lsp.buf.format()]]

-- Erlang
vim.cmd [[autocmd BufWritePre *.erl lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.hrl lua vim.lsp.buf.format()]]

-- Elixir
vim.cmd [[autocmd BufWritePre *.ex lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.exs lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.eex lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.leex lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.heex lua vim.lsp.buf.format()]]

-- Rust
vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.format()]]

-- C
vim.cmd [[autocmd BufWritePre *.c lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.h lua vim.lsp.buf.format()]]

-- C++
vim.cmd [[autocmd BufWritePre *.cpp lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.hpp lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.cc lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.hh lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.cxx lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.hxx lua vim.lsp.buf.format()]]

-- Elm
vim.cmd [[autocmd BufWritePre *.elm lua vim.lsp.buf.format()]]

-- Rust
vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.format()]]

-- JavaScript
vim.cmd [[autocmd BufWritePre *.js lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.jsx lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.ts lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.tsx lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.json lua vim.lsp.buf.format()]]

-- Ruby
vim.cmd [[autocmd BufWritePre *.rb lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.erb lua vim.lsp.buf.format()]]

local disable_auto_formatting = function()
  vim.cmd [[autocmd WinEnter <buffer> set eventignore+=BufWritePre]]
  vim.cmd [[autocmd WinLeave <buffer> set eventignore-=BufWritePre]]
end

vim.api.nvim_create_user_command("DisableAutoFormattingForBuffer", disable_auto_formatting, {})
