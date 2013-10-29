syn on
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

"if v:version >= 7.3
if exists("&cm")
    set cm=blowfish "strong crypto
endif

set modelines=5

set ignorecase

set wildignore=*.o,*~,*.pyc,*.swp,*.swo

set listchars=eol:$,tab:->,trail:.,
colorscheme elflord

call pathogen#infect()
filetype plugin indent on
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Key mappings to quickly maximize windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_ 

au BufReadCmd *.kmz call zip#Browse(expand("<amatch>")) " open kmz as zip files
au BufRead,BufNewFile *.pde set filetype=arduino
au FileType arduino setl sw=2 sts=2 et

" After shifting a visual block, select it again
vnoremap < <gv
vnoremap > >gv

nnoremap <F5> :GundoToggle<CR>

let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
nnoremap <F3> :TlistToggle<CR>

