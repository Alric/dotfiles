
""
"" Janus setup
""

" Define paths
let g:janus_path = escape(fnamemodify(resolve(expand("<sfile>:p")), ":h"), ' ')
let g:janus_vim_path = escape(fnamemodify(resolve(expand("<sfile>:p" . "vim")), ":h"), ' ')
let g:janus_custom_path = expand("~/.janus")

" Source janus's core
exe 'source ' . g:janus_vim_path . '/core/before/plugin/janus.vim'

" You should note that groups will be processed by Pathogen in reverse
" order they were added.
call janus#add_group("tools")
call janus#add_group("langs")
call janus#add_group("colors")

""
"" Customisations
""

au BufNewFile,BufRead *.ejs set filetype=html

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

filetype plugin on
runtime macros/matchit.vim

" Disable plugins prior to loading pathogen
exe 'source ' . g:janus_vim_path . '/core/plugins.vim'

""
"" Pathogen setup
""

" Load all groups, custom dir, and janus core
call janus#load_pathogen()
execute pathogen#infect('/Users/alric/.vim/janus/vim/tools/{}')
execute pathogen#infect()

" .vimrc.after is loaded after the plugins have loaded
"
colorscheme Jellybeans
:highlight CursorColumn guibg=#000000
:highlight CursorLine guibg=#000000

au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
inoremap jj <Esc>
inoremap jJ <Esc>
inoremap jk <Esc>
inoremap <C-k> <Esc>gt
inoremap <C-j> <Esc>gT
nnoremap <C-k> gt
nnoremap <C-j> gT
set tw=0

"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](coverage|solr/data)$'
  \}

