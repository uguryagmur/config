require("plugins")

compile_and_execute_cc_file = function()
  local compile_result = os.execute('g++ -Wall ' .. vim.fn.expand('%') .. ' -o program')
  print(compile_result)
  os.execute('./program')
end
