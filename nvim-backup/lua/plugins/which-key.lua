return {
  'folke/which-key.nvim',
  event = 'BufReadPre',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {

  }
}
