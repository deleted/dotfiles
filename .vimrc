syn on
set expandtab
set tabstop=4
set shiftwidth=4

set ignorecase

set listchars=eol:$,tab:->,trail:.,
colorscheme elflord

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Key mappings to quickly maximize windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_ 

au BufReadCmd *.kmz call zip#Browse(expand("<amatch>")) " open kmz as zip files

" After shifting a visual block, select it again
vnoremap < <gv
vnoremap > >gv

nnoremap <F5> :GundoToggle<CR>

let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
nnoremap <F3> :TlistToggle<CR>
