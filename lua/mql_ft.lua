local M = {}

local loaded = false

-- local fn = require('mql_ft.functions')
local opt = require('mql_ft.options')
local aucmd = require('mql_ft.autocmd')
local core = require('mql_ft.core')

function M.setup(user_opts)
   if loaded then return end
   loaded = true

   -- Merge default & user options
   opt.merge_user_opts(user_opts)

   -- Core
   core.add_filetype()

   -- Autocmd
   aucmd.create_autocmd()
end

return M
