" Vundle
if filereadable(expand("~/Dotfiles/vim/.bundles.vimrc"))
	source ~/Dotfiles/vim/.bundles.vimrc
endif


" Key (re)Mappings
let mapleader = ','
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>       " Find merge conflict markers (spf13)
" edit vimrc
map <leader>vimrc :tabedit ~/Dotfiles/vim/.vimrc<CR>
map <leader>source :source $MYVIMRC<CR>

" Vim Behavior 
"   Auto source
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif
set autoread
set history=1000



" Layout
set nu relativenumber
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set scrolloff=7
set showmatch
set lazyredraw

" Formatting
"   wrap
set wrap linebreak nolist
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)


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


" Editor Behavior
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)



" Functions




" Plugin settings

"   CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ 
  \ }

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


"   Ranger
"   Compatible with ranger 1.4.2 through 1.7.*
"
"   Add ranger as a file chooser in vim
"
"   If you add this code to the .vimrc, ranger can be started using the command
"   ":RangerChooser" or the keybinding "<leader>r".  Once you select one or more
"   files, press enter and ranger will quit again and vim will open the selected
"   files.
function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>rang :<C-U>RangerChooser<CR>
