return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.oxocarbon-nvim", enabled = true },
  { import = "astrocommunity.completion.copilot-lua" },
  { -- further customize the options set by the community
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
        },
      },
    },
  },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = 120,
      disabled_filetypes = { "help" },
    },
  },
  -- {
  --   "akinsho/toggleterm.nvim",
  --   opts = {
  --     size = 10,
  --     open_mapping = "[[<C-,>]]",
  --     shading_factor = 2,
  --     direction = "float",
  --     float_opts = {
  --       border = "curved",
  --       highlights = { border = "Normal", background = "Normal" },
  --     },
  --   }
  -- },
}
