set nocompatible               " be iMproved

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-endwise'
Bundle 'vim-scripts/taglist.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic.git'
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neosnippet.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'mileszs/ack.vim'
Bundle 'sjurgemeyer/vim-grails-import'
Bundle 'tpope/vim-abolish.git'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'vim-scripts/Align.git'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'JavaScript-Indent'
Bundle 'gregsexton/gitv.git'
Bundle 'vim-scripts/ZoomWin'
Bundle 'groenewege/vim-less'
Bundle 'aaronzirbes/grails-vim.git'
Bundle 'techlivezheng/vim-plugin-minibufexpl'
Bundle 'elzr/vim-json'
Bundle 'vim-ruby/vim-ruby'

let g:miniBufExplAutoStart = 1
let g:miniBufExplBuffersNeeded = 1
" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

let g:airline_powerline_fonts=1
let g:airline_theme='dark'
let g:airline_section_x='' "filetype by default
let g:airline_section_y='' "encoding by default

"Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_mode_map = { 'mode': 'passive',
                               \ 'active_filetypes': ['javascript', 'html', 'css'],
                               \ 'passive_filetypes': ['groovy'] }
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-", "invalid value \"{{"]
let g:syntastic_groovy_checkers = ['codenarc']
let g:syntastic_always_populate_loc_list=1

"NeoComplCache
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    " return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" For cursor moving in insert mode(Not recommended)
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"    let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
""autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"Non default
"let g:neocomplcache_enable_insert_char_pre = 1

"NERDTree
let NERDTreeShowLineNumbers=1
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"CtrlP
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'rtscript']
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*\|.*/target/.*\|.*/build/.*|*.orig'
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v(build|target)$',
    \ 'file': '\v\.(orig|)$',
    \ }
let g:ctrlp_max_files = 40000
let g:ctrlp_max_depth = 40
let g:ctrlp_lazy_update = 1

"Tagbar
let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'groovy',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'c:class',
        \ 'i:interface',
        \ 'f:function',
        \ 'v:variables',
    \ ]
\ }

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
