if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/Users/tanakas/.vim,/Applications/MacVim.app/Contents/Resources/vim/vimfiles,/Applications/MacVim.app/Contents/Resources/vim/runtime,/Applications/MacVim.app/Contents/Resources/vim/vimfiles/after,/Users/tanakas/.vim/after,/Applications/MacVim.app/Contents/Resources/vim/plugins/autofmt,/Applications/MacVim.app/Contents/Resources/vim/plugins/golang,/Applications/MacVim.app/Contents/Resources/vim/plugins/kaoriya,/Applications/MacVim.app/Contents/Resources/vim/plugins/vimdoc-ja,/Users/tanakas/dotfiles/vim/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/tanakas/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/tanakas/dotfiles/vim/dein'
let g:dein#_runtime_path = '/Users/tanakas/dotfiles/vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/tanakas/dotfiles/vim/dein/.cache/.vimrc'
let &runtimepath = '/Users/tanakas/.vim,/Applications/MacVim.app/Contents/Resources/vim/vimfiles,/Users/tanakas/dotfiles/vim/dein/repos/github.com/Shougo/dein.vim,/Users/tanakas/dotfiles/vim/dein/.cache/.vimrc/.dein,/Applications/MacVim.app/Contents/Resources/vim/runtime,/Users/tanakas/dotfiles/vim/dein/.cache/.vimrc/.dein/after,/Applications/MacVim.app/Contents/Resources/vim/vimfiles/after,/Users/tanakas/.vim/after,/Applications/MacVim.app/Contents/Resources/vim/plugins/autofmt,/Applications/MacVim.app/Contents/Resources/vim/plugins/golang,/Applications/MacVim.app/Contents/Resources/vim/plugins/kaoriya,/Applications/MacVim.app/Contents/Resources/vim/plugins/vimdoc-ja'
filetype off
