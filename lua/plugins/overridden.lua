return {
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(
        function(v) return not vim.tbl_contains({ "basedpyright" }, v) end,
        require("astrocore").list_insert_unique(opts.ensure_installed, { "pyright" })
      )
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(
        function(v) return not vim.tbl_contains({ "basedpyright" }, v) end,
        require("astrocore").list_insert_unique(opts.ensure_installed, { "pyright", "black", "isort", "debugpy" })
      )
    end,
  },

  {
    "Saghen/blink.cmp",
    opts = {
      sources = {
        providers = {
          path = { score_offset = 3 },
          lsp = { score_offset = 0 },
          snippets = { score_offset = -1 },
          -- buffer = { score_offset = -3 },
        },
      },
    },
  },
  { "akinsho/toggleterm.nvim", config = function() require("toggleterm").setup { direction = "float" } end },
  {
    "L3MON4D3/LuaSnip",
    opts = function(plugin, opts)
      -- include the default astronvim config that calls the setup call
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
      -- load snippets paths
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { vim.fn.stdpath "config" .. "/snippets" },
      }
    end,
  },
  {
    "catppuccin/nvim",
    opts = function(_, opts) opts.no_italic = true end,
  },
  {
    "nvim-neotest/neotest-python",
    opts = function(_, opts)
      opts.dap = { justMyCode = false }
      opts.args = { "--no-cov" }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.window = vim.tbl_extend("force", opts.window, {
        width = 40,
      })
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    lazy = true,
    ft = "python",
    opts = {
      options = {},
    },
    cmd = { "VenvSelect" },
  },
}
