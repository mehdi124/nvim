require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  playground = {
    enable = true,
  },
  --indent = { enable = true },
  refactor = {
    --smart_rename = { enable = true, keymaps = { smart_rename = "grr" } },
    highlight_definitions = { enable = true },
    --navigation = {
      --enable = true,
      --keymaps = {
        --goto_definition_lsp_fallback = "gnd",
        --list_definitions = "gnD",
        --list_definitions_toc = "gO",
      --},
    --},
     --highlight_current_scope = {enable = true}
  },
}
