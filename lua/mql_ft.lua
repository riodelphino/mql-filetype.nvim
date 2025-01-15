local M = {}

local loaded = false

-- local fn = require('mql_ft.functions')
local opt = require('mql_ft.options')
local cmd = require('mql_ft.commands')
local aucmd = require('mql_ft.autocmd')
local core = require('mql_ft.core')

function M.setup(user_opts)
   if loaded then return end
   loaded = true

   -- Merge default & user options
   opt.merge_user_opts(user_opts)

   -- Initializations here.

   -- Core operations here.
   core.core_function()

   -- Commands
   cmd.create_commands()

   -- Autocmd
   aucmd.create_autocmd()
end

return M
