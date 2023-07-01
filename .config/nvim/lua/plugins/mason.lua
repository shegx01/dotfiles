local options = {
  automatic_installation = true,

  ui = {
    icons = {
      package_installed = " ",
      package_pending = " ",
      package_uninstalled = " -±",
    },
  },
}

require("mason").setup(options)
