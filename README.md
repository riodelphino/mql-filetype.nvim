# mql-filetype.nvim


## Concept

A neovim plugin for changing filetypes from MQL4/MQL5 to c/cpp.


## Story

By default, MQL4/MQL5 only provide basic syntax highlighting, with no linting support.  
It's a tough road.

If you change filetypes to c/cpp, many linting errors are shown and linting is not perfect.

However, this is much better than the default.  
(Linting errors should be ommited by lspconfig.)


## Features

**Main features**  
   - Change filetype `*.mq4` to c.
   - Change filetype `*.mq5` to cpp.
   - Change `*.mqh` filetype to c/cpp depending on [the conditions](#conditions).

**Not implmented**  
   - Options


## Requirement

- nvim v0.10.2 (Seems to work in older versions.)

**Optional**  
If you require linting support, follow this.  

- `clangd` or `ccls` is set in lspconfig, and errors are omitted.

Note that it's not perfect.



## Installation

Using [Lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
-- Minimum config:
return {
   'riodelphino/mql-filetype.nvim',
   lazy = true,
   ft = { 'c', 'cpp' },
}
```


## Default options

There is no options.


## Conditions

Changing filetype is processed by below conditions.

| File pattern | First line | Changed to |
| ------------ | ---------- | ---------- |
| `*.mq4`      |            | c          |
| `*.mq5`      |            | cpp        |
| `*.mqh`      |            | c          |
| `*.mqh`      | `// mql4`  | c          |
| `*.mqh`      | `// mql5`  | cpp        |

This means:
   - `*.mq4` is forced to c.
   - `*.mq5` is forced to cpp.
   - `*.mqh` is changed to c or cpp, depends on first line is `// mql4` or `// mql5` or none.


## License

[MIT License](./LICENSE)


## TO-DO

- [ ] Options to work

