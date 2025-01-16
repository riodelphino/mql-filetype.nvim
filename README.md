# mql-filetype.nvim


## Concepts

A neovim plugin for changing filetypes from MQL4/MQL5 to c/cpp.


## Backgrounds

By default, MQL4/MQL5 have:
   - No syntax highlights
   - No linting support.  

It's a tough road.

If you change filetypes to c/cpp, you will get
   - Syntax highlights
   - Unperfect intellisence from clangd/ccls
   - So many linting errors

However, this is much better than the default.  
(Linting errors should be omitted by lspconfig.)


## Features

**Main features**  
   - Change filetype `*.mq4` to c.
   - Change filetype `*.mq5` to cpp.
   - Change `*.mqh` filetype to c/cpp depending on [the conditions](#conditions).


## Requirement

- nvim v0.10.2 (Seems to work in older versions.)


## Intellisence
If you require intellisence support:
   - Setup `clangd` or `ccls` in lspconfig
   - Omit errors

> [!Warning]
> The code analyzing is not perfect, because of the differences between c/cpp and mql4/mql5.


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
      mq4 = 'c',
      mq5 = 'cpp',
      mqh = 'c',
   },
   mqh = {
      modifier = {
         c = { '^// mql4$', '^// MQL4$' },
         cpp = { '^// mql5$', '^// MQL5$' },
      },
   },
}
```


## Conditions

With default options, filetype changings are processed by below conditions.

*.mq4, *.mq5:
| File pattern | Changed to |
| ------------ | ---------- |
| `*.mq4`      | c          |
| `*.mq5`      | cpp        |

*.mqh:
| File pattern | First line             | Changed to |
| ------------ | ---------------------- | ---------- |
| `*.mqh`      | `// mql4` or `// MQL4` | c          |
| `*.mqh`      | `// mql5` or `// MQL5` | cpp        |
| `*.mqh`      | None of above          | c          |

This means:
   - `*.mq4` is forced to be `c`.
   - `*.mq5` is forced to be `cpp`.
   - `*.mqh` is changed to `c` or `cpp`, depends on the first line.


## License

[MIT License](./LICENSE)

