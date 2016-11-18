" Vundle
if filereadable(expand("~/Dockfiles/vim/.bundles.vimrc"))
	source ~/Dockfiles/vim/.bundles.vimrc
endif


" Key (re)Mappings
let mapleader = ','
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>       " Find merge conflict markers



" Layout

set nu


" Formatting
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current


" Color and Style
syntax enable
set background=dark
if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized             " Load a colorscheme
        set t_Co=256 
endif

" Fonts


" Behavior
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

" Plugin settings


" Functions



