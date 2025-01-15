local M = {}

-- Plugin's core operations here.
function M.add_filetype()
   -- mq4, mq5, mqh
   vim.filetype.add({
      extension = {
         mq4 = 'c', -- MQL4ファイルはC言語として扱う
         mq5 = 'cpp', -- MQL5ファイルはC++言語として扱う
         mqh = 'cpp', -- 共通ヘッダーファイルはいったんC++として扱う
      },
   })
end

-- mqh ファイルの先頭行に基づいて filetype を設定する関数
-- 先頭行に '// mql4' の記載あり ... c 扱い
-- 先頭行に '// mql5' の記載あり ... cpp 扱い
function M.set_mqh_filetype()
   -- ファイルの先頭行を取得
   local first_line = vim.fn.getline(1)

   -- コメントでファイルタイプを判定
   if first_line:match('^// mql4') then
      vim.bo.filetype = 'c'
   elseif first_line:match('^// mql5') then
      vim.bo.filetype = 'cpp'
   else
      -- デフォルトで c とする（必要に応じて変更）
      vim.bo.filetype = 'cpp'
   end
end

return M
