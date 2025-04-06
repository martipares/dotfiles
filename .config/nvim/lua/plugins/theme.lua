return {
  { "folke/tokyonight.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    -- theme tokyonight.nvim moon, storm, night, day
    opts = {
      style = "moon",
      on_colors = function(colors)
      colors.fg = "#ffffff"
      colors.fg_dark = "#bbbbbb"
      colors.fg_gutter = "#999999"
      end,
    },
  }
}
