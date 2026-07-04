local M = {}

local opt = require('mql_filetype.options')

-- Add filetypes
function M.add_filetype()
   vim.filetype.add({
      extension = opt.opts.extension,
   })
end

-- Update *.mqh filetype
function M.update_mqh_filetype(args)
   local ft = vim.filetype.match({ buf = args.buf })
   if ft and ft ~= vim.bo[args.buf].filetype then vim.bo[args.buf].filetype = ft end
end

return M
