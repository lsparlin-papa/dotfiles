syntax enable

colorscheme dracula

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set encoding=utf-8

" italic comments
hi Comment cterm=italic gui=italic guifg=gray ctermfg=gray

set hidden
set number
set smartindent
set hlsearch
set incsearch
set tabstop=2
set shiftwidth=2
set expandtab
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
set sidescroll=2                " cols to scroll when cursor leaves screen to the side
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.

" Fold settings
set foldmethod=syntax      " create fold points automatically based on syntax
autocmd BufWinEnter ?* silent! :%foldopen!

set wrap
set linebreak
set breakindent
set breakindentopt=sbr
set showbreak=↪>\

" vim-markdown do not auto-indent when typing lists
let g:vim_markdown_new_list_item_indent = 0

" lightline (pretty status line) settings
let g:lightline = {
  \  'colorscheme': 'dracula',
  \  'active': {
  \    'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \    'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \  },
  \  'component_function': {
  \    'gitbranch': 'FugitiveHead'
  \  }
  \ }
