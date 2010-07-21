syn on
set expandtab
set tabstop=4
set shiftwidth=4

set listchars=eol:$,tab:->,trail:.,
colorscheme elflord

" Key mappings to quickly maximize windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_ 

au BufReadCmd *.kmz call zip#Browse(expand("<amatch>")) " open kmz as zip files
