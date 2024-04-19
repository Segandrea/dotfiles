return {
  'Mofiqul/dracula.nvim',
  commit = '8d8bddb',
  config = function()
    vim.cmd.colorscheme('dracula')
    vim.cmd.highlight('CurSearch guifg=#44475A guibg=#6272a4')
  end
}
