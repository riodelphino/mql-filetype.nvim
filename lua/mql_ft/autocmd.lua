local M = {}

function M.create_autocmd()
   vim.api.nvim_create_autocmd({ 'BufEnter' }, {
      pattern = { '*.mqh' },
      callback = function()
         M.core_operation()
      end,
   })
end

return M
