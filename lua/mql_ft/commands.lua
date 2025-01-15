local M = {}

function M.create_commands()
   -- :MQLFtCommand1
   vim.api.nvim_create_user_command('MQLFtCommand1', function()
      M.command1()
   end, { nargs = '?' })
end

function M.command1()
   print('MQLFtCommand1 is called.')
end

return M
