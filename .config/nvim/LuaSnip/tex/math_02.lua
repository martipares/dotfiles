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
      trig="@cat",
      dscr="for categories",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\textup{\\textsf{<>}}",
      {
      i(1),
      }
    ) --     { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="@ucat",
      dscr="for enriched categories",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\underline{\\textsf{<>}}",
      {
      i(1),
      }
    ) --     { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="@vcat",
      dscr="for categories enriched in something",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "{{<>}\\text{-}\\textup{\\textsf{Cat}}",
      {
      i(1),
      }
    ) --     { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="@fun",
      dscr="for functors",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\textup{<>}",
      {
      i(1),
      }
    ) --     { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="@oper",
      dscr="for operads",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\textsc{<>}}",
      {
      i(1),
      }
    ) --     { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="@mr",
      dscr="for everything else",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\mathrm{<>}",
      {
      i(1),
      }
    ) --     { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="@mbbe",
      dscr="description",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\mathbbe{<>}",
      {
      i(1),
      }
    ) --     { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="@Cat",
      dscr="description",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\mathscr{<>}",
      {
      i(1),
      }
    ) --     { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="@Mbb",
      dscr="description",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\mathbb{<>}",
      {
      i(1),
      }
    ) --     { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="@mcal",
      dscr="description",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\mathcal{<>}",
      {
      i(1),
      }
    ) --     { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="@msf",
      dscr="description",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\mathsf{<>}",
      {
      i(1),
      }
    ) --     { condition = tex_utils.in_mathzone }
),



require("luasnip").snippet(
    {
      trig="\\cat",
      dscr="category",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\cat{<>}",
      {
      i(1),
      }
    )--     { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\fun",
      dscr="funtor",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\fun{<>}",
      {
      i(1),
      }
    )--     { condition = tex_utils.in_mathzone }
),




require("luasnip").snippet(
    {
      trig="\\fF",
      dscr="funtor F",
      wordTrig = false,
      snippetType="autosnippet"
    },
    {
      t("\\fun{F}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\fG",
      dscr="funtor G",
      wordTrig = false,
      snippetType="autosnippet"
    },
    {
      t("\\fun{G}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\Id",
      dscr="Id",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\Id{<>}",
      {
      i(1),
      }
    )--     { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\id",
      dscr="id",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\id{<>}",
      {
      i(1),
      }
    )--     { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\Mor",
      dscr="Mor",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\Mor{<>}{<>}",
      {
      i(1),
      i(2),
      }
    )--     { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\frac",
      dscr="frac",
      wordTrig = false,
      priority=1100,
      snippetType="autosnippet",
    },
    fmta(
      "\\frac{<>}{<>}",
      {
      i(1),
      i(2),
      }
    ),
    { condition = tex_utils.in_mathzone }
),





}
