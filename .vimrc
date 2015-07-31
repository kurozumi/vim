"行番号を表示する
set number
"カーソルが何行目の何列目に置かれているかを表示する。
set ruler
"タブ文字、行末など不可視文字を表示する
"set list
"listで表示される文字のフォーマットを指定する
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
"インクリメンタルサーチを行う
set incsearch
"前回の検索パターンが存在するとき、それにマッチするテキストを全て強調表示する。
set hlsearch
"オンのときは、ウィンドウの幅より長い行は折り返され、次の行に続けて表示される。
set nowrap
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"行末・行頭から次の行へ移動可能に
set whichwrap=h,l
"検索をファイルの先頭へループしない
set nowrapscan
"検索時に大文字小文字を区別しない
set ignorecase
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"ヒストリに保存するコマンドの最大数を指定
set history=2000
"新しい行のインデントを現在行と同じにする
set autoindent
"タブの代わりに空白文字を挿入する
set expandtab
"画面上でタブ文字が占める幅
set tabstop=2
"シフト移動幅
set shiftwidth=4
"ヘルプドキュメントの検索順を変更
set helplang=ja,en
"クリップボードをWindowsと連携
set clipboard=unnamed


"一旦ファイルタイプ関連を無効化する
filetype off
filetype plugin indent off
"シンタックスハイライトを有効にする
syntax on
"カラースキーマを指定する
colorscheme pablo


"-------------------------
" ctags設定
"-------------------------
" set tags=tags
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>


"-------------------------
" noecomplecache設定
"-------------------------
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dict/php.dict filetype=php
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_manual_completion_start_length=0
let g:neocomplcache_caching_percent_in_statusline=1
let g:neocomplcache_enable_skip_completion=1
let g:neocomplcache_skip_input_time='0.5'

"-------------------------
" syntastic設定
"-------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_echo_current_error=1
let g:syntastic_auto_loc_list=2
let g:syntastic_enable_highlighting=1
let g:syntastic_php_php_args='-l'

"-------------------------
" Neobundle設定
"-------------------------
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

  NeoBundleFetch 'Shougo/neobundle.vim'
  
  NeoBundle 'joonty/vdebug'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'Townk/vim-autoclose'
  NeoBundle 'mattn/emmet-vim'
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'sjl/badwolf'
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'scrooloose/syntastic'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
