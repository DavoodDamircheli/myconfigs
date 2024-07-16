"LISTEN to debdeep post kalthoff discussion minutes of 23'
"check the directory of ~/.vim/autoload
"---------------Configuring Vim to use Vimp-Plug------------------:
"Between call plug#begin and call plug#end, 
"you list the plugins you want to install. 
"Each plugin is added with the Plug command, followed by the plugin's repository location. 
"For example, Plug 'tpope/vim-sensible' adds a plugin from its GitHub repository.
"-------------Installing Plugins with Vim-Plug-------------------:
"After adding plugins to your ~/.vimrc,
" open Vim and run the command :PlugInstall. 
" This will download and install the plugins you've listed.
"Vim-Plug will show you a progress screen as it installs the plugins
"--------------Updating and Managing Plugins-------------------:
"To update your plugins, use the :PlugUpdate command in Vim.
"If you want to remove a plugin,
" delete or comment out the line from your ~/.vimrc and run :PlugClean. 
" This will remove any unused plugins..
"---------------Myplugin---------------
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'ycm-core/YouCompleteMe'
Plug 'puremourning/vimspector'
Plug 'tomtom/tcomment_vim'
Plug 'preservim/tagbar'
call plug#end()

let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_collect_identifiers_from_tags_files = 1

" activates filetype detection
" filetype plugin indent on
" " activates syntax highlighting among other things
 syntax on
 set ignorecase
 set smartcase
 set incsearch
" set mouse+=a
set tags=./tags,tags;/" 


set hlsearch    "noh clear the current highlight"
set incsearch
set ignorecase
set smartcase


"-----------------------------------------
" Vimtex
" --------------------------------------

""syntax folding enabled
let g:vimtex_fold_enabled = 0

"" Turn off automatic folding to speed up insert mode
let g:vimtex_fold_manual=0
"" Cleaner folding
set fillchars=fold:\
" Note: The |fold-expr| method of folding is well known to be slow, e.g. for
" " long lines and large files. To speed things up, the user may want to
" " enable the |g:vimtex_fold_manual| option. An alternative is to add
" " a dedicated plugin that improves folding speed for the slow fold
" " methods, e.g. https://github.com/Konfekt/FastFold.
"
" " To turn it off in emergency
" "let g:vimtex_enabled = 1
"
" " indentation for tex
" let g:vimtex_indent_enabled = 0
"
"
" let g:vimtex_view_method = 'zathura'
"
" " stop the selecting text in the first run
" let g:vimtex_view_forward_search_on_start = 0
" "let g:vimtex_quickfix_method = 'pplatex'
" "
"
" "" [deprecated]
" "" Turning off some warning messages
" "   let g:vimtex_quickfix_latexlog = {
" "          \ 'default' : 1,
" "          \ 'ignore_filters' : ['Package nag Warning:', 'Package glossaries
" Warning:', 'Fira font
" s' , 'snakes', 'Unused', 'contains only floats.', 'Token not allowed'],
" "          \ 'general' : 1,
" "          \ 'references' : 1,
" "          \ 'overfull' : 0,
" "          \ 'underfull' : 0,
" "          \ 'font' : 0,
" "          \ 'packages' : {
" "          \   'default' : 1,
" "          \   'general' : 1,
" "          \   'babel' : 1,
" "          \   'biblatex' : 1,
" "          \   'fixltx2e' : 1,
" "          \   'hyperref' : 1,
" "          \   'natbib' : 1,
" "          \   'scrreprt' : 1,
" "          \   'titlesec' : 1,
" "          \ },
" "          \}
"
"                                                                                 628,0-1
"                                                                                 60%
"Dissable custom warnings based on regexp
let g:vimtex_quickfix_ignore_filters = [
	          \ 'Package nag Warning:', 'Package glossaries Warning:', 'Fira fonts' , 'snakes', 'Unused', 'contains only floats.', 'Token not allowed'
          \]


" Stops from launching two instances of zathura in the beginning. Also the
" " lag in compilation
" let g:vimtex_view_automatic=0
"
" " an alternate is to do the following
" " but stops all the error and warning window, so it is useless
" "let g:vimtex_compiler_latexmk = {
" "      \  'callback' : 0,
" "      \}
"
"
" " Turning off ALL warning messages
" "let g:vimtex_quickfix_latexlog = {'default' : 0}
"
"
" " disable opening quickfix window on warnings only
" "let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_compiler_latexmk = {
    \'backend':'latexmk',
    \'background':1,
    \ 'build_dir' : '',
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \ 'bibtex' : {
    \    'backend' : 'biber',
    \},
    \}
" 
command! Cpt VimtexCompile
command! View VimtexView
command! Togtoc VimtexTocToggle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------  status Line---------------------------
" Clear the existing statusline
set statusline=
set laststatus=2
" Set the statusline format
set statusline+=%F\ " Display the full path of the current file
set statusline+=%m  " Display the modified flag [+]
set statusline+=%r  " Display the read-only flag [RO]
set statusline+=%y  " Display the filetype
set statusline+=%=  " Switch to the right side
set statusline+=%l/%L\ " Display the current line number/total lines
set statusline+=%c  " Display the current column
set statusline+=%P  " Display the percentage through the file

"--------------------  tagbar---------------------------

" Opening and closing the Tagbar window~
"
" Use |:TagbarOpen| or |:TagbarToggle| to open the Tagbar window if it is
" closed. 
" By default the window is opened on the right side, set the option
" |g:tagbar_position| to open it elsewhere instead. 
"
" If the window is already open,
" |:TagbarOpen| will jump to it and |:TagbarToggle| will close it again.
"
" |:TagbarClose| will simply close the window if it is open.

   " nnoremap <silent> <F2> :TagbarOpen<CR>

command! Tgp TagbarOpen
""""""""""""""""""""
" Killing the arrow keys to force the habit of using hjkl
noremap <up>    :echoerr 'USE K TO GO UP'<CR>
noremap <down>  :echoerr 'USE J TO GO DOWN'<CR>
noremap <left>  :echoerr 'USE H TO GO LEFT'<CR>
noremap <right> :echoerr 'USE L TO GO RIGHT'<CR>
" For insert mode also
inoremap <up>    <ESC>:echom 'USE K TO GO UP'<CR>
inoremap <down>  <ESC>:echom 'USE J TO GO DOWN'<CR>
inoremap <right> <ESC>:echom 'USE L TO GO RIGHT'<CR>
inoremap <left>  <ESC>:echom 'USE H TO GO LEFT'<CR>
