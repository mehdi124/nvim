P = function(v)
  print(vim.inspect(v))
  return v
end


-- Plugins
require 'mrjosh.plugins'

-- Settings for plugins
require 'mrjosh.settings'

--require 'mrjosh.neogit'

-- Nvim treesitter
require 'mrjosh.treesitter'

-- Global options
require 'mrjosh.options'

-- Global remaps
require 'mrjosh.keymaps'

-- nvim-spectre configs
-- https://github.com/nvim-pack/nvim-spectre
require 'mrjosh.spectre'

-- Vim autocommands
require 'mrjosh.autocmds'

require 'mrjosh.snippets'

-- nvim builtin lsp configurations
require 'mrjosh.lsp'

require 'mrjosh/markdown'

require 'mrjosh.colorbuddy'

require 'mrjosh.go_tag'
