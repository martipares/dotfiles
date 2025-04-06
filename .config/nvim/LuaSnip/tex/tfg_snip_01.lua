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
      trig="\\FArrow",
      dscr="",
      snippetType="autosnippet"
    },
  fmta(
    "<> \\rightarrow \\cdots \\rightarrow <>",
    {
      i(1),
      i(2),
    }
  ),
    {condition = tex_utils.in_mathzone }
),

require("luasnip").snippet(
   {
      trig="\\F0Arrow",
      dscr="",
      snippetType="autosnippet"
    },
  fmta(
    "0 \\rightarrow 1  \\rightarrow \\cdots \\rightarrow <>",
    {
      i(1),
    }
  ),
    {condition = tex_utils.in_mathzone }
),


require("luasnip").snippet(
    {
      trig="\\Prime",
      wordTrig = false,
      snippetType="autosnippet",
    },
    {
      t("^{\\prime}")
    },
    { condition = tex_utils.in_mathzone }
),




}
