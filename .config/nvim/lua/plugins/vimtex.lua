return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    --     vim.g.vimtex_syntax_conceal_disable = 1
    vim.g.vimtex_view_method = "zathura_simple"
    vim.g.vimtex_quickfix_mode = 2
    vim.g.vimtex_mappings_enabled = 1
    vim.g.vimtex_mappings_prefix = "<localleader>l"
    vim.g.vimtex_indent_enabled = 1
    vim.g.vimtex_context_pdf_viewer = "okular"
    vim.g.vimtex_log_ignore = {
      "Underfull",
      "Overfull",
      "specifier changed to",
      "Token not allowed in a PDF string",
    }
    vim.g.vimtex_syntax_custom_cmds = {
      {
        name = "Yo",
        mathmode = true,
        concealchar = "よ",
      },
      {
        name = "yo",
        mathmode = true,
        concealchar = "よ",
      },
      {
        name = "fun",
        mathmode = true,
        conceal = true,
        argstyle = "bold",
      },
    }
  end,
}
