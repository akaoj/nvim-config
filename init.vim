execute pathogen#infect()

" Don't interpret the first lines when opening files
set nomodeline

" Tabs
set shiftwidth=4  " Make an indent correspond to 4 spaces
set noexpandtab   " Do not replace tabs with spaces
set tabstop=4     " Display a tab as 4 spaces wide

set nosmartindent
set hidden  " allows us to change buffer even if current one is not saved

set nocompatible
set number
set mouse=a

" Smart search
set ignorecase
set smartcase

set foldmethod=indent
set foldlevel=99

" Display a vertical line at 120 chars (this might change depending on the current file)
set colorcolumn=121

set linebreak  " do not split words over 2 lines
"set breakindent  " set the same indentation to the broke line than the original one
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

" Use Python 3 for flake8 and pylint
"let g:ale_python_flake8_executable = 'python3'
"let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_pylint_executable = 'pylint-3'

" Disable import errors with Pylint (most of the time software is running in containers)
let g:ale_python_pylint_options = '--disable E0401'

let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

colorscheme solarized

" Run FZF when calling `:f` (needs FZF to be installed)
cabbrev f FZF

" Do not use arrow keys to navigate in the autocomplete menu (use <C-p> and <C-n> as it's supposed to)
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:ycm_key_list_stop_completion = ['<Up>', '<Down>']

let g:UltiSnipsExpandTrigger = "<S-Tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-n>"
let g:UltiSnipsJumpBackwardTrigger = "<C-p>"

let g:gutentags_cache_dir = "~/.config/nvim/tags"
let g:gutentags_exclude_filetypes = ["gitcommit"]  " prevent error when commiting with vim/neovim

lua require'colorizer'.setup()
