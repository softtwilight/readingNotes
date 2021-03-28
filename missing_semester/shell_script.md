https://missing.csail.mit.edu/2020/shell-tools/
```bash
foo=bar
echo $foo
echo "value is $foo"
echo 'value is $foo'

mkdir test
# $_ 是上次执行的命令的最后一个参数
cd $_
# sudo 上一次的命令
sudo !!
# 上次执行的返回码
# false
# echo $?
echo $?
# process name, param个数, pid
$0 $# $$

# 将函数的output赋值给变量; echo $foo
foo=$(pwd)
echo "we are in $(pwd)"

cat <(ls) <(ls ..)

# command of imagemagick
convert a.jpg a.png
# equals to   cp temp{1,2}.txt
cp temp1.txt temp2.txt
mkdir foo bar
# 在foo，bar 两个目录下，依次创建a，b, c, d四个文件
touch {foo,bar}/{a..d}
# 比较foo 和 bar下面文件的区别
diff <(ls foo) < (ls bar)

# 安装的cmd，显示find命令 的example
tldr find
# 递归找当前目录下后缀是txt的文件，然后删除他们。
find . -name "*.txt" -exec rm {} \;

tldr grep

# 查看带有  convert的历史
history | grep convert
# ctrl + r 然后输入 convert， 再按 ctrl + r 也可以搜索

tldr fzf
cat example.sh | fzf

# 展开目录的command， broot还带展开后的搜索
broot
tree
```



```bash
echo "Starting program at $(date)"
echo "Running program $0 with $# arguments with pid $$"
for file in "$@"; do
	grep foobar "$file" > success.txt 2> error.txt
	if [["$?" -ne 0]]; then
		echo "File $file does not have any foobar, adding one"
		echo "# foobar" >> "$file"
	fi
done
```

```python
#!/usr/bin/env python
import sys
for arg in reversed(sys.argv[1:]):
    print(arg)
```

