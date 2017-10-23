if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/sizukutamago/.vimrc', '/Users/sizukutamago/dotfiles/vim/plugins/dein.toml', '/Users/sizukutamago/dotfiles/vim/plugins/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/sizukutamago/dotfiles/vim/dein'
let g:dein#_runtime_path = '/Users/sizukutamago/dotfiles/vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/sizukutamago/dotfiles/vim/dein/.cache/.vimrc'
let &runtimepath = '/Users/sizukutamago/dotfiles/vim/dein/repos/github.com/Shougo/dein.vim/,/Users/sizukutamago/.vim,/Applications/MacVim.app/Contents/Resources/vim/vimfiles,/Users/sizukutamago/dotfiles/vim/dein/repos/github.com/Shougo/vimproc.vim,/Users/sizukutamago/dotfiles/vim/dein/repos/github.com/Shougo/dein.vim,/Users/sizukutamago/dotfiles/vim/dein/.cache/.vimrc/.dein,/Applications/MacVim.app/Contents/Resources/vim/runtime,/Users/sizukutamago/dotfiles/vim/dein/.cache/.vimrc/.dein/after,/Applications/MacVim.app/Contents/Resources/vim/vimfiles/after,/Users/sizukutamago/.vim/after,/Applications/MacVim.app/Contents/Resources/vim/plugins/autofmt,/Applications/MacVim.app/Contents/Resources/vim/plugins/golang,/Applications/MacVim.app/Contents/Resources/vim/plugins/kaoriya,/Applications/MacVim.app/Contents/Resources/vim/plugins/vimdoc-ja'
filetype off
  let NERDTreeShowHidden = 1
  nnoremap <silent><C-e> :NERDTree<CR>
  let g:nerdtree_tabs_open_on_console_startup=1
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_auto_select = 1
  let g:neocomplete#enable_enable_camel_case_completion = 0
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
  inoremap <expr><CR>   pumvisible() ? "\<C-n>" . neocomplete#close_popup()  : "<CR>"
  imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
  let g:phpfmt_standard = 'PSR2'
  let g:phpfmt_autosave = 1
  
  let g:php_localvarcheck_enable = 1
  let g:php_localvarcheck_global = 0
