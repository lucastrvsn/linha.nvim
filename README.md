# linha.nvim 🪡

`linha` is a simple to use and declarative statusline for neovim.
You put the tables and it give you lines.

## Install

#### Requirements

- Neovim 0.5 (nightly build)

#### packer.nvim

```lua
use {
  'lucastrvsn/linha.nvim',
  config = function()
    -- your setup
    require('linha').setup(...)
  end,
}
```

#### vim-plug

```vim
Plug 'lucastrvsn/linha.nvim'

lua << EOF
  -- your setup
  require('linha').setup(...)
EOF
```

## Usage

TODO

## Roadmap

- [ ] all builtin modules planned
- [ ] update documentation and usage
- [ ] tests and tests
- [ ] better way to handle modules caching
- [ ] improve async loading
