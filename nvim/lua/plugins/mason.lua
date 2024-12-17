require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "pylsp",
    "html",
    "jsonls",
    "cssls",
    "tsserver"
  }
})
require("mason-lspconfig").setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {}
  end,
}
