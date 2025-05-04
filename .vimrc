"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set encoding=utf8
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=100
set wildmenu
set wildmode=list:longest
nnoremap <SPACE> <Nop>
map <Space> <Leader>

call plug#begin('~/.vim/plugged')

  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    let g:UltiSnipsSnippetsDir="~/.vim/plugged/ultisnips/"
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

  Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
      inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
      nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>


  Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

  Plug 'tpope/vim-dispatch'

  Plug 'dense-analysis/ale'

  Plug 'preservim/nerdtree'

  Plug 'dylanaraps/wal'

  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
    let g:lightline = {'colorscheme': 'catppuccin_mocha'}

call plug#end()

  setlocal spell
  set spelllang=en_gb
  inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

    "colorscheme wal
    "set background=dark
    "execut wal --theme base16-nord



" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>


set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2
