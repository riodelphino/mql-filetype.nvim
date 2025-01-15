local M = {}

function M.is_array(table)
   local is_array_flg = true
   for k, v in pairs(table) do
      if type(k) ~= 'number' or type(v) ~= 'string' then
         is_array_flg = false
         break
      end
   end
   return is_array_flg
end

return M
