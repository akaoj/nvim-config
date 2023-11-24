execute pathogen#infect()

" Don't interpret the first lines when opening files
set nomodeline

" Tabs
set shiftwidth=4  " Make an indent correspond to 4 spaces
set noexpandtab   " Do not replace tabs with spaces
set tabstop=4     " Display a tab as 4 spaces wide

set nosmartindent
set hidden  " allows us to change buffer even if current one is not saved

set number
set mouse=a

" Smart search
set ignorecase
set smartcase

set linebreak  " do not split words over 2 lines
set breakindentopt=shift:1  " add a space before the continuation line (makes distinction easier)

" Colors in the terminal will be the same as in GUI
set termguicolors

set background=dark

" Displays a menu when `:find <tab>`
set wildmenu

set complete=.,w,b,u,t,i
set scrolloff=5  " Make vim scroll when the cursor is 5 lines above or below the limit

" Show a live preview of the substitutions
set inccommand=nosplit

" open folders with a tree-style
let g:netrw_banner=0
let g:netrw_liststyle=3

" The automcd is needed because without it the solarized theme will somehow remove the highlightings…
" Highlight starting spaces (instead of tabs) INCLUDING spaces after tabs
autocmd VimEnter,WinEnter * highlight StartingSpaces ctermbg=52 guibg=#073642
autocmd VimEnter,WinEnter * call matchadd('StartingSpaces', '^[ ]\+\|\(\t\+\)\@<= \+', 1)
" Highlight trailing spaces and tabs
autocmd VimEnter,WinEnter * highlight TrailingWhitespace ctermbg=red guibg=red
autocmd VimEnter,WinEnter * call matchadd('TrailingWhitespace', '\s\+$', 2)
" Highlight non-breaking spaces (useful for special keyboards like TypeMatrix which creates NBSP on [Shift]+[Space])
autocmd VimEnter,WinEnter * highlight NonBreakingSpaces ctermbg=red guibg=red
autocmd VimEnter,WinEnter * call matchadd('NonBreakingSpaces', ' ', 3)
" Highlight all tabs that are not indentation
autocmd VimEnter,WinEnter * highlight NonIndentationTabs ctermbg=red guibg=red
autocmd VimEnter,WinEnter * call matchadd('NonIndentationTabs', '\([^\t]\)\@<=\t\+', 4)

" Make Editorconfig skip git commits
autocmd FileType gitcommit let b:EditorConfig_disable = 1

let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

colorscheme solarized

" Custom mappings for fzf.vim
nmap <Leader>b :Buffers<CR>
nmap <Leader>f :Files<CR>

" Don't automatically add auto-wrap
let g:EditorConfig_preserve_formatoptions = 1

lua require('init')
