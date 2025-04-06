-- Some LaTeX-specific conditional expansion functions (requires VimTeX)

local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function()  -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function()  -- equation environment detection
    return tex_utils.in_env('equation')
end
tex_utils.in_itemize = function()  -- itemize environment detection
    return tex_utils.in_env('itemize')
end
tex_utils.in_tikz = function()  -- TikZ picture environment detection
    return tex_utils.in_env('tikzpicture')
end

return {

require("luasnip").snippet(
    {
      trig="@cd",
      dscr="tikz-cd",
      regTrig=true, -- or false (default is false)
      wordTrig = false, -- or true (default is true)
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \begin{tikzcd}
       <> & <> \\
       <> & <>
      \end{tikzcd}
      ]],
      {
      i(1),
      i(2),
      i(3),
      i(4),
      }
    )
),

require("luasnip").snippet(
    {
      trig="@Cd",
      dscr="tikz-cd",
      regTrig=true, -- or false (default is false)
      wordTrig = false, -- or true (default is true)
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \[
      \begin{tikzcd}
       <> & <> \\
       <> & <>
      \end{tikzcd}
      \]
      ]],
      {
      i(1),
      i(2),
      i(3),
      i(4),
      }
    )
),

require("luasnip").snippet(
    {
      trig="@ocd",
      dscr="tikz-cd",
      regTrig=true, -- or false (default is false)
      wordTrig = false, -- or true (default is true)
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \begin{tikzcd}[<>]
       <> & <> \\
       <> & <>
      \end{tikzcd}
      ]],
      {
      i(1),
      i(2),
      i(3),
      i(4),
      i(5),
      }
    )
),

require("luasnip").snippet(
    {
      trig="@oCd",
      dscr="tikz-cd",
      regTrig=true, -- or false (default is false)
      wordTrig = false, -- or true (default is true)
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \[
      \begin{tikzcd}[<>]
       <> & <> \\
       <> & <>
      \end{tikzcd}
      \]
      ]],
      {
      i(1),
      i(2),
      i(3),
      i(4),
      i(5),
      }
    )
),

require("luasnip").snippet(
    {
      trig="@CD",
      dscr="tikz-cd",
      regTrig=true, -- or false (default is false)
      wordTrig = false, -- or true (default is true)
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \begin{equation}
      \begin{tikzcd}
       <> & <> \\
       <> & <>
      \end{tikzcd}
      \end{equation}
      ]],
      {
      i(1),
      i(2),
      i(3),
      i(4),
      }
    )
),

require("luasnip").snippet(
    {
      trig="@LCD",
      dscr="tikz-cd",
      regTrig=true, -- or false (default is false)
      wordTrig = false, -- or true (default is true)
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \begin{equation}\label{<>}
      \begin{tikzcd}
       <> & <> \\
       <> & <>
      \end{tikzcd}
      \end{equation}
      ]],
      {
      i(1),
      i(2),
      i(3),
      i(4),
      i(5),
      }
    )
),

require("luasnip").snippet(
    {
      trig="@OLCD",
      dscr="tikz-cd",
      regTrig=true, -- or false (default is false)
      wordTrig = false, -- or true (default is true)
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \begin{equation}\label{<>}
      \begin{tikzcd}[<>]
       <> & <> \\
       <> & <>
      \end{tikzcd}
      \end{equation}
      ]],
      {
      i(1),
      i(2),
      i(3),
      i(4),
      i(5),
      i(6),
      }
    )
),

require("luasnip").snippet(
    {
      trig="@Arr",
      dscr="arrow",
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \arrow[<>]
      ]],
      {
      i(1),
      }
    )
),

require("luasnip").snippet(
    {
      trig="@arr",
      dscr="arrow with label",
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \arrow[<>, "<>"<>]
      ]],
      {
      i(1),
      i(2),
      i(3),
      }
    )
),

require("luasnip").snippet(
    {
      trig="@narr",
      dscr="named arrow",
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \arrow[<>, "<>"{name=<>}<>]
      ]],
      {
      i(1),
      i(2),
      i(3),
      i(4),
      }
    )
),

require("luasnip").snippet(
    {
      trig="@ftarr",
      dscr="from to arrow",
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \arrow[<>, fom=<>, to=<>]
      ]],
      {
      i(1),
      i(2),
      i(3),
      }
    )
),

require("luasnip").snippet(
    {
      trig="@larr",
      dscr="from to arrow with label",
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \arrow[<>, fom=<>, to=<>, "<>"<>]
      ]],
      {
      i(1),
      i(2),
      i(3),
      i(4),
      i(5),
      }
    )
),


require("luasnip").snippet(
    {
      trig="@Narr",
      dscr="from to named arrow",
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \arrow[<>, fom=<>, to=<>, "<>"{name=<>}<>]
      ]],
      {
      i(1),
      i(2),
      i(3),
      i(4),
      i(5),
      i(6),
      }
    )
),

}
