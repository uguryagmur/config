local use = require("packer").use
require("packer").startup(function()
  -- plugin manager
  use "wbthomason/packer.nvim"

  -- plugin for enhanced highlight
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- plugin for fuzzy search
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } }
  }

  -- plugins for lsp configuration
  use "neovim/nvim-lspconfig"
	use "williamboman/nvim-lsp-installer"

  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/nvim-compe"


end)


require("lsp")

require "nvim-treesitter.configs".setup {
  ensure_installed = { "c", "cpp", "cuda", "python" },
  highlight = { enable = true }
}
