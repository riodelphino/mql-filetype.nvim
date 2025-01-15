local M = {}

local loaded = false

-- local fn = require('plugin_template.functions')
local opt = require('plugin_template.options')
local cmd = require('plugin_template.commands')
local aucmd = require('plugin_template.autocmd')
local core = require('plugin_template.core')

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
