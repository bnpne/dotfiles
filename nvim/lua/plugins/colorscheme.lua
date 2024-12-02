return {
  {
    'Mofiqul/vscode.nvim',
    name = 'vscode',
    lazy = false,
    priority = 1000,
    config = function()
      require('vscode').setup({
        -- transparent = true,
        italic_comments = true,
      })
      vim.api.nvim_command('colorscheme vscode')
    end
  }
}
