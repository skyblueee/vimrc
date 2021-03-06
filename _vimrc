set nocompatible

"==|vim-plug|====================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('win32') || has('win64')
    call plug#begin('~/vimfiles/bundle')
else
    call plug#begin('~/.vim/bundle')
endif
"---------------------------------------
Plug 'junegunn/vim-plug'
"---------------------------------------fast move/select
Plug 'Shougo/denite.nvim', {'for': ''}
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'  " <leader>fl/ for file/line/ag
Plug 'Yggdroot/LeaderF', {'on': ['LeaderfBufTagAll', 'LeaderfFunctionAll'], 'do': './install.sh'}
let g:Lf_ReverseOrder = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','.hg'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
        \}

Plug 'easymotion/vim-easymotion' " <leader><leader>swafFjk
" single character move
nmap <leader><leader>s <Plug>(easymotion-s)
" word move
nmap <leader><leader>w <Plug>(easymotion-bd-w)
" over window move
nmap <leader><leader>a <Plug>(easymotion-overwin-w)

Plug 'justinmk/vim-sneak'  " sxx fx
let g:sneak#prompt = 'sneak..>'
let g:sneak#target_labels = ";abcdefghigklmnopqrstuvwxyz/"
let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F

Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi'  " <c-n>vii<c-f> for current indent, <c-n>maf for current function
Plug 'terryma/vim-expand-region', {'for': ['python', 'c', 'cpp', 'sh', 'matlab', 'vim']} " v vv vvv
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'  "ds/cs
Plug 'junegunn/vim-peekaboo'  " visual @ and registers and <c-r> for insert mode pasting.
Plug 'kshenoy/vim-signature' " m<a-zA-Z> m/ m<space> | m<0-9> m? m<bs>
Plug 't9md/vim-choosewin'  " press - to choose window
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

"---------------------------------------REPL
Plug 'sillybun/vim-repl', {'on':['REPLToggle']}
Plug 'sillybun/vim-async', {'on': ['REPLToggle']}  " required by vim-repl
"---------------------------------------补全
Plug 'jiangmiao/auto-pairs', {'for': ['python', 'c', 'cpp', 'sh', 'matlab', 'vim']}
Plug 'honza/vim-snippets', {'for': ['python', 'c', 'cpp', 'sh']}
Plug 'SirVer/ultisnips', {'for': ['python', 'c', 'cpp', 'sh']}  " must before CompleteParameter.vim
let g:UltiSnipsExpandTrigger = '<c-o>' " Open it! default '<TAB>'
"let g:UltiSnipsListSnippets = '<c-TAB>' " default '<c-TAB>'
"let g:UltiSnipsJumpForwardTrigger = '<c-j>' " default '<c-j>'
"let g:UltiSnipsJumpBackwardTrigger = '<c-k>' " default '<c-k>'

"==|auto-pairs|================================================================
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
let g:AutoPairsShortcutJump = ''
let g:AutoPairsMapCh = 0

Plug 'Valloric/YouCompleteMe', {'for': ['python', 'c', 'cpp'], 'do': 'python3 ./install.py --clangd-completer'}
Plug 'neoclide/coc.nvim', {'for':['nofile'], 'brach': 'release'}
let g:coc_start_at_startup = 0
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
autocmd FileType tex let b:coc_pairs = [["$", "$"]]
"inoremap <expr> <tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

Plug 'tenfyzhong/CompleteParameter.vim'  ", {'for': ['c', 'cpp', 'python']}
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
"---------------------------------------文本对象
Plug 'wellle/targets.vim'  " i) a, i', i*, a_, a$
Plug 'kana/vim-textobj-user', {'for': ['c', 'cpp', 'vim', 'java']} " Create your own objects, required by followings.
Plug 'kana/vim-textobj-function', {'for': ['c', 'cpp', 'vim', 'java']}  " aF if
Plug 'kana/vim-textobj-indent', {'for': ['python']}  " ai ii
Plug 'jeetsukumaran/vim-pythonsense', {'for': ['python']}  " af, if, ac, ic, ad, id, [[, ]], ]m, [m
"---------------------------------------语法
Plug 'vim-scripts/DrawIt'
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'scrooloose/nerdcommenter', {'for': ['python', 'c', 'cpp', 'sh', 'matlab', 'vim', 'make', 'cmake']}
let g:NERDDefaultAlign = 'left'
map <m-/> mc:call NERDComment('n', 'toggle')<cr>'cj

Plug 'ludovicchabant/vim-gutentags', {'for': ['python', 'c', 'cpp']}
Plug 'skywind3000/asyncrun.vim', {'on': 'AsyncRun'}
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '.gitignore', 'build.xml']
let g:asyncrun_bell = 1
let g:asyncrun_trim = 1
let g:asyncrun_open = 9

Plug 'fs111/pydoc.vim', {'for': 'python'}  " just press K(or <leader>pw) in python files
let g:pydoc_window_lines = 0.7
let g:pydoc_cmd = 'python3 -m pydoc'

Plug 'w0rp/ale', {'for': ['python', 'sh']}
Plug 'sbdchd/neoformat', {'on': ['Neoformat']}
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive', {'on': ['Gdiff', 'Gvdiff', 'Gstatus']}
"---------------------------------------
Plug 'jceb/vim-orgmode', {'for': 'org'}
Plug 'iamcco/mathjax-support-for-mkdp', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'}  " MarkdownPreview
Plug 'vim-scripts/DoxygenToolkit.vim', {'on': 'Dox'}
Plug 'vim-latex/vim-latex', {'for': 'tex'}
Plug 'lervag/vimtex', {'for': 'tex'}
let g:tex_flavor = 'latex'

Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}
let g:livepreview_engine = 'xelatex'
let g:livepreview_cursorhold_recompile = 0

Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
set conceallevel=2
let g:tex_conceal='abdmgs'

"---------------------------------------UI
Plug 'mhinz/vim-startify'
let g:startify_change_to_vcs_root = 1

Plug 'mh21/errormarker.vim', {'for': ['c', 'cpp', 'python']}
let errormarker_disablemappings = 1

Plug 'luochen1990/rainbow', {'for': ['python', 'c', 'cpp', 'sh', 'matlab', 'vim']}
Plug 'Yggdroot/indentLine', {'for': ['python', 'c', 'cpp', 'sh', 'matlab', 'vim']}
let g:indentLine_char_list = ['│', '|', '¦', '┆', '┊']
let g:indentLine_char='¦'
let g:indentLine_enabled = 1

Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
Plug 'Shougo/echodoc.vim', {'for': ['c', 'cpp', 'python']}
set noshowmode
let g:echodoc#enable_at_startup = 1

Plug 'yianwillis/vimcdoc', {'for': ['help']}  " second help for chinese help
Plug 'vim-airline/vim-airline' " show infos
Plug 'mg979/vim-xtabline'
let g:xtabline_settings = {}
let g:xtabline_settings.tabline_modes = ['buffers', 'tabs', 'arglist']
let g:xtabline_settings.buffer_filtering = 0
"let g:xtabline_settings.override_airline = 0
nmap <tab> :XTabNextBuffer<cr>
nmap <s-tab> :XTabPrevBuffer<cr>
nmap <BS> <Plug>(XT-Select-Buffer)

Plug 'skyblueee/nerdtree', {'on': 'NERDTreeToggle'}
let NERDTreeShowBookmarks = 1
let NERDTreeCascadeSingleChildDir = 1
let NERDTreeNaturalSort = 1

Plug 'skywind3000/quickmenu.vim'  "<F12>
Plug 'lilydjwg/colorizer', {'for': ['html', 'css', 'vim']}  " rgb(100, 2, 3), #0f0, #00f, #f00
Plug 'liuchengxu/space-vim-dark'
"---------------------------------------
call plug#end()  " will execute 'filetype plugin indent on' and 'syntax enable'

"==|enable alt/meta map|=======================================================
"https://github.com/skywind3000/vim-init/wiki/Setup-terminals-to-support-ALT-and-Backspace-correctly
function! Terminal_MetaMode(mode)
    set ttimeout
    if $TMUX != ''
        set ttimeoutlen=30
    elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
        set ttimeoutlen=80
    endif
    if has('nvim') || has('gui_running')
        return
    endif
    function! s:metacode(mode, key)
        if a:mode == 0
            exec "set <M-".a:key.">=\e".a:key
        else
            exec "set <M-".a:key.">=\e]{0}".a:key."~"
        endif
    endfunc
    for i in range(10)
        call s:metacode(a:mode, nr2char(char2nr('0') + i))
    endfor
    for i in range(26)
        call s:metacode(a:mode, nr2char(char2nr('a') + i))
        call s:metacode(a:mode, nr2char(char2nr('A') + i))
    endfor
    if a:mode != 0
        for c in [',', '.', '/', ';', '[', ']', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    else
        for c in [',', '.', '/', ';', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    endif
endfunc

call Terminal_MetaMode(0)

"==|quick input toggle|========================================================
let g:input_toggle = 1

function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction

function! Fcitx2zh()
    let s:input_status = system("fcitx-remote")
    if s:input_status != 2 && g:input_toggle == 1
        let l:a = system("fcitx-remote -o")
        let g:input_toggle = 0
    endif
endfunction

set timeoutlen=300

autocmd InsertLeave * call Fcitx2en()
"autocmd InsertEnter * call Fcitx2zh()

"==|Self|======================================================================
let mapleader = "\<SPACE>"

" Windows navigating
nnoremap <leader><tab> <c-w>w

set switchbuf=useopen

" Quick move
noremap! <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
noremap! <c-l> <right>
noremap! <c-a> <home>
noremap! <c-e> <end>

nnoremap <up> gk
nnoremap <down> gj
inoremap <up> <c-\><c-o>gk
inoremap <down> <c-\><c-o>gj

" quick move line/block
nnoremap <m-down> :m .+1<CR>==
nnoremap <m-up> :m .-2<CR>==
inoremap <m-down> <Esc>:m .+1<CR>==gi
inoremap <m-up> <Esc>:m .-2<CR>==gi
vnoremap <m-down> :m '>+1<CR>gv=gv
vnoremap <m-up> :m '<-2<CR>gv=gv

" h/cc,cpp
function! ToggleHS()
    let file_name = expand("%:p:r")
    let type_name = expand("%:e")
    if type_name == 'h'
        if filereadable(file_name . '.cc')
            exe 'e ' . file_name . '.cc'
            return
        endif
        exe 'e ' . file_name . '.cpp'
    elseif type_name == 'cpp' || type_name == 'cc'
        exe 'e ' . file_name . '.h'
    endif
endfunction
nnoremap <m-o> :call ToggleHS()<cr>

" Appearance
set cursorline
set colorcolumn=120

nnoremap <c-\> :noh<cr>

" some other
nnoremap <leader>p "+p
vnoremap <leader>y "+y

" persistent undo
set undodir=$HOME/.vim_undodir
set undofile
autocmd VimLeave * call system('rm ~/.vim_undodir/*')

"==|ALL|=======================================================================
set mouse=a  " enable mouse
set winaltkeys=no  " let windows pass alt to vim
set linebreak  " can not break word when line break
set ruler  " show row and column in the bottom
set showcmd  " show cmd when typing
set number  " show row number at left
set laststatus=2  " always show the status line
set wildmenu  " complete in cmd
set showmatch  " show the matching part of the pair for [] {} and ()
set scrolloff=3
set formatoptions+=jmB
set ffs=unix,dos,mac
"---------------------------------------
set incsearch
set hlsearch
set ignorecase smartcase
"---------------------------------------
set foldenable
set fdm=indent
set foldlevel=1
"---------------------------------------
set backspace=indent,eol,start
"---------------------------------------
set whichwrap=b,s,<,>,[,],~
"---------------------------------------
" set file encoding check and support
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,big5,euc-jp,latin1
"---------------------------------------
set completeopt=menuone,longest,preview
set diffopt=filler,vertical
"---------------------------------------
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
"---------------------------------------
" stuff to ignore when tab completing in cmd/ex mode
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class
set wildignore=*.o,*.obj,*~,*.out,*.exe,*.a,*.pdb,*.lib
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.wav,*.ogg,*.pcm,*.mp3,*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.ppt,*.pptx,*.doc,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
"---------------------------------------
" to have Vim jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
            \ | exe "normal! g'\""
            \ | endif
"---------------------------------------
" to highlight the tailing spaces.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWritePre * %s/\s\+$//e

"==|Windows|===================================================================
if has('win32') || has('win64')
    set makeprog=nmake.exe
endif

"==|GUI|=======================================================================
set guioptions-=T
if has('gui_running')
    "colorscheme desert
    colorscheme elflord
endif
"---------------------------------------
if has('win32') || has('win64')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif
"---------------------------------------
if exists('$TMUX')
  set term=screen-256color
endif
"---------------------------------------
" apt-get install wmctrl
function! MaximizeWindow()
    silent !sleep 0.1
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

"==|fzf|=======================================================================
" mix exact search terms and fuzzy terms by prefixing each term with ' character
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Ag
            \ call fzf#vim#ag(<q-args>,
            \                 <bang>0 ? fzf#vim#with_preview('up:60%')
            \                         : fzf#vim#with_preview('right:50%:hidden','?'),
            \                 <bang>0)

function! SmartFiles()
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  let root = v:shell_error ? '' : root
  if empty(root)
      call fzf#vim#files('', fzf#vim#with_preview(), 1)
  else
      call fzf#vim#gitfiles('', fzf#vim#with_preview(), 1)
  endif
endfunction

function! SmartAg()
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  let root = v:shell_error ? '' : root
  if empty(root)
      exe 'Ag'
  else
      let l:pwd = getcwd()
      exe 'cd ' . root
      exe 'Ag'
      exe 'cd ' . l:pwd
  endif
endfunction

nnoremap <leader>f :call SmartFiles()<cr>
nnoremap <leader>/ :call SmartAg()<cr>
nnoremap <leader>l :BLines<cr>

"==|vim-airline|===============================================================
"nmap <tab> <Plug>AirlineSelectNextTab
"nmap <s-tab> <Plug>AirlineSelectPrevTab
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline_section_c       (bufferline or filename)
let g:airline_section_c = '%<%F%m%r%h%w'
" let g:airline_section_z       (percentage, line number, column number)
let g:airline_section_z = '(%b/0x%B)[%l/%L,%c][%p%%] %(%{strftime("%H:%M")}%)'
let g:airline_symbols_ascii = 1

"==|rainbow|===================================================================
" delete black from default
"let g:rbpt_colorpairs = [
"            \ ['brown',       'RoyalBlue3'],
"            \ ['Darkblue',    'SeaGreen3'],
"            \ ['darkgray',    'DarkOrchid3'],
"            \ ['darkgreen',   'firebrick3'],
"            \ ['darkcyan',    'RoyalBlue3'],
"            \ ['darkred',     'SeaGreen3'],
"            \ ['darkmagenta', 'DarkOrchid3'],
"            \ ['brown',       'firebrick3'],
"            \ ['gray',        'RoyalBlue3'],
"            \ ['darkmagenta', 'DarkOrchid3'],
"            \ ['Darkblue',    'firebrick3'],
"            \ ['darkgreen',   'RoyalBlue3'],
"            \ ['darkcyan',    'SeaGreen3'],
"            \ ['darkred',     'DarkOrchid3'],
"            \ ['red',         'firebrick3'],
"            \ ]
"let g:rbpt_max = 16
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['brown', 'red', 'lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
    \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
let g:rainbow_active = 1

"==|vim-visual-multi|==========================================================
let g:VM_manual_infoline = 0
let g:VM_default_mappings = 0
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-n>'
let g:VM_maps['Find Subword Under'] = '<C-n>'
let g:VM_maps["Select All"] = '<c-s-l>'
let g:VM_maps["Start Regex Search"] = 'g/'
let g:VM_maps["Add Cursor Down"] = '<s-m-down>'
let g:VM_maps["Add Cursor Up"] = '<s-m-up>'
let g:VM_maps["Add Cursor At Pos"] = 'g<space>'

let g:VM_maps["Visual Regex"] = 'g/'
let g:VM_maps["Visual All"] = '<c-s-l>'
let g:VM_maps["Visual Add"] = '<C-a>'
let g:VM_maps["Visual Find"] = '<C-f>'
let g:VM_maps["Visual Cursors"] = '<C-c>'

"==|vim-repl|==================================================================
let g:repl_auto_sends = ['class ', 'def ', 'for ', 'if ', 'while ']
let g:repl_program = { "python": "ipython3", "default": "bash" }
let g:repl_exit_commands = { "python": "quit()", "default": "exit" }
let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }

"==|vim-expand-region|=========================================================
vmap v <Plug>(expand_region_expand)
vmap <c-v> <Plug>(expand_region_shrink)

"==|YouCompleteMe|=============================================================
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_complete_in_comments = 1 " default 0
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " default 0
"let g:ycm_collect_identifiers_from_tags_files = 0 " default 0
"let g:ycm_seed_identifiers_with_syntax = 0 " default 0
"let g:ycm_extra_conf_vim_data = [] " default []
let g:ycm_server_python_interpreter = '/usr/bin/python3'
"let g:ycm_keep_logfiles = 0 " default 0
"let g:ycm_log_level = 'debug' " debug/info(default)/warning/error/critical
let g:ycm_autoclose_preview_window_after_completion = 1 " default 0
"let g:ycm_autoclose_preview_window_after_insertion = 1 " default 0
"let g:ycm_key_list_stop_completion = ['<c-y>'] " default ['<c-y>']
"let g:ycm_key_invoke_completion = '<c-z>' " default <c-Space>
let g:ycm_global_ycm_extra_conf = '~/rcfiles/_ycm_extra_conf.py' " default ''
"let g:ycm_confirm_extra_conf = 1 " default 1
"let g:ycm_extra_conf_globlist = [] " default []
"let g:ycm_filepath_completion_use_working_dir = 0 " default 0
"let g:ycm_cache_omnifunc = 1 " default 0
"let g:ycm_use_ultisnips_completer = 1 " default 1
"let g:ycm_goto_buffer_command = 'same-buffer' " default 'same-buffer'
"let g:ycm_disable_for_files_larger_than_kb = 1000 " default 1000
let g:ycm_clangd_uses_ycmd_caching = 1 " 使用ycm会更加精准，但是如果没有触发语法补全，不能补全函数参数。
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{3}'],
            \ 'cs,lua,javascript': ['re!\w{3}'],
            \ } " 小trick，2个字符的时候已经触发了ycm精准补全，3个字符触发语法补全，不再精准但功能更强大。
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_clangd_args = ['-background-index'] " clangd-9 will automatically enable indexing, not 8
au BufEnter *.h,*.c,*.cpp,*.py nmap <c-]> :YcmCompleter GoTo<cr>
au BufLeave *.h,*.c,*.cpp,*.py silent! unmap <c-]>
" use YCM rather than ale
"let g:ycm_show_diagnostics_ui = 1 " default 1;
"let g:ycm_echo_current_diagnostic = 1 " default 1;
let g:ycm_key_detailed_diagnostics = ''
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_error_symbol = '✗✗' " '×•✹●' default '>>'
let g:ycm_warning_symbol = '✭✭' " '▶' default '>>'
let g:ycm_enable_diagnostic_signs = 1
" 1. 若使用了Python virtual environment或者非标准位置的第三方库，YCM可能不能正常功能，需在
"    .ycm_extra_conf.py中额外配置。详情参见YCM说明文档"Working with virtual environment"
" 2. YCM可以使用任意LSP服务器，详见help g:ycm_language_server

"==|Gutentags|=================================================================
" 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"==|quickmenu|==================================================================
let g:quickmenu_options = "HL"
let g:quickmenu_padding_left = 1
let g:quickmenu_padding_right = 1
"========================================
noremap <silent><F12> :call quickmenu#toggle(0)<cr>
call g:quickmenu#reset()
call g:quickmenu#header('Code')
"----------------------------------------
call g:quickmenu#append("# CMake", '', '', 'c,cpp,python,cmake')
call g:quickmenu#append("cmake ..", 'AsyncRun -cwd=<root>/build cmake ..', "*cmake ..* on project", 'c,cpp,cmake')
call g:quickmenu#append("make", 'AsyncRun -auto=make -cwd=<root>/build make', "*make* on project", 'c,cpp,cmake')
call g:quickmenu#append("run %{expand('%:t:r')}", 'AsyncRun -auto=make -cwd=<root>/build utest/%:t:r',
            \ "%{expand('%:t:r')} on project", 'c,cpp,cmake')
"----------------------------------------
call g:quickmenu#append("# FMT", '', '', 'c,cpp,python,markdown')
call g:quickmenu#append("NeoFormat", "Neoformat", "Neoformat")
call g:quickmenu#append("Dox Class/Func", "Dox", ":Dox")
call g:quickmenu#append("Dox File", "DoxAuthor", ":DoxAuthor")
call g:quickmenu#append("MD pic", "exe 'normal! o![text]()\<left>./'", "insert picture in markdown", 'markdown')
call g:quickmenu#append("MD link", "exe 'normal! o[text]()\<left>http://'", "insert link in markdown", 'markdown')
"----------------------------------------
call g:quickmenu#append("# AsyncRun", '', '', 'python,matlab,sh,gnuplot')
call g:quickmenu#append("Run Matlab", "AsyncRun -raw octave %:p", "运行当前脚本后退出octave", 'matlab')
call g:quickmenu#append("Term Matlab", "term octave --persist %:p", "运行当前脚本. <c-w>N: term-normal.", 'matlab')
call g:quickmenu#append("add brkpoint", "exe 'normal! Oimport ipdb; ipdb.set_trace()\<Esc>'", "add brkpoint", 'python')
call g:quickmenu#append("REPL Python", "REPLToggle", "<leader>w: send code; <c-w>N: back to term-normal.", 'python')
call g:quickmenu#append("Run %{expand('%:t')}", "let $PYTHONUNBUFFERED=1 | AsyncRun -raw %:p",
            \ "run current script. | Use `AsyncRun python` to run selected lines.", 'python,sh')
call g:quickmenu#append("Run %{expand('%:t')}", "AsyncRun gnuplot --persist %:p", "Run gnuplot script", 'gnuplot')
let g:next_py_version = 2
function! TogglePy23()
    if g:ale_python_pylint_executable == 'python3'
        let g:ale_python_pylint_executable = 'python2'
        let g:ale_python_flake8_executable = 'python2'
        let g:pydoc_cmd = 'python2 -m pydoc'
        let g:next_py_version = 2
    else
        let g:ale_python_pylint_executable = 'python3'
        let g:ale_python_flake8_executable = 'python3'
        let g:pydoc_cmd = 'python3 -m pydoc'
        let g:next_py_version = 3
    endif
endfunction
call g:quickmenu#append("切换到Python%{g:next_py_version}", 'call TogglePy23()', "切换ale/pydoc的python版本", 'python')
"----------------------------------------
call g:quickmenu#append("# YCM", '', '', 'c,cpp,python,java,js')
call g:quickmenu#append("FixIt", 'YcmCompleter FixIt', "YcmCompleter FixIt", 'c,cpp,python')
function! YcmRefactorRename()
    let new_name = input("New Name: ")
    exe "YcmCompleter RefactorRename " . new_name
endfunction
call g:quickmenu#append("RefactorRename", 'call YcmRefactorRename()', "YcmCompleter RefactorRename", 'c,cpp,python')
call g:quickmenu#append("GoTo", 'YcmCompleter GoTo', "Definition, Declaration, Include", 'c,cpp,python')
call g:quickmenu#append("GoToRef", 'YcmCompleter GoToReferences', "GoToReferences", 'python')
call g:quickmenu#append("GetType", 'YcmCompleter GetType',
            \ "the type of the variable or method, and where it differs, the derived type", 'c,cpp,python')
call g:quickmenu#append("GetParent", 'YcmCompleter GetParent', "the semantic parent", 'c,cpp,python')
call g:quickmenu#append("GetDoc", 'YcmCompleter GetDoc',
            \ "displays type or declaration/Doxygen or javadoc/Python docstrings / etc.", 'c,cpp,python')
call g:quickmenu#append("References", 'YcmCompleter GoToReferences', "finds all the references", 'c,cpp,python')
call g:quickmenu#append("YcmDiags", 'YcmDiags', "YcmDiags", 'c,cpp,python')

"========================================
noremap <silent><F5> :call quickmenu#toggle(1)<cr>
call g:quickmenu#current(1)
call g:quickmenu#header('Gereral')
"----------------------------------------
call g:quickmenu#append('# Window', '')
call g:quickmenu#append('Startify', 'Startify', '')
call g:quickmenu#append('NERDTreeToggle', 'NERDTreeToggle', '')
function! Ranger()
    silent !ranger --choosefile=/tmp/chosen
    if filereadable('/tmp/chosen')
        exe 'edit ' . system('cat /tmp/chosen')
        call system('rm /tmp/chosen')
    endif
    redraw!
endfunction
nnoremap <leader>r :call Ranger()<cr>
call g:quickmenu#append('Ranger', 'call Ranger()', '<leader>r')
" check unsaved changes
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif
call g:quickmenu#append('DiffOrig', 'DiffOrig', 'check unsaved changes')
"----------------------------------------
call g:quickmenu#append("# FZF", '')
call g:quickmenu#append("Files", 'Files', "<leader>f: use fzf's *Files* on current project")
call g:quickmenu#append("Ag", 'Lines', "<leader>/: use fzf's *Ag* on current project")
call g:quickmenu#append("BLines", 'BLines', "<leader>l: use fzf's *BLines* on current buffer")
call g:quickmenu#append("Lines", 'Lines', "use fzf's *Lines* on opened buffers")
call g:quickmenu#append("Tags", 'LeaderfBufTagAll', "use *LeaderfBufTagAll* on opened buffers")
call g:quickmenu#append("Functions", 'LeaderfFunctionAll', "use *LeaderfFunction* on opened buffers")
call g:quickmenu#append("# Git", '')
call g:quickmenu#append("Diff", 'Gvdiff', "use fugitive's *Gvdiff* on current document")
call g:quickmenu#append("Status", 'Gstatus', "use fugitive's *Gstatus* on current document")
call g:quickmenu#append("Preview Hunk", 'GitGutterPreviewHunk',
            \ 'Preview the hunk under the cursor. :pc[lose] to close the preview window')
call g:quickmenu#append("Undo Hunk", 'GitGutterUndoHunk', '<Leader>hp: Undo the hunk under the cursor.')

"==|ale|=======================================================================
"let g:ale_pattern_options_enabled " default !empty(g:ale_pattern_options)
"let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0}}
"let g:airline#extensions#ale#enabled = 0 " default 1
"let g:ale_command_wrapper = '' " default ''
"let g:ale_completion_enabled = 1 " default 0
"let  g:ale_echo_cursor = 0  " tmp setting for cursor invisible
let  g:ale_echo_msg_format = '%code%: %s [%linter%][%severity%]'
"let b:ale_echo_msg_format = '%code%: %s [%linter%][%severity%]'
"normal模式下文字改变时运行linter，相对保守的做法，没有会导致YouCompleteMe的补全对话框频繁刷新。
let g:ale_lint_on_text_changed = 'normal'
"离开insert模式时运行linter，相对保守的做法，没有会导致YouCompleteMe的补全对话框频繁刷新。
let g:ale_lint_on_insert_leave = 1
"let g:ale_fix_on_save = 1 " default 0
"let b:ale_fix_on_save = 1 " default 0
"let g:ale_keep_list_window_open = 0 " default 0
let g:ale_sign_error = '✗' " '•✹●' default '>>'
let g:ale_sign_warning = '✭' " '▶' default '--'
"let g:ale_sign_info = " default g:ale_sign_warning
"let g:ale_sign_style_error = " default g:ale_sign_error
"let g:ale_sign_style_warning = " default g:ale_sign_warning
"let g:ale_sign_offset = 1000000 " default 1000000
"let g:ale_type_map = {} " default {}
"let b:ale_type_map = {} " default {}
let g:ale_linters = {
            \ 'python': ['flake8', 'pylint'],
            \ }
let g:ale_python_pylint_executable = 'python3'
let g:ale_python_pylint_options = '--rcfile ~/rcfiles/pylint.conf'
let g:ale_python_pylint_use_global = 1
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8 --conf=' . expand('~/rcfiles/flake8.conf')
let g:ale_python_flake8_use_global = 1
let g:ale_c_parse_makefile = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_executable = 'clang++'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

"==|neoformat|=================================================================
let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']
let g:neoformat_cpp_clangformat = {
        \ 'exe': 'clang-format',
        \ 'args': ['-style="{BasedOnStyle: WebKit,
        \                    AlignAfterOpenBracket: Align,
        \                    AlignOperands: true,
        \                    AllowAllParametersOfDeclarationOnNextLine: false,
        \                    BinPackParameters: false,
        \                    BreakInheritanceList: BeforeComma,
        \                    ColumnLimit: 120,
        \                    Cpp11BracedListStyle: true,
        \                    FixNamespaceComments: true,
        \                    IndentPPDirectives: AfterHash,
        \                    SpacesBeforeTrailingComments: 2,
        \                    SpacesInContainerLiterals: false}"'],
        \ }
let g:neoformat_enabled_cpp = ['clangformat']

let g:neoformat_c_clangformat = {
        \ 'exe': 'clang-format',
        \ 'args': ['-style="{BasedOnStyle: WebKit,
        \                    AlignAfterOpenBracket: Align,
        \                    AlignOperands: true,
        \                    AllowAllParametersOfDeclarationOnNextLine: false,
        \                    BinPackParameters: false,
        \                    BreakInheritanceList: BeforeComma,
        \                    ColumnLimit: 120,
        \                    Cpp11BracedListStyle: true,
        \                    FixNamespaceComments: true,
        \                    IndentPPDirectives: AfterHash,
        \                    SpacesBeforeTrailingComments: 2,
        \                    SpacesInContainerLiterals: false}"'],
        \ }
let g:neoformat_enabled_c = ['clangformat']

"augroup fmt
"  autocmd!
"  autocmd BufWritePre * undojoin | Neoformat
"augroup END

"==|space-vim-dark|============================================================
let g:space_vim_dark_background = 233 " 233(darkest)-238(lightest)
colorscheme space-vim-dark
hi Comment cterm=italic
hi LineNr  ctermfg=gray
hi CursorLineNr	ctermfg=yellow ctermbg=235
hi CursorLine	ctermbg=235

"==|dict|======================================================================
function! Mydict()
    let expl=system('sdcv --utf8-output -n ' .
                \ expand("<cword>"))
    windo if
                \ expand("%"=="dict-tmp") |
                \ q! | endif
    15sp dict-tmp
    setlocal buftype=nofile bufhidden=delete noswapfile modifiable
    nnoremap <buffer> q :q<cr>
    1s/^/\=expl/
    1
endfunction
nnoremap <leader>k :call Mydict()<cr>

"==|FileType|==================================================================
"--Python--
let $PYTHONUNBUFFERED=1
autocmd BufNewFile *.py 0r ~/rcfiles/vim_template/py_header
autocmd BufNewFile *.py exe "1," . line("$") . "g/_date_/s/_date_/" .strftime("%Y-%m-%d")
autocmd BufNewFile *.py exe "normal! G"
function! QuickfixToggle()
    let has_quickfix = 0
    for winnr in range(1, winnr('$'))
        if getwinvar(winnr, '&syntax') == 'qf'
            let has_quickfix = 1
        endif
    endfor
    if has_quickfix == 1
        exe 'cclose'
    else
        exe 'copen'
    endif
endfunction
autocmd FileType python,c,cpp nnoremap <F10> :call QuickfixToggle()<cr>

"--C/C++--
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
