# mt-ft.nvim

![img/mql_ft.jpg](img/mql_ft.jpg)


## Concept

A neovim plugin for something.


## Screenshots

Title for screenshot  
![screenshot_1](img/screenshot_1.png)


## Features

**Main features**
- Do something usefull.

**Not implmented**
- Do something unusefull


## Requirement

**Mandatory**
- nvim v0.10.2 (My environment. It seems to work in a little older versions.)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) for async

**Optional plugins**
- [nvim-notify](https://github.com/rcarriga/nvim-notify) Cool style notify messages


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


## Commands

Description for commmand:
```vim
" Command1
:MQLFtCommand1
```

## Lua functions

Below lua functions are also available.
```lua
-- Execute command1
require('mql_ft').command1()
```

## Keymaps

Sample keymaps:
```lua
keys = {
    { 'your_key_here', '<cmd>MQLFtCommand1<cr>' },
},
```

## License

[MIT License](./LICENSE)


## TO-DO

- [ ] Add something usefull.

