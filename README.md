# mql-filetype.nvim

![img/logo.jpg](img/logo.jpg)

A Neovim plugin that detects MQL4/MQL5 filetypes and attaches the appropriate C/C++ treesitter parser for highlighting.


## Backgrounds

Issues:
- `*.mq5` and `*.mq4` are lack of:
   - Syntax highlights
   - LSP diagnostics
   - Completion
   - Formatting
- Also cannot determine filetype for `*.mqh`

This plugin is trying to bridge and resolve them.


## Features

- Set filetypes for `*.mq5`|`*.mq4`
- Detect filetypes for `*.mqh`
- Set treesitter highlight parsers


## Requirement

- nvim > v0.10.2


## Installation

Using [Lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
-- Minimum config:
return {
   'riodelphino/mql-filetype.nvim',
   lazy = true,
   event = { 'BufReadPre *.mq[45h]', 'BufNewFile *.mq[45h]' },
}
```


## Default options

```lua
opts = {
   extension = {
      mq4 = 'mql4',
      mq5 = 'mql5',
      mqh = function(path, bufnr)
         local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ''
         if first_line:match('^%s*//%s*mql5') then     -- ex.) `// mql5`
            return 'mql5', function(b)
               vim.treesitter.start(b, 'cpp')          -- Use `cpp` TS parser
            end
         elseif first_line:match('^%s*//%s*mql4') then -- ex.) `// mql4`
            return 'mql4', function(b)
               vim.treesitter.start(b, 'c')            -- Use `c` TS parser
            end
         end
         -- fallback
         return 'mql5', function(b)
            vim.treesitter.start(b, 'cpp')
         end
      end,
   },
}
```
> [!Note]
> `vim.filetype.add()` detectors can return a second value — a callback that only fires when the filetype is actually applied, not on every query.


With the above default options, filetype and treesitter parser are set as follows:

| Pattern | Condition                        | Filetype | TS Parser |
| ------- | -------------------------------- | -------- | --------- |
| `*.mq5` | -                                | mql5     | cpp       |
| `*.mqh` | 1st line: `// mql5` or `// MQL5` | mql5     | cpp       |
| `*.mq4` | -                                | mql4     | c         |
| `*.mqh` | 1st line: `// mql4` or `// MQL4` | mql4     | c         |
| `*.mqh` | 1st line: anything else          | mql5     | cpp       |

This means:
- `*.mq5` is always treated as `mql5`.
- `*.mq4` is always treated as `mql4`.
- `*.mqh` is treated as `mql5` or `mql4`, depending on its first line.


## License

[MIT License](./LICENSE)

