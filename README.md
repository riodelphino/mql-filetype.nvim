# mt-ft.nvim

![img/mql_ft.jpg](img/mql_ft.jpg)


## Concept

A neovim plugin for modifying mql4/mql5 filetypes.


## Screenshots

Title for screenshot  
![screenshot_1](img/screenshot_1.png)


## Features

**Main features**
- Modify filetypes ...
   - *.mq4 --> c
   - *.mq5 --> cpp
   - *.mqh
      - No signs              --> cpp (default)
      - with '// mql4' on top --> c
      - with '// mql5' on top --> cpp

**Not implmented**
- Options


## Requirement

**Mandatory**
- nvim v0.10.2 (My environment. It seems to work in a little older versions.)


## Installation

Using [Lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
-- Minimum config:
return {
   'riodelphino/mql_ft.nvim',
   dependencies = {
      'nvim-lua/plenary.nvim',
   },
   lazy = true,
   ft = {},
   cmds = {
      { 'MQLFtCommand1' },
   },
   opts = {
      option_1 = '',
      option_2 = {
         sub_option_1 = '',
      },
   },
   keys = {
      { '<F1>', '<cmd>MQLFtCommand1<cr>' },
   },
}
```


## Default options

```lua
opts = {
   option_1 = '',
   option_2 = {
      sub_option_1 = '',
   },
}
```


## License

[MIT License](./LICENSE)


## TO-DO

- [ ] Options to work

