-- core configuration
vim.opt.number = true
vim.opt.syntax = "on"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true


-- key binding adjustment
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- vim.api.nvim_set_keymap('i', '<Esc>', [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
vim.keymap.set('n', '<leader>y', '"+yy', { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>P', '"+P', { desc = 'Telescope find files' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Telescope find files' })

-- color scheme
vim.cmd.colorscheme('vscode')

-- telescope configuration
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>gf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>gg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>gb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>gh', builtin.help_tags, { desc = 'Telescope help tags' })

-- floaterm configuration
vim.g.floaterm_keymap_new    = '<leader>fc'
vim.g.floaterm_keymap_prev   = '<leader>fp'
vim.g.floaterm_keymap_next   = '<leader>fn'
vim.g.floaterm_keymap_toggle = '<leader>ft'

-- luline configuration
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    --component_separators = { left = '', right = ''},
    --section_separators = { left = '', right = ''},
    component_separators = { left = ' ', right = ' '},
    section_separators = { left = ' ', right = ' '},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- lsp configuration
require'lspconfig'.clangd.setup{
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  init_options = {
    fallbackFlags = {'--std=c++20'}
  },
}
require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 100
        }
      }
    }
  }
}
require'lspconfig'.rust_analyzer.setup{}

-- coq configuration
vim.g.coq_settings = {
  auto_start = true
}

-- nvim tree configuration
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true
require("nvim-tree").setup({})
vim.keymap.set('n', '<leader>t', ":NvimTreeToggle<CR>", { desc = 'Telescope find files' })


-- treesitter configuration
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "markdown", "javascript",
  			"markdown_inline", "python", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

-- plugin configuration
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
	use {'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { {'nvim-lua/plenary.nvim'}}}
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true }}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'nvim-tree/nvim-web-devicons'}
  use {'nvim-tree/nvim-tree.lua'}
  use {'wbthomason/packer.nvim'}
	use {'neovim/nvim-lspconfig'}
  use {'voldikss/vim-floaterm'}
  use {'shaunsingh/nord.nvim'}
	use {'AlexvZyl/nordic.nvim'}
  use {'Mofiqul/vscode.nvim'}
	use {'ms-jpq/coq_nvim'}
end)
