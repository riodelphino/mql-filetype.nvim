local M = {}

function M.create_commands()
   -- :PluginTemplateCommand1
   vim.api.nvim_create_user_command('PluginTemplateCommand1', function()
      M.command1()
   end, { nargs = '?' })
end

function M.command1()
   print('PluginTemplateCommand1 is called.')
end

return M
