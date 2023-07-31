set nocompatible " be iMproved, required

let mapleader='\' " Map leader key

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTES
" - :map and :noremap are recursive and non-recursive versions of the various mapping commands
" - Vim is a modal editor. It has a [n]ormal mode, [v]isual mode and other modes
" - Fix Indent gg=G


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BEHAVIOR & FORMATTING

set autoindent    " Indent at the same level of the previous line
set copyindent    " Copy the previous indentation on autoindenting
set shiftwidth=2  " Use indents of x spaces
set expandtab     " Tabs are spaces, not tabs
set tabstop=2     " An indentation every four columns
set softtabstop=2 " Let backspace delete indent
set nojoinspaces  " Prevents inserting two spaces after punctuation on a join (J)

set wrap linebreak nolist " Soft-wrap lines longer than window width
set colorcolumn=100       " Show wrap boundary for manual wrapping (80 is recommended for reading - see typography)
let &colorcolumn=join(range(100,101),",")

"set switchbuf+=usetab,newtab "switch to an existing tab page if it contains a window displaying the target buffer, instead of duplicating it in a new tab

nmap <leader>w :set wrap<CR>
nmap <leader>nw :set nowrap<CR>

" Make wrap look nicer when used
set breakindent
set breakindentopt=sbr
" I use a unicode curly array with a <backslash><space>
set showbreak=↪>\

" New horizontal split
nmap <Leader>h :sp untitled<CR> 

" New vertical split
nmap <Leader>v :vsp untitled<CR>
set splitright

" Folding options
set foldenable
set foldmethod=syntax
set foldlevel=999
set foldcolumn=0

"let javaScript_fold=1     " JavaScript
"let perl_fold=1           " Perl
"let php_folding=1         " PHP
"let r_syntax_folding=1    " R
"let ruby_fold=1           " Ruby
"let sh_fold_enabled=1     " sh
"let vimsyn_folding='af'   " Vim script
"let xml_syntax_folding=1  " XML
"nnoremap <space> za       " Key map to open/close folds


"set pastetoggle=<C-p> " Pastetoggle (sane indentation on pastes)
set history=1000      " Remember more commands and search history
set undolevels=1000   " Use many muchos levels of undo

set visualbell noerrorbells " Don't beep
set nobackup                " Avoid un-needed buffer backup
set noswapfile              " Avoid temporary files when editing
set autoread                " Auto-update file when changed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EDITOR SETTINGS & KEY MAPPING

syntax enable
set synmaxcol=1000             " Boost performance with long lines
set number                     " Show line numbers
set backspace=indent,eol,start " Backspace for dummies
set linespace=0                " No extra spaces between rows
set incsearch                  " Find as you type search
set hlsearch                   " Highlight search terms
set winminheight=0             " Windows can be 0 line high
set ignorecase                 " Case insensitive search
set smartcase                  " Case sensitive when uc present
set signcolumn=yes             " Always have the sign column visible

" Code completion
set wildmenu                      " Show list instead of just completing
set wildmode=longest,list:longest " Command <Tab> completion, list matches, then longest common part, then all
set completeopt=menu,preview
set complete=.,b,u,]              " pull from keywords in the current file, other buffers (closed or still open), and from the current tags file

set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap too
set cursorline                 " Highlight current line
set laststatus=1

" Concealing 'markup' characters to improve readability
set conceallevel=2
set concealcursor=nc

set splitright " Puts new vsplit windows to the right of the current
set splitbelow " Puts new split windows to the bottom of the current

" Tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Window Naviation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quickly edit/reload the vimrc file                                                                
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Resize window (width)
nmap <leader>] :vertical resize +10<CR>
nmap <leader>[ :vertical resize -10<CR>

" Resize window (height)
nmap <leader>} :resize +10<CR>
nmap <leader>{ :resize -10<CR>

" Close all tabs except the current one
nmap <leader>ct :tabonly<CR>

" toggle location list window
nmap <leader>l :lopen<cr>
nmap <leader>cl :lclose<cr>

" toggle quickfix list window
nmap <leader>f :copen<cr>
nmap <leader>cf :cclose<cr>

" Reload file (:edit | :e)
nmap <leader>r :e<CR>

" Clear search
nmap <leader>/ :let @/ = ""<CR>

" Copy current buffer filepath to clipboard
nmap cp :let @+ = expand("%")<CR>

" Enable mouse support
set mouse=a

" Fluid incremental side-scroll
set sidescroll=1 listchars=extends:…,precedes:…

" Enable clipboard support
set clipboard=unnamed

" Spell check
" ]s — move to the next mispelled word
" [s — move to the previous mispelled word
" zg — add a word to the dictionary
" zug — undo the addition of a word to the dictionary
" z= — view spelling suggestions for a mispelled word
" set spell
set spelllang=en_us
set spellfile=~/.vim/spell/en.add

" Set an appropriate title for the terminal session
set title
set titlestring=%t


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS

filetype off

" set the runtime path to include plugin manager
" https://github.com/junegunn/vim-plug
set rtp+=~/.vim/autoload/plug.vim
set wildignore-=doc

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'terryma/vim-multiple-cursors'
Plug 'mileszs/ack.vim'
Plug 'ludovicchabant/vim-gutentags'

"Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

"Javascript development
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

"Golang development
Plug 'fatih/vim-go'

"Solidity development
Plug 'tomlion/vim-solidity'

Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

"JSON
Plug 'kevinoid/vim-jsonc'

call plug#end()
filetype plugin indent on

colorscheme gruvbox

" CoC extensions
let g:coc_global_extensions = [
  \ 'coc-highlight',
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-go',
  \ 'coc-prettier',
  \ 'coc-eslint'
  \ ]

let $NVIM_COC_LOG_LEVEL='off'

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" in millisecond, used for both CursorHold and CursorHoldI,
" use updatetime instead if not defined
let g:cursorhold_updatetime = 100
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent! call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" NERDTREE
if isdirectory(expand("~/.vim/plugged/nerdtree"))
    map <leader>d :NERDTreeTabsToggle<CR>
    map <leader>df :NERDTreeFind<CR>
    let NERDTreeShowBookmarks=0
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_console_startup=1
    let g:NERDTreeWinSize=20
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
    let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
endif

" GIT GUTTER
if isdirectory(expand("~/.vim/plugged/gitgutter"))
    set signcolumn=yes

    nmap ]h <Plug>(GitGutterNextHunk) "same as default
    nmap [h <Plug>(GitGutterPrevHunk) "same as default

    nmap ghs <Plug>(GitGutterStageHunk)
    nmap ghu <Plug>(GitGutterUndoHunk)

    let g:gitgutter_sign_added = '✚'
    let g:gitgutter_sign_modified = '✹'
    let g:gitgutter_sign_removed = '-'
    let g:gitgutter_sign_removed_first_line = '-'
    let g:gitgutter_sign_modified_removed = '-'
endif

let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1

" CTRL-P
if isdirectory(expand("~/.vim/plugged/ctrlp.vim"))
    let g:ctrlp_map = '<leader>p'
    "let g:ctrlp_cmd = 'ctrlp'
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:50'
    let g:ctrlp_extensions = ['buffertag']
    " Make CtrlP load 100x faster by making it skip files inside .gitignore
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
    map <leader>t :CtrlPBufTag<CR>
endif

" TABULAR
map <leader>a :Tabularize /

" https://jameschambers.co.uk/vim-typescript-slow
set re=0

" NOTES
" Navigating code with ctags
"   ^]     Jump to definition
"   ^t	   Jump back from definition
"   ^W}	   Preview definition
"   g]	   See all definitions

" Fugitive Conflict Resolution
" Credit to https://medium.com/prodopsio/solving-git-merge-conflicts-with-vim-c8a8617e3633
nnoremap <leader>g :G<CR>
nnoremap <leader>gd :Gvdiff!<CR>
nnoremap <leader>gdh :diffget //2<CR>
nnoremap <leader>gdl :diffget //3<CR>
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gb :GBrowse!<CR>
nnoremap <leader>gct :Git checkout --theirs 
nnoremap <leader>gco :Git checkout --ours 

" VIM-GO
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
