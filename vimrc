syntax enable
syntax on
set nocompatible
set mouse-=a

filetype off                    " required!
call plug#begin('~/.vim/plugged')

Plug 'Vimjas/vim-python-pep8-indent'
Plug 'cohama/agit.vim'
Plug 'w0rp/ale'
Plug 'luochen1990/rainbow'
Plug 'mileszs/ack.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'Valloric/ListToggle'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'git://git.wincent.com/command-t.git'
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'Lokaltog/vim-powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-eunuch'
Plug 'altercation/vim-colors-solarized'
Plug 'tczengming/autoload_cscope.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'python-mode/python-mode', { 'branch': 'develop'  }
" Plug 'edkolev/tmuxline.vim'
Plug 'mhinz/vim-signify'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
"......................................
call plug#end()

" paste mode
"set pastetoggle=<F5>


" ================ map learder =============================
let mapleader="\<Space>"

" ================= python ================================
nnoremap <leader>d Oimport pdb; pdb.set_trace()<Esc>

" ================ ctags ========================
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" =================== gtags =====================
let g:gutentags_define_advanced_commands = 1
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

" =================== syntastic ==========================
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
"set error or warning signs
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '!'
"whether to show balloons
let g:syntastic_enable_balloons = 1

" ===================== ale ========================
let g:ale_sign_column_always = 1
let g:ale_sign_error = '<<'
let g:ale_sign_warning = '||'
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"====================== YouCompleteMe =================
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_invoke_completion = '<C-/>'
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_error_symbol = '^^'
let g:ycm_warning_symbol = '**'
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <F8> :YcmForceCompileAndDiagnostics<CR>
nnoremap <C-i> :YcmCompleter GoToDefinition<CR>
nnoremap <leader>\ :YcmCompleter GoTo<CR>

" =================打开ctrlp搜索======================
" let g:ctrlp_map = '<leader>ff'
" let g:ctrlp_cmd = 'CtrlP'
" " 相当于mru功能，show recently opened files
" map <leader>fp :CtrlPMRU<CR>
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
" let g:ctrlp_custom_ignore = {
"     \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
"     \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
"     \ }
" "\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
" let g:ctrlp_working_path_mode=0
" let g:ctrlp_match_window_bottom=1
" let g:ctrlp_max_height=15
" let g:ctrlp_match_window_reversed=0
" let g:ctrlp_mruf_max=500
" let g:ctrlp_follow_symlinks=1
"
" if executable('ag')
"   " Use Ag over Grep
"   set grepprg=ag\ --nogroup\ --nocolor
"   " Use ag in CtrlP for listing files.
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"   " Ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
" endif

" ===================== fzf ============================
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fm :Marks<CR>
nnoremap <leader>fa :Ag<CR>
nnoremap <leader>ft :BLines<CR>

" ================= rainbow ========================
let g:rainbow_active = 1

" ================ Powerline ===============
let g:Powerline_Symbols='fancy'
set encoding=utf-8
set laststatus=2

" ================= airline ==================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" ================== multiple cursors =============================
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" ======================== vimtex ==============================
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" ======================== ultisnips ===========================
let g:UltiSnipsExpandTrigger = '<C-h>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'


" ================== general settings =============================
filetype on
filetype plugin on
filetype indent on

set backspace=2
set completeopt=longest,menu

set previewheight=10
set pumheight=15
"let g:AutoPreview_enabled=1
set updatetime=500
"nnoremap <F5> :AutoPreviewToggle<CR>
"inoremap <F5> <ESC>:AutoPreviewToggle<CR>

" 设置文字编码自动识别
set fencs=gbk,utf-8,ucs-bom,gb18030,gb2312,cp936

" 设置高亮搜索
set hlsearch
" 输入字符串就显示匹配点
set incsearch
" ignore upper/lower case when searching
set ignorecase
" Case sensitive if upper-case letter appears.
set smartcase
" 输入的命令显示出来，看的清楚些。
set showcmd

set history=50
set ruler
set number relativenumber
nnoremap <F4> :set nonumber! relativenumber!<CR>:set foldcolumn=0<CR>
colorscheme desert

"格式设置.
set autoindent "自动缩进
set smartindent "智能缩进
set cindent "C缩进
set tabstop=4 "硬TAB
set softtabstop=4 "软TAB
set shiftwidth=4 "缩进空格数
set expandtab "空格替换TAB
set smarttab "智能TAB
set autochdir
set ai " Auto indent
set si " Smart indent

set ruler
set cursorline
set cursorcolumn

" ==================== End of general settings ===============================

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

:set cscopequickfix=s-,c-,d-,i-,t-,e-
":set tags=/home/damon/ubuntu1004-10.3.254.35/sw/s3gdrv/Source_New/tags
":cs add /home/damon/ubuntu1004-10.3.254.35/sw/s3gdrv/Source_New/cscope.out /home/damon/ubuntu1004-10.3.254.35/sw/s3gdrv/Source_New/
":set tags=/root/Downloads/linux-3.8.2/tags
":cs add /root/Downloads/linux-3.8.2/cscope.out /root/Downloads/linux-3.8.2/
":set tags=/home/damon/work/darknet/tags
":cs add /home/damon/work/darknet/cscope.out /home/damon/work/darknet
":set tags=/home/damon/Damon/great_projects/python/2.7.8/Python-2.7.8/tags
":cs add /home/damon/Damon/great_projects/python/2.7.8/Python-2.7.8/cscope.out /home/damon/Damon/great_projects/python/2.7.8/Python-2.7.8

let b:TypesFileRecurse = 1
let b:TypesFileDoNotGenerateTags = 1
let b:TypesFileIncludeLocals = 1
let b:TypesFileIncludeSynMatches =1
let b:TypesFileLanguages = ['c']

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <F6> :cn<cr>
nmap <F7> :cp<cr>

" ===================== BufExplorer =============================
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy='mru'
let g:bufExplorerSplitRight=0
let g:bufExplorerSplitVertical=1
let g:bufExplorerSplitVertSize = 30
autocmd BufWinEnter /[Buf/ List/] setl nonumber

" ====================== NERD Commenter =========================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'  }  }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" ====================== NERDTree config ========================
" open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"map F2 to open NERDTree
map <F2> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=1
let Tlist_WinWidth = 25

" ======================== Tagbar =========================
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_left = 0
nmap <F3> :TagbarToggle<CR>

"let g:winManagerWindowLayout='FileExplorer|BufExplorer|TagList'
"let g:winManagerWindowLayout='BufExplorer|FileExplorer,TagList'
"nmap wm :WMToggle<cr>
"let g:winManagerWidth = 30
"let g:defaultExplorer = 0
"nmap <C-W><C-F> :FirstExplorerWindow<cr>
"nmap <C-W><C-B> :BottomExplorerWindow<cr>
"nmap <silent> <leader>wm :WMToggle<cr>
"nmap <silent> <leader>wu :wa<cr>:TlistUpdate<cr>:FirstExplorerWindow<cr>

" nnoremap <silent> <F12> :A<CR>
" nnoremap <silent> <F3> :Grep<CR>

" let g:SuperTabRetainCompletionType=2
" 0 - 不记录上次的补全方式
" " 1 - 记住上次的补全方式,直到用其他的补全命令改变它
" " 2 - 记住上次的补全方式,直到按ESC退出插入模式为止

" let g:SuperTabDefaultCompletionType="<C-P>"
" 设置按下<Tab>后默认的补全方式, 默认是<C-P>,
" " 现在改为<C-X><C-O>. 关于<C-P>的补全方式,
" " 还有其他的补全方式, 你可以看看下面的一些帮助:
" " :help ins-completion
" " :help compl-omni

" ============= 代码折叠 =====================
" shortcuts: zo, zc, zR, zM
set foldenable
set foldmethod=syntax
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和  }}}
set foldlevel=100 " 启动 vim 时不要自动折叠代码

let c_hi_identifiers='all'
let c_hi_libs=['*']

if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif
