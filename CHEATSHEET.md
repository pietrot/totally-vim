## FOLDING
#### CONFIGURATION
```
" Folding options
set foldenable
set foldmethod=syntax
set foldlevel=999
set foldcolumn=0
```
#### HOTKEYS
- `zo` opens a fold at the cursor
- `zO` opens all folds at the cursor
- `zc` close one fold under the cursor
- `zC` close all folds under the cursor recursively
- `za` toggle fold

## COPY/PASTE
- `gv` recover previous selection

## GIT (VIM FUGITIVE)
#### Conflict resolution configuration
--Credit to https://medium.com/prodopsio/solving-git-merge-conflicts-with-vim-c8a8617e3633
```
nnoremap <leader>g :G<CR>
nnoremap <leader>gd :Gvdiff!<CR>
nnoremap <leader>gdh :diffget //2<CR>
nnoremap <leader>gdl :diffget //3<CR>
nnoremap <leader>ga :Gwrite<CR>
```
#### Checkout
```
:Git checkout [--theirs | --ours] file # https://git-scm.com/docs/git-checkout
```
