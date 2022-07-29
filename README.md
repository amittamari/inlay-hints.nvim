# inlay-hints.nvim

Neovim support for LSP Inlay Hints

## Prerequisites

- `neovim 0.7+`

## Installation

using `packer.nvim`

```lua
use('simrat39/inlay-hints.nvim')
```

<b>Look at the configuration information below to get started.</b>

## Setup

Put this in your init.lua or any lua file that is sourced.<br>

```lua
require("inlay-hints").setup()
```

## Usage

The plugin hooks itself to the on_attach callback of an LSP Server. Some servers might need extra configuration to enable inlay hints. See the examples below to get started.

### w/ sumneko_lua
```lua
local ih = require("inlay-hints")
local lspconfig = require("lspconfig")

lspconfig.sumneko_lua.setup({
  on_attach = function(c, b)
    ih.on_attach(c, b)
  end,
  settings = {
    Lua = {
      hint = {
        enable = true,
      },
    },
  },
})
```

### w/ rust-tools.nvim
```lua
local ih = require("inlay-hints")

require("rust-tools").setup({
  tools = {
    on_initialized = function()
      ih.set_all()
    end,
    inlay_hints = {
      auto = false,
    },
  },
  server = {
    on_attach = function(c, b)
      ih.on_attach(c, b)
    end,
  },
})
```

### w/ tsserver
```lua
local ih = require("inlay-hints")
local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
  on_attach = function(c, b)
    ih.on_attach(c, b)
  end,
  settings = {
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
})
```