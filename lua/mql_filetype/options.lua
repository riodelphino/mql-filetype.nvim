local M = {}

M.opts = {}

M.default_opts = {
   extension = {
      mq4 = 'c',
      mq5 = 'cpp',
      mqh = 'c',
   },
   mqh = {
      modifier = {
         c = { '^// mql4$', '^// MQL4$' },
         cpp = { '^// mql5$', '^// MQL5$' },
      },
   },
}

function M.merge_user_opts(user_opts)
   M.opts = M.deep_merge(M.default_opts, user_opts)
end

function M.deep_merge(default, merge)
   fn = require('mql_filetype.functions')

   if type(merge) ~= 'table' then return default end

   -- Iterate through all keys in the default table
   for key, default_value in pairs(default) do
      if merge[key] == nil then
         -- If the key is missing in the merge table, use the default value
         merge[key] = default_value
      elseif type(default_value) == 'table' then
         if fn.is_array(default[key]) then -- If the value is a array, just overwrite all by merge
            merge[key] = merge[key]
         else
            -- If the value is a table, recurse
            merge[key] = M.deep_merge(default_value, merge[key])
         end
      end
   end
   return merge
end

return M
