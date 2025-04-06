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
      trig="@begin",
      dscr="begin-end",
      wordTrig = false, -- or true (default is true)
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \begin{<>}
      <>
      \end{<>}
      ]],
      {
      i(1),
      i(2),
      rep(1),
      }
    ),
    { condition = tex_utils.in_text }
),

require("luasnip").snippet(
    {
      trig="@Begin",
      dscr="label-begin-end",
      wordTrig = false, -- or true (default is true)
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \begin{<>}\label{<>}
      <>
      \end{<>}
      ]],
      {
      i(1),
      i(2),
      i(3),
      rep(1),
      }
    ),
    { condition = tex_utils.in_text }
),


require("luasnip").snippet(
    {
      trig="@equ",
      dscr="equation",
      wordTrig = false, -- or true (default is true)
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \begin{equation*}
      <>
      \end{equation*}
      ]],
      {
      i(1),
      }
    ),
    { condition = tex_utils.in_text }
),

require("luasnip").snippet(
    {
      trig="@Equ",
      dscr="equation",
      wordTrig = false, -- or true (default is true)
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \begin{equation}
      <>
      \end{equation}
      ]],
      {
      i(1),
      }
    ),
    { condition = tex_utils.in_text }
),

require("luasnip").snippet(
    {
      trig="@lequ",
      dscr="label-equation",
      wordTrig = false, -- or true (default is true)
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \begin{equation*}\label{<>}
      <>
      \end{equation*}
      ]],
      {
      i(1),
      i(2),
      }
    ),
    { condition = tex_utils.in_text }
),

require("luasnip").snippet(
    {
      trig="@Lequ",
      dscr="label-equation",
      wordTrig = false, -- or true (default is true)
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \begin{equation}\label{<>}
      <>
      \end{equation}
      ]],
      {
      i(1),
      i(2),
      }
    ),
    { condition = tex_utils.in_text }
),




require("luasnip").snippet(
   {
      trig="mm",
      dscr="$ $",
      wordTrig = true,
      snippetType="autosnippet",
    },
  fmta(
    "$<>$",
    {
      i(1),
    }
  ),
    {condition = tex_utils.in_text}
),


require("luasnip").snippet(
   {
      trig="\\()",
      dscr="( )",
      wordTrig = false,
      snippetType="autosnippet",
    },
  fmta(
    "\\left(<>\\right)",
    {
      i(1),
    }
  ),
    {condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
   {
      trig="\\[]",
      dscr="[ ]",
      wordTrig = false,
      snippetType="autosnippet",
    },
  fmta(
    "\\left[<>\\right]",
    {
      i(1),
    }
  ),
    {condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
   {
      trig="\\||",
      dscr="| |",
      wordTrig = false,
      snippetType="autosnippet",
    },
  fmta(
    "\\left|<>\\right|",
    {
      i(1),
    }
  ),
    {condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
   {
      trig="\\{\\}",
      dscr="{ }",
      wordTrig = false,
      snippetType="autosnippet",
    },
  fmta(
    "\\left\\{<>\\right\\}",
    {
      i(1),
    }
  ),
    {condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
   {
      trig="\\<>",
      dscr="< >",
      wordTrig = false,
      snippetType="autosnippet",
    },
  fmta(
    "\\left<< <>\\right>>",
    {
      i(1),
    }
  ),
    {condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
   {
      trig="\\R<>",
      dscr="< >",
      wordTrig = false,
      snippetType="autosnippet",
    },
  fmta(
    "\\left\\langle <>\\right\\rangle",
    {
      i(1),
    }
  ),
    {condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="$$$$",
      dscr="begin-end",
      wordTrig = true,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      [[
      \[
      <>
      \]
      ]],
      {
      i(1),
      }
    ),
    { condition = tex_utils.in_text }
),


require("luasnip").snippet(
    {
      trig="\\:",
      dscr="colon",
      wordTrig = false,
      snippetType="autosnippet"
    },
    {
      t("\\colon")
    },
    { condition = tex_utils.in_mathzone }
),

}
