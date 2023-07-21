local options = {
  ensure_installed = { "pyright", "texlab", "clangd", "lua_ls", "rust_analyzer", "elixirls", "zls" },
}

require("mason-lspconfig").setup(options)
