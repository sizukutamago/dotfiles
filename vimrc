" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルディレクトリ
set backupdir=~/dotfiles/vim/backups
" スワップファイルディレクトリ
set directory=~/dotfiles/vim/swpfiles
" un~ファイルディレクトリ
set undodir=~/dotfiles/vim/unfiles
" .viminfoファイルディレクトリ
set viminfo+=n~/dotfiles/vim/infofile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

augroup vimrc-filetype
    autocmd!
    " PHPだったらインデント幅が４で
    autocmd BufNewFile,BufRead *.php set filetype=php
    autocmd FileType php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
 augroup END

function! s:PHPLint()
  let s:result = system('php -l ' . bufname(""))
  let s:count = split(s:result, "\n")
  echo s:result
endfunction

augroup php-lint
  autocmd!
  autocmd BufWritePost *.php call <SID>PHPLint()
augroup END

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/dotfiles/vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/dotfiles/vim/dein')
  call dein#begin('~/dotfiles/vim/dein')

  call dein#add('ryanoasis/vim-devicons')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight') 

  " Let dein manage dein
  " Required:
  call dein#add('~/dotfiles/vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

