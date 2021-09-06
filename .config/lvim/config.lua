--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedark"
vim.g.onedark_style = 'deep'

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.hide_dotfiles = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.telescope.file_ignore_patterns = {"node_modules/*"}

lvim.lsp.diagnostics.virtual_text = false

lvim.builtin.dap.active = true
lvim.builtin.dap.breakpoint.linehl = ""
lvim.builtin.dap.breakpoint.numhl = ""
lvim.builtin.dap.breakpoint.text = ""
lvim.builtin.dap.breakpoint.texthl = "LspDiagnosticsSignError"

local dap_install = require "dap-install"
dap_install.config("jsnode_dbg", {})
require('dap.ext.vscode').load_launchjs()

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--   }
-- }

-- exe value can be "prettier", "prettierd", "eslint", or "eslint_d"
lvim.lang.javascript.formatters = {{
  exe = "eslint_d"
}}
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters

-- exe value can be "eslint" or "eslint_d"
lvim.lang.javascript.linters = {{
  exe = "eslint_d"
}}
lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters

-- exe value can be "prettier", "prettierd", "eslint", or "eslint_d"
lvim.lang.typescript.formatters = {{
  exe = "eslint"
}}
lvim.lang.typescriptreact.formatters = lvim.lang.typescript.formatters

-- exe value can be "eslint" or "eslint_d"
lvim.lang.typescript.linters = {{
  exe = "eslint_d"
}}
lvim.lang.typescriptreact.linters = lvim.lang.typescript.linters

-- Additional Plugins
lvim.plugins = {{"folke/tokyonight.nvim"}, {
  "ray-x/lsp_signature.nvim",
  config = function()
      require"lsp_signature".on_attach()
  end,
  event = "InsertEnter"
}, {
  "folke/trouble.nvim",
  cmd = "TroubleToggle"
}, {
  "folke/todo-comments.nvim",
  event = "BufRead"
}, {
  "phaazon/hop.nvim",
  event = "BufRead",
  config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", {
          silent = true
      })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", {
          silent = true
      })
  end
}, {
  "kevinhwang91/nvim-bqf",
  event = {"BufRead", "BufNew"},
  config = function()
      require("bqf").setup({
          auto_enable = true,
          preview = {
              win_height = 12,
              win_vheight = 12,
              delay_syntax = 80,
              border_chars = {"┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█"}
          },
          func_map = {
              vsplit = "",
              ptogglemode = "z,",
              stoggleup = ""
          },
          filter = {
              fzf = {
                  action_for = {
                      ["ctrl-s"] = "split"
                  },
                  extra_opts = {"--bind", "ctrl-o:toggle-all", "--prompt", "> "}
              }
          }
      })
  end
}, {
  "kevinhwang91/rnvimr",
  cmd = "RnvimrToggle",
  config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
  end
}, {
  "folke/lsp-colors.nvim",
  event = "BufRead"
}, {
  "norcalli/nvim-colorizer.lua",
  config = function()
      require("colorizer").setup({"*"}, {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
  end
}, {
  "metakirby5/codi.vim",
  cmd = "Codi"
}, {
  "rcarriga/nvim-dap-ui",
  config = function()
      require("dapui").setup()
  end
}, {"navarasu/onedark.nvim"}, {
  "nvim-telescope/telescope-project.nvim",
  event = "BufWinEnter",
  setup = function()
      vim.cmd [[packadd telescope.nvim]]
  end
}}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
