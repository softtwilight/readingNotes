作者的前言令人感动。
> If you are an instructor or professor who wishes to use this book, please feel
free to do so.

> If you are a student reading this book, thank you! It is an honor for us to
provide some material to help you in your pursuit of knowledge about operating
systems. We both think back fondly towards some textbooks of our undergraduate
days (e.g., Hennessy and Patterson , the classic book on computer architecture) and hope this book will become one of those positive memories for you.
> 
> You may have noticed this book is free and available online2. There is one major
reason for this: textbooks are generally too expensive. This book, we hope, is the
first of a new wave of free materials to help those in pursuit of their education,
regardless of which part of the world they come from or how much they are willing
to spend for a book. Failing that, it is one free book, which is better than none.

> Education is not the filling of a pail but the lighting of a fire.    -- Yeats

> And
thus the real point of the educational process: to go forth, to study many new and
fascinating topics, to learn, to mature, and most importantly, to find something
that lights a fire for you.

---

#### 操作系统是什么?
- 虚拟化物理资源的虚拟机
- 提供系统调用的library
- 管理CPU，memory，disk资源的manager

### Virtualizing 

#### The process
process is a abstraction of running program.  
包含了很多状态，内存（address space），寄存器状态，stack， frame，IO信息等。  
OS 可以同时运行很多process.  
    Although there are only a few physical CPUs available, how can the OS provide the illusion of a nearly-endless supply of said CPUs?  

虚拟化CPU，基本的技术是time sharing. Context-switch.

how programs are transformed into processes?
1. load code and static data into memory from disk.
2. allocate some memory for program's run-time stack. `c` 里 stack 用来保存local variable， funcation parameters, return address.
3. allocate some memory for program's heap. in `C`, heap is used for explicitly requested dynamically-allocated data.
4. other initialization task, 特别是关于input/output IO.
5. start the program running at the entry point.

process states:
- Running 在执行指令
- Ready 准备好run，但是**OS**决定不让run
- Blocked 在等待别的事件，让其继续执行，通常是IO

OS需要记录process的各种信息, process list，以便能调度他们。

process API:
- fork()  copy并创建一个process，在调用点开始往后执行，子进程的rc = 0， parent rc不等于0；
 ``` c
    int rc = fork();
```
- wait()  this system call won’t return until the child has run and exited.
- exec() replaces the current process image with a new process image.  

`fork + exec` 是不是就可以创建一个全新的子进程了。 为什么不直接把两个结合在一起呢？ `fork` 和 `exec` 中间还是可以执行代码的。unix 是关键所在。
可以更改input/output 设定， 比如grep 指令可以打印到屏幕也可以输出到文件 > , 就可以在exec前改变output实现
