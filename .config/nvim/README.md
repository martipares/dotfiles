# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Modified template for LazyVim by martipares.
With a selection of extras to enable by default, 
some plugins with additional configuration, snippets and spell.

This template has been modified to source LazyVim from my fork
for testing purpose.

Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# Dependencies 
<!--TODO add dependencies -->


# Enabled Extras
=> extra included by default
coding.blink
coding.snacks_explorer
editor.snacks_picker
=> enabled languages
lang.tex
=> import any extras modules here
coding.luasnip
coding.yanky
editor.dial
editor.fzf
editor.inc-rename
test.core
util.dot
util.mini-hipatterns
util.project
=> import animation extras
ui.mini-animate
ui.smear-cursor

In lazyvim.json

"extras": [
    "lazyvim.plugins.extras.coding.luasnip",
    "lazyvim.plugins.extras.coding.yanky",
    "lazyvim.plugins.extras.editor.dial",
    "lazyvim.plugins.extras.editor.fzf",
    "lazyvim.plugins.extras.editor.inc-rename",
    "lazyvim.plugins.extras.lang.tex",
    "lazyvim.plugins.extras.test.core",
    "lazyvim.plugins.extras.util.dot",
    "lazyvim.plugins.extras.util.mini-hipatterns",
    "lazyvim.plugins.extras.util.project"
  ],
