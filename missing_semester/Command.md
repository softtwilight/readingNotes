```shell
# find the first java file, show the contents of this file which match the 'new'  
# and 5 line before and after match
fd '.java$' | head -n1 | xargs cat | grep new -C 5



# Find all python files where I used the requests library
rg -t py 'import requests'
# Find all files (including hidden files) without a shebang line
rg -u --files-without-match "^#!"
# Find all matches of foo and print the following 5 lines
rg foo -A 5
# Print statistics of matches (# of matched lines and files )
rg --stats PATTERN
```

https://github.com/clvv/fasd