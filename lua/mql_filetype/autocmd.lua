local M = {}

local core = require('mql_filetype.core')
local opt = require('mql_filetype.options')

function M.create_autocmd()
   -- Set `update_mqh_filetype()` function to `BufWritePre`
   vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = '*.mqh',
      callback = function(args)
         core.update_mqh_filetype(args)
      end,
   })

   vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'mql4', 'mql5' },
      callback = function(args)
         vim.treesitter.start(args.buf, opt.opts.parsers[args.match])
      end,
   })
end

return M
