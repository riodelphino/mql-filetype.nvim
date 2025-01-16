local M = {}

local opt = require('mql_filetype.options')

function M.add_filetype()
   vim.filetype.add({
      extension = opt.opts.extension,
   })
end

-- Set filetype of *.mqh file, based on the first line is...
--    Nothing   --> Leave it as the default filetype set avobe.
--    '// mql4' --> Set filetype as c
--    '// mql5' --> Set filetype as cpp
function M.set_mqh_filetype()
   -- Read first line
   local first_line = vim.fn.getline(1)
   local modifier = opt.opts.mqh.modifier

   -- Change filetype
   for ft, patterns in pairs(modifier) do
      for _, pattern in ipairs(patterns) do
         if first_line:match(pattern) then
            vim.bo.filetype = ft
            return
         end
      end
   end
   -- If not matched, set mqh's default ft.
   vim.bo.filetype = opt.opts.extension.mqh
   -- if first_line:match('^// mql4') then
   --    vim.bo.filetype = 'c'
   -- elseif first_line:match('^// mql5') then
   --    vim.bo.filetype = 'cpp'
   -- end
end

return M
