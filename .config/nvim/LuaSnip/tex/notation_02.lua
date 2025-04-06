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
      trig="\\To",
      snippetType="autosnippet"
    },
    {
      t("\\Rightarrow")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\to",
      snippetType="autosnippet"
    },
    {
      t("\\rightarrow")
    },
    { condition = tex_utils.in_mathzone }
),



require("luasnip").snippet(
    {
      trig="\\we",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{W}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\cof",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{C}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\fib",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{F}")
    },
    { condition = tex_utils.in_mathzone }
),




require("luasnip").snippet(
    {
      trig="\\mono",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{M}")
    },
    { condition = tex_utils.in_mathzone }
),



require("luasnip").snippet(
    {
      trig="\\epi",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{E}")
    },
    { condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
    {
      trig="\\OOmega",
      snippetType="autosnippet"
    },
    {
      t("\\mathbbe{\\Omega}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\TTheta",
      snippetType="autosnippet"
    },
    {
      t("\\mathbbe{\\Theta}")
    },
    { condition = tex_utils.in_mathzone }
),


-- for h ----------------------------


require("luasnip").snippet(
    {
      trig="\\ho",
      snippetType="autosnippet"
    },
    {
      t("\\mathfrak{h}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\cU",
      snippetType="autosnippet"
    },
    {
      t("\\mathcal{U}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\Lan",
      snippetType="autosnippet"
    },
    {
      t("\\mathrm{Lan}")
    },
    { condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\Ran",
      snippetType="autosnippet"
    },
    {
      t("\\mathrm{Ran}")
    },
    { condition = tex_utils.in_mathzone }
),




}
