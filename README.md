# cmp-doxygen

cmp-doxygen is an [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) source for
doxygen keywords. It triggers after typing `@`.

## Installation

```lua
use { "paopaol/cmp-doxygen", requires = "nvim-treesitter/nvim-treesitter" }
```

## Setup

```lua
require "cmp".setup { sources = { { name = "doxygen" } } }
```
