local U = {}
U.qf_open = function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      return true
    end
  end
  return false
end

return U
