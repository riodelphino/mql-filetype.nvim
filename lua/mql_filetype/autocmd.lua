local M = {}

local core = require('mql_filetype.core')

function M.create_autocmd()
   -- Set `update_mqh_filetype()` function to `BufWritePre`
   vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = '*.mqh',
      callback = function(args)
         core.update_mqh_filetype(args)
      end,
   })
end

return M
