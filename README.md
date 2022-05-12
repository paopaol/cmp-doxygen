# cmp-path

nvim-cmp source for doxygen keywords.

# install

```lua
  use {
    "paopaol/cmp-doxygen",
    requires = "nvim-treesitter/nvim-treesitter",
  }
```

# Setup

```lua
require'cmp'.setup {
  sources = {
    { name = 'doxygen' }
  }
}
```

## Configuration

The below source configuration options are available. To set any of these options, do:

```lua
cmp.setup({
  sources = {
    {
      name = 'doxygen',
      option = {
        -- Options go into this table
      },
    },
  },
})
```

## Trigger On

`@`
