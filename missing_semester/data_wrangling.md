## Data Wrangling

[practice](https://missing.csail.mit.edu/2020/data-wrangling/)
```shell
grep
less
# -E for new Regular expersion
sed -E
sed -E 's/{regex}/{substitution}/'
wc -l
# uniq the line and count the ocurres.
| sort | uniq -c
# man sort
| sort -nk1,1
| tail -n10
# opeating columns
| awk
| paste -sd,
#bc for caculator
bc
gnuplot
# turn output to the input
xargs
convert
tee
scp
# parse html
pup
# parse json
jq

```

```shell
cat /usr/share/dict/words | grep '^.*a.*a.*a.*s$' | sed -E 's/^.*(.s)$/\1/' | sort | uniq -c | sort -k2

cat /usr/share/dict/words | grep '^.*s$' |awk 'length($0) > 1' | sed -E 's/^.*(.s)$/\1/' | sort | uniq -c | sort -nk1

```
```shell
# get the text url
curl https://stats.wikimedia.org/EN/TablesWikipediaZZ.htm > test.html
# select the specific column of html
# select table (id = table1) , 2nd td, get text, grep filter only number
cat test.html | pup 'table#table1 tbody td.rb:nth-child(2) text{}' | grep '\d$' > column2
cat test.html | pup 'table#table1 tbody td.rb:nth-child(3) text{}' | grep '\d$' > column3
# merge two file side by side, delimeter is TAB, in one line
paste column2 column3 > column2_3

```