local M = {}

local loaded = false

-- local fn = require('mql_filetype.functions')
local opt = require('mql_filetype.options')
local aucmd = require('mql_filetype.autocmd')
local core = require('mql_filetype.core')

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
