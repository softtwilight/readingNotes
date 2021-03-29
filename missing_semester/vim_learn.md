[Mit resource](https://missing.csail.mit.edu/2020/editors/)
## Why we use VIM
    - fast
    - portable

## Operating Modes
- Normail: for moving a file and making edits
- Insert (i (insert before cursor), a (add behind the cursor))
- Replace (R)
- Visual (v / V for visual line mode / ctrl + v for visual block mode)
- Command-line (:)

### Command-line
```
    - :q quit
    - :w save("write")
    - :wq save and quit
    - :e {name of file} open file for editing
    - :ls show open buffers
    - :help {topic} open help
```
### Movement
- Basic movement: `hjkl`(left, down, up, right)
- Words: `w`(next word), `b`(beginning of word), `e`(end of word)
- Lines: `0`(beginning of line), `^`(first), `$`(end of line)
- Screen: `H`(top of screen), `M`(middle of screen), `L`(bottom of screen)
- Scroll: `Ctrl + u`(up), `Ctrl - d` (down)
- File: `gg`(beginning of file), G(end of file)
- Line numbers: `{number} + G` (line {number})
- Misc: `%` (corresponding item)
- Find: `f{character}`,`t{character}`, `F{character}`, `T{character}`
    - find/to forward/backword{character} on the current line.
    - ,/; for navigating matches

### Selection
v, Visual modes, and use movement keys to make selection.

### Edits
- `i` enter insert mode
- `a` enter insert at right of cursor
- `A` enter insert at end of line
- `o / O` insert line below / above
- `d{motion}` delete{motion}
    - `dw` delete the word
    - `d$` delete to end of line
    - `d0` delete to beginning of line
- `r` replace a character
- `R` into replace mode, can replace many charactre until exit
- `c{motion}` change{motion}
    - `cw` change the word (= `dw` + `i`) 
- `x` delete character(= equal `dl`)
- `s` substitue character (equal to `xi`)
- Visual mode + manipulation
    - select text, `d` to delete it or `c` to change it
- `u` to undo, `ctrl + r` to redo
- `y` to copy ("yand")
- `p` to paste
- `~` flips the case of a character 

### Countslj
- `3w` move 3 words forward
- `5j` move 5 lines down
- `7dw` delete 7 words

### Modifiers
- `ci(` (change the contents inside the current pair of parentheses)
- `ci[`
- `da'` (delete a single-quoted string, including the '') 

### Search and replace
- `/{search contents}` search
    - `n` for next match, `N` for next match in opppside direction.
- `%` search the parenthsis , bracket etc.
- `:set ic` ignore the case of search
- `:set hls is` `hls` highlight of the search result ,`is` for partial matches
- `:s`
    - `%s/zoo/bar/g`
    - replace zoo with bar globally in file
    - `%s/\[.*\](\(.*\))/\1/g`
    - replace named Markdown links with plain URLS

### Multiple windows
- `:sp` / `:vsp` to split windows

### Read and write
- `v` + select contents , -> `:w {fileName}` write contents to `pwd` dir
- `:r {fileName}` read file content and paste it below the cursor.
    - `:r !ls` append output of the command `ls`
- `:!{commandline}` exec command in vim.

### Repeat
- `.` repeat last change, with count {count}`.`

### Resources
```shell
vimtutor
```
[VIM Game!](https://vim-adventures.com/)