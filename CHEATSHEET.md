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

## SEARCH/REPLACE
#### Across folders & subfolders
If you want to perform a search/replace across you project tree, you can use vim's argument list.
```
:args **/*.{file_ext}
:argdo %s/{search}/{replace}/g
```
You can even use the shell's find command to get a list of all files in the current directory by running:
```
:args `find . -type f`
```
You can view the current args list by running `:args` by itself. If you want to add or delete files from the list, you can use the `:argadd` or the `:argdelete` commands respectively.

—_Credit to https://vi.stackexchange.com/a/2777_

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
