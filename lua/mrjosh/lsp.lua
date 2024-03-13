local vim = vim
local lspconfig = require 'lspconfig'
local util = require 'lspconfig.util'

local capabilities = require 'cmp_nvim_lsp'
  .default_capabilities(vim.lsp.protocol.make_client_capabilities())

local function on_attach(client, bufnr)
  require'lsp_compl'.attach(client, bufnr, { server_side_fuzzy_completion = true })
end

lspconfig.phpactor.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"/Users/mehdi/.bin/phpactor/phpactor.phar"},
  filetypes = {"php"};
  init_options = {
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = false,
  },
  root_dir = function(fname)
    return util.root_pattern('composer.json')(fname)
  end,
}

--lspconfig.rust_analyzer.setup {
  --on_attach=on_attach,
  --capabilities = capabilities,
  --cmd = {"/Users/josh/.local/share/nvim/lsp_servers/rust/rust-analyzer"},
  --filetypes = {"rust"};
  --settings = {
    --["rust-analyzer"] = {
      --cargo = { loadOutDirsFromCheck = true },
      --procMacro = { enable = true },
      --hoverActions = { references = true },
    --}
  --}
--}

lspconfig.yamlls.setup{
  cmd = {"/opt/homebrew/bin/yaml-language-server"},
  on_attach=on_attach,
}

--require'lspconfig'.terraformls.setup{
  --capabilities = capabilities,
  --on_attach=on_attach,
  --filetypes = {"hcl", "tf", "tfvars"},
  --cmd = {"/Users/josh/.homebrew/Cellar/terraform-ls/0.31.1/bin/terraform-ls", "serve"},
--}

--require'lspconfig'.sourcekit.setup{
  --capabilities = capabilities,
  --on_attach=on_attach,
--}

--vim.api.nvim_create_autocmd({"BufWritePre"}, {
  --pattern = {"*.tf", "*.tfvars"},
  --callback = vim.lsp.buf.formatting_sync,
--})

require'lspconfig'.html.setup {
  capabilities = capabilities,
  on_attach=on_attach,
}

require'lspconfig'.tsserver.setup{
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
}

-- nginx lsp
require'lspconfig'.nginx_language_server.setup{
  cmd = { "/Users/mehdi/Library/Python/3.9/bin/nginx-language-server" },
  on_attach = on_attach,
  capabilities = capabilities,
}

--require'lspconfig'.volar.setup{
  --filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
--}

----require'lspconfig'.vuels.setup{
  ----cmd = {"/Users/josh/.local/share/nvim/lsp_servers/vuels/node_modules/vls/bin/vls"},
  ----root_dir = util.root_pattern("package.json", "vue.config.js"),
  ----init_options = {
    ----preferences = {
      ----disableSuggestions = true,
    ----},
  ----},
----}

require'lspconfig'.cssls.setup {
  filetypes = { "css", "scss", "less" },
  capabilities = capabilities,
}

require'lspconfig'.cssmodules_ls.setup{
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  cmd = {"cssmodules-language-server"},
  capabilities = capabilities,
}

lspconfig.gopls.setup{
  on_attach=on_attach,
  filetypes = { "go", "gomod" },
  cmd = {"gopls", "serve"},
  capabilities = capabilities,
}

--local configs = require'lspconfig.configs'
--if not configs.helm_ls then
  --configs.helm_ls = {
    --default_config = {
      --cmd = {"/Users/josh/.bin/helm_ls", "serve"},
      --filetypes = {'helm', 'yaml'},
      --root_dir = function(fname)
        --return util.root_pattern('Chart.yaml')(fname)
      --end,
    --},
  --}
--end

--lspconfig.helm_ls.setup {}

lspconfig.golangci_lint_ls.setup{
  on_attach=on_attach,
  filetypes = {"go", "gomod"},
  capabilities = capabilities,
  init_options = {
    command = {
      'golangci-lint',
      'run',
      '--skip-files', '.*.gen.go',
      '--skip-files', '.*_test.go',
      '--disable-all',
      '-E', 'structcheck',
      '-E', 'deadcode',
      '-E', 'gocyclo',
      '-E', 'ineffassign',
      '-E', 'revive',
      '-E', 'errcheck',
      '-E', 'varcheck',
      '-E', 'goconst',
      '-E', 'megacheck',
      '-E', 'misspell',
      '-E', 'unused',
      '-E', 'typecheck',
      '-E', 'staticcheck',
      '-E', 'govet',
      '--out-format',
      'json',
    },
  },
  --root_dir = util.root_pattern('go.work') or util.root_pattern('go.mod', '.golangci.yaml', '.git'),
  root_dir = function(fname)
    return util.root_pattern 'go.work'(fname) or util.root_pattern('go.mod', '.git')(fname)
  end,
}

--lspconfig.lua_ls.setup {
  --on_attach = on_attach,
  --capabilities = capabilities,
  --cmd = {"/Users/josh/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"};
  --settings = {
    --Lua = {
      --runtime = {
        ---- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        --version = 'LuaJIT',
        ---- Setup your lua path
        --path = vim.split(package.path, ';'),
      --},
      --diagnostics = {
        ---- Get the language server to recognize the `vim` global
        --globals = {'vim'},
      --},
      --workspace = {
        ---- Make the server aware of Neovim runtime files
        --library = {
          --[vim.fn.expand('$VIMRUNTIME/lua')] = true,
          --[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        --},
      --},
    --},
  --},
--}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
  }
)

require 'mrjosh.lsp-compe'
--require 'mrjosh.snippets'
