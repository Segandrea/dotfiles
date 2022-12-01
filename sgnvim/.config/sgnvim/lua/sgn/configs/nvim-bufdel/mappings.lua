-- (write and) quit with BufDel when possible
local function quit(write)
  if write then vim.cmd.write() end
  local ok, _ = pcall(vim.cmd, 'BufDel')
  if not ok then
    vim.cmd.quit()
  end
end
return {
  {
    desc = '[q]uit',
    mode = 'n', key = '<leader>q', act = function() quit() end,
  },
  {
    desc = '[w]rite and [q]uit',
    mode = 'n', key = '<leader>wq', act = function() quit(true) end,
  },
}
