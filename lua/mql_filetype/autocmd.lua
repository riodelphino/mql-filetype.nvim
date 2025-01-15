local M = {}

local core = require('mql_filetype.core')

function M.create_autocmd()
   -- ファイルを開いた時や保存した時に filetype を自動的に設定する
   vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost' }, {
      pattern = '*.mqh',
      callback = function()
         core.set_mqh_filetype()
      end,
   })
end

return M
