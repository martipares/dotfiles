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
      trig="\\AA",
      snippetType="autosnippet"
    },
    {
      t("\\mathbb{A}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\CC",
      snippetType="autosnippet"
    },
    {
      t("\\mathbb{C}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\EE",
      snippetType="autosnippet"
    },
    {
      t("\\mathbb{E}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\FF",
      snippetType="autosnippet"
    },
    {
      t("\\mathbb{F}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\GG",
      snippetType="autosnippet"
    },
    {
      t("\\mathbb{G}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\HH",
      snippetType="autosnippet"
    },
    {
      t("\\mathbb{H}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\KK",
      snippetType="autosnippet"
    },
    {
      t("\\mathbb{K}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\MM",
      snippetType="autosnippet"
    },
    {
      t("\\mathbb{M}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\NN",
      snippetType="autosnippet"
    },
    {
      t("\\mathbb{N}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\QQ",
      snippetType="autosnippet"
    },
    {
      t("\\mathbb{Q}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\RR",
      snippetType="autosnippet"
    },
    {
      t("\\mathbb{R}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
--       trig="\\eS",
      trig="eS",
      priority=1100,
      dscr="mathbb{S}"
--       snippetType="snippet"
    },
    {
      t("\\mathbb{S}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\VV",
      snippetType="autosnippet"
    },
    {
      t("\\mathbb{V}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\ZZ",
      snippetType="autosnippet"
    },
    {
      t("\\mathbb{Z}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\1",
      snippetType="autosnippet"
    },
    {
      t("\\mathbbe{1}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\2",
      snippetType="autosnippet"
    },
    {
      t("\\mathbbe{2}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\3",
      snippetType="autosnippet"
    },
    {
      t("\\mathbbe{3}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\iso",
      snippetType="autosnippet"
    },
    {
      t("\\mathbb{I}")
    },
    { condition = tex_utils.in_mathzone }
),

-- categories ------------------------------------

require("luasnip").snippet(
    {
      trig="\\cA",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{A}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cB",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{B}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cC",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{C}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cD",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{D}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cE",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{E}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cF",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{F}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cG",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{G}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cI",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{I}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cJ",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{J}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cK",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{K}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cM",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{M}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cN",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{N}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cO",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{O}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cP",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{P}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cS",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{S}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cT",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{T}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\cV",
      snippetType="autosnippet"
    },
    {
      t("\\mathsf{V}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\sS",
      priority=1100, --      snippetType="autosnippet"
    },
    {
      t("\\mathcal{S}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\sW",
      snippetType="autosnippet"
    },
    {
      t("\\mathscr{W}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\cW",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{W}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\cX",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{X}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\cY",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{Y}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\sA",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{A}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\sB",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{B}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\sC",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{C}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\sD",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{D}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\sJ",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{J}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\sL",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{L}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\sR",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{R}")
    },
    { condition = tex_utils.in_mathzone }
),



-- enriched categories ----------------------------------------

require("luasnip").snippet(
    {
      trig="\\uC",
      snippetType="autosnippet"
    },
    {
      t("\\underline{\\mathsf{C}}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\uD",
      snippetType="autosnippet"
    },
    {
      t("\\underline{\\mathcal{D}}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\uhoC",
      snippetType="autosnippet"
    },
    {
      t("\\underline{\\mathfrak{h}\\mathsf{C}}")
    },
    { condition = tex_utils.in_mathzone }
),

-- simplicial categories ----------------------------------

require("luasnip").snippet(
    {
      trig="\\eK",
      snippetType="autosnippet"
    },
    {
      t("\\mathscr{K}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\eL",
      snippetType="autosnippet"
    },
    {
      t("\\mathscr{L}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\eM",
      snippetType="autosnippet"
    },
    {
      t("\\mathscr{M}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
--       trig="\\eS",
      trig="eS",
      priority=1050,
      dscr="simplicial categories"
--       snippetType="snippet"
    },
    {
      t("\\mathscr{S}")
    },
    { condition = tex_utils.in_mathzone }
),



-- bold --------------------------------------


require("luasnip").snippet(
    {
      trig="\\bL",
      snippetType="autosnippet"
    },
    {
      t("\\mathbf{L}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\bR",
      snippetType="autosnippet"
    },
    {
      t("\\mathbf{R}")
    },
    { condition = tex_utils.in_mathzone }
),



-- mathfrak ---------------------------------


require("luasnip").snippet(
    {
      trig="\\gC",
      snippetType="autosnippet"
    },
    {
      t("\\mathfrak{C}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\gN",
      snippetType="autosnippet"
    },
    {
      t("\\mathfrak{N}")
    },
    { condition = tex_utils.in_mathzone }
),



}
