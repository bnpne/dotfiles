vim.opt.guicursor = 'n-v-c:block,i-ci-ve:ver100/,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'
vim.opt.cursorline = false                                                  -- highlight the current line

vim.opt.number = true                                                       -- Set numbered lines
--vim.opt.relativenumber = true                               -- Set relative numbered lines
local group = vim.api.nvim_create_augroup('numbertoggle', { clear = true }) -- set relative numbered lines only on highlighted buffer
vim.api.nvim_create_autocmd(
  { 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' },
  { group = group, command = 'if &nu  | set rnu   | endif' }
)
vim.api.nvim_create_autocmd(
  { 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' },
  { group = group, command = 'if &nu  | set nornu | endif' }
)

vim.opt.list = false                                        -- Hide characters on tabs and spaces
vim.opt.scrolloff = 8                                       -- Minimal number of screen lines to keep above and below the cursor
vim.opt.fillchars.eob = ' '                                 -- Empty lines at the end of a buffer as ` `
vim.opt.wrap = false                                        -- Display long lines as just one line
vim.opt.sidescrolloff = 8                                   -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.linebreak = true                                    -- Wrap long lines at a character in 'breakat'
vim.opt.textwidth = 120                                     -- Maximum width of text that is being inserted
vim.cmd('set fo-=1')                                        -- Don't break lines after a one-letter word

vim.opt.showtabline = 2                                     -- Always show tabs
vim.opt.tabstop = 2                                         -- Insert 2 spaces for a tab
vim.opt.softtabstop = 2                                     -- Number of spaces tabs count for while editing
vim.opt.shiftwidth = 2                                      -- the number of spaces inserted for each indentation
vim.opt.expandtab = true                                    -- convert tabs to spaces
vim.opt.smartindent = true                                  -- Makes indenting smart

vim.opt.signcolumn = 'yes'                                  -- Always show the signcolumn
vim.opt.foldcolumn = '1'                                    -- '0' is not bad
vim.opt.foldlevel = 99                                      -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99                                 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldenable = false                                  -- Disable folding

vim.opt.hlsearch = false                                    -- Highlight on search
vim.opt.incsearch = true                                    -- While typing a search command, show where the pattern matches

vim.opt.conceallevel = 0                                    -- so that `` is visible in markdown files
vim.opt.formatoptions = vim.o.formatoptions:gsub('cro', '') -- Avoid comments to continue on new lines
vim.opt.updatetime = 300                                    -- Faster completion
vim.opt.mouse = 'a'                                         -- Enable mouse mode
vim.opt.clipboard = 'unnamedplus'                           -- Sync clipboard between OS and Neovim
vim.opt.cmdheight = 1                                       -- More space in the neovim command line for displaying messages
vim.opt.breakindent = true                                  -- Enable break indent
vim.opt.ignorecase = true                                   -- Ignore case in search patterns
vim.opt.smartcase = true                                    -- Override `'ignorecase'` if the search pattern contains upper case characters
vim.opt.wildignore:append { '*/node_modules/*' }            -- Ignore when expanding wildcards, completing file or directory names

vim.opt.splitbelow = true                                   -- force all horizontal splits to go below current window
vim.opt.splitright = true                                   -- force all vertical splits to go to the right of current window
vim.opt.laststatus = 3                                      -- Global statusline when on split

vim.g.markdown_recommended_style = 0                        -- Disable default markdown styles (see https://www.reddit.com/r/neovim/comments/z2lhyz/comment/ixjb7je)
-- vim.opt.list = true
-- vim.opt.listchars = 'eol:↲'
