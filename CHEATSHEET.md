## FOLDING
### Configuration
```
" Folding options
set foldenable
set foldmethod=syntax
set foldlevel=999
set foldcolumn=0
```
### Hotkeys
- `zo` opens a fold at the cursor
- `zO` opens all folds at the cursor
- `zc` close one fold under the cursor
- `zC` close all folds under the cursor recursively
- `za` toggle fold
- `zR` opens all folds in current buffer
- `zM` closes all folds in current buffer

## COPY/PASTE/DELETE
- `gv` recover previous selection
- `dd` delete current line from cursor position
- `dw` delete current word from cursor position
- `x` delete current character from cursor position

## SEARCH/REPLACE
### Across folders & subfolders
If you want to perform a search/replace across you project tree, you can use vim's argument list.
```
:args **/*.{file_ext}
:silent! argdo %s/{search}/{replace}/g | update #:update is used because it will only save the file if it has changed.
```
#### Notes:
- `:update` is used to save the file after it has changed
- `silent` skips displaying normal messages
- `!` skips displaying error messages
- you can use the shell's find command to get a list of all files in the current directory by running:
  ```
  :args `find . -type f`
  ```
- you can view the current args list by running `:args` by itself. If you want to add or delete files from the list, you can use the `:argadd` or the `:argdelete` commands respectively.

—_Credit to https://vi.stackexchange.com/a/2777_

## GIT (VIM FUGITIVE)
### Conflict resolution configuration
--Credit to https://medium.com/prodopsio/solving-git-merge-conflicts-with-vim-c8a8617e3633
```
nnoremap <leader>g :G<CR>
nnoremap <leader>gd :Gvdiff!<CR>
nnoremap <leader>gdh :diffget //2<CR>
nnoremap <leader>gdl :diffget //3<CR>
nnoremap <leader>ga :Gwrite<CR>
```

_Note: when viewing a vertical diff, center pane is your current workspace, the left side is HEAD and the right side is the branch you are merging._

### Checkout
```
:Git checkout [--theirs | --ours] file # https://git-scm.com/docs/git-checkout
```

### Stashing changes
#### Stash w/ a message
```
git stash push -m "my_stash_name"
git stash apply stash^{/my_stash_name}
```

#### Stash w/o a message
```
git stash
git stash apply # pop & apply latest stash
git stash apply stash@{n} # pop nth stash and apply it
```

#### List stashes
```
git stash list
```
