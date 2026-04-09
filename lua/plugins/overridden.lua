return {
  {
    "linux-cultist/venv-selector.nvim",
    lazy = true,
    ft = "python",
    opts = {
      options = {},
    },
    cmd = { "VenvSelect" },
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
    "akinsho/toggleterm.nvim",
    config = function() require("toggleterm").setup { direction = "float" } end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        providers = {
          path = { score_offset = 3 },
          lsp = { score_offset = 0 },
          snippets = { score_offset = -1 },
          buffer = { score_offset = -3 },
        },
      },
    },
  },
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
}
