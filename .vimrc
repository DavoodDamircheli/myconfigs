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
" Plug 'ycm-core/YouCompleteMe'
Plug 'puremourning/vimspector'
Plug 'tomtom/tcomment_vim'
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'sirVer/ultisnips'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'



call plug#end()

" let g:ycm_auto_trigger = 1
" let g:ycm_min_num_of_chars_for_completion = 2
" let g:ycm_collect_identifiers_from_tags_files = 1
"
" activates filetype detection
" filetype plugin indent on
" " activates syntax highlighting among other things
syntax on
set ignorecase
set smartcase
set incsearch
" set mouse+=a
set tags=./tags,tags;/"
"hi cInclude cterm=NONE ctermfg=NONE ctermbg=NONE
"autocmd FileType c,cpp highlight! link cInclude NONE
highlight cInclude guifg=NONE ctermfg=NONE gui=NONE cterm=NONE
highlight Include guifg=NONE ctermfg=NONE gui=NONE cterm=NONE




set hlsearch    "noh clear the current highlight"
set incsearch
set ignorecase
set smartcase


" ==== coc.nvim ====
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:coc_global_extensions = ['coc-clangd', 'coc-json']

" ==== ALE ====
let g:ale_disable_lsp = 1                " don't let ALE use LSP
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 0
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'cpp': ['clang-format'],
\   'python': ['black'],
\}

" optional: turn off ALE diagnostic messages to avoid conflict
let g:ale_set_balloons = 0
let g:ale_echo_msg_error_str = ''

" ==== SYNTAX FILE OVERRIDE ====
autocmd BufNewFile,BufRead *.cu set filetype=cpp


" Trigger expansion
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Snippet directories
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "my_snippets"]

"popup window with coc.nvim."
"----------------------------------------------

" Popup menu background
highlight Pmenu guibg=#1e1e1e guifg=#d4d4d4
highlight PmenuSel guibg=#264f78 guifg=#ffffff

" Scrollbar styling
highlight PmenuSbar guibg=#333333
highlight PmenuThumb guibg=#888888

" Coc documentation window
highlight CocFloating guibg=#1e1e1e guifg=#c0c0c0

" Coc selected menu item
highlight CocMenuSel guibg=#3c3c3c guifg=#ffffff

"----------------------------------------------
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

inoremap <silent><expr> <S-TAB>
      \ coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR>
      \ coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction




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















augroup OverrideHighlightFinal
  autocmd!
  autocmd VimEnter * call timer_start(10, {-> execute('hi! Include cterm=NONE ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE gui=NONE')})
augroup END


augroup OverrideHighlightFinal
  autocmd!
  autocmd VimEnter * call timer_start(20, {-> execute('highlight clear Include')})
augroup END
augroup NoCppNoise
  autocmd!
  autocmd VimEnter * call timer_start(20, {-> execute('highlight clear Include | highlight clear PreProc | highlight clear Macro | highlight clear Define')})
augroup END


augroup ClearAllMatches
  autocmd!
  autocmd VimEnter * call clearmatches()
augroup END
