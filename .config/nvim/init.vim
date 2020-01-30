" --- PLUGINS ---
call plug#begin('~/.local/share/nvim/plugged')
Plug 'jiangmiao/auto-pairs'
" Distractless UI

" --- General ----
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-sentence'
Plug 'vim-scripts/vim-auto-save'
" Preview colorcodes #dddddd
Plug 'ap/vim-css-color'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" --- Prose ---
"  Distraction free writing
Plug 'junegunn/goyo.vim'
" Word phrasing according to word usage experts
" :Wordy [weak, redundant, problematic, puffery, business-jargon, art-jargon, weasel, being, passive-voice, colloquial, idiomatic, similies, adjectives, adverbs, said-synonyms, opinion, contractions, vague-time]
Plug 'reedes/vim-wordy'
" Line-wrapping 
Plug 'reedes/vim-pencil'
" Specify a list of thesauruses, dictionaries, spellfiles
Plug 'reedes/vim-lexical'
" :Grammarcheck
Plug 'rhysd/vim-grammarous'
" Tex syntaxhighlighting, table of contents view, synctex etc. 
Plug 'lervag/vimtex'
" additional concealment vimtex math equations
Plug 'pietropate/vim-tex-conceal'

" --- Programming ---
" Linter
Plug 'w0rp/ale'
" Intellisense engine
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
" LSP support
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Comment functions
Plug 'scrooloose/nerdcommenter'
call plug#end()

" Arch defaults
runtime! archlinux.vim

" use system clipboard (requires +clipboard)
set clipboard^=unnamed,unnamedplus
set encoding=utf8
set modeline           " enable vim modelines
set hlsearch           " highlight search items
set incsearch          " searches are performed as you type
set number             " enable line numbers
set confirm            " ask confirmation like save before quit.
set wildmenu           " Tab completion menu when using command mode
set expandtab          " Tab key inserts spaces not tabs
set softtabstop=4      " spaces to enter for each tab
set shiftwidth=4       " amount of spaces for indentation
set shortmess+=aAcIws  " Hide or shorten certain messages
set showcmd             " Show command that is entered
set ignorecase          " ingore case during search
set nrformats=          " Treat all numbers as decimal numbers
set history=200

" Split direction
set splitbelow
set splitright

" Securely run vimrc configs from current working directory	
" set exrc
" set secure
filetype plugin indent on

" Hide end of buffer '~'
highlight EndOfBuffer ctermfg=black ctermbg=black


" --- Remappings ---
"
"  Adding alt+<key> functionality:
"  https://unix.stackexchange.com/questions/14765/how-to-map-alt-key-in-vimrc
for i in range(97,122)
  let c = nr2char(i)
  exec "map \e".c." <M-".c.">"
  exec "map! \e".c." <M-".c.">"
endfor"  Spelling on the fly

" spellcheck on the fly
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Leader
let mapleader=" "
let maplocalleader = "\\"

" buffer change remapping
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" Clear highlight searches
nnoremap <silent> <C-L> :noh<CR>

noremap <silent> <F8> :<C-u>NextWordy<cr>
xnoremap <silent> <F8> :<C-u>NextWordy<cr>
inoremap <silent> <F8> <C-o>:NextWordy<cr>

" --- Plugins ---=

" ALE
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

"LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }
noremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
" concealment with vim-tex-concal
set conceallevel=2
let g:tex_conceal="abdgms"

" toggle table of contents
noremap <M-c> :VimtexTocToggle<CR>
" synctex view 
noremap <M-v> :VimtexView<CR>

" neovim synctex requirement, neovim-remote must adittionally be used for
" synctex to work properly. 
let g:vimtex_compiler_progname = 'nvr'

" ultinips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" jump to last
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" force write
cnoremap w! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" autosave
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode


function! Prose()
  call lexical#init()
  call textobj#sentence#init()
  Goyo
  Pencil
  setl spell spl=en_us,sv

  " replace common punctuation
  iabbrev <buffer> -- –
  iabbrev <buffer> --- —
  iabbrev <buffer> << «
  iabbrev <buffer> >> »

  " open most folds
  setlocal foldlevel=6

  " highlight words (reedes/vim-wordy)
  noremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  xnoremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  inoremap <silent> <buffer> <F8> <C-o>:NextWordy<cr>
endfunction

autocmd FileType markdown,mkd,text call Prose()

autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2 expandtab


