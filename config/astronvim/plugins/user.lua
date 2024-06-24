return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  "sainnhe/gruvbox-material",
  {
    "ruifm/gitlinker.nvim",
    requires = "nvim-lua/plenary.nvim",
    event = "BufRead",
    config = function()
      require("gitlinker").setup({
      -- default mapping to call url generation with action_callback
        mappings = "<leader>gy"
      })
    end,
  },
}
