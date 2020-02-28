CPU 虚拟化（time-share）有两个最主要的问题要解决，一是性能，第二是控制。

- Create entry for process list
- Allocate memory for program
- Load program into memory
- Set up stack with argc/argv
- Clear registers
- Execute call main()
- Run main()
- Execute return from main
- Free memory of process
- Remove from process list

#### Limited direct execution.
如果直接执行，OS怎么保证程序不做恶意的事情。怎么停止，切换到别的进程。  
限制进程的操作，引入一个新的mode，user mode. for example, 在user mode 不能  issue I/O requests.  
相应的kernel mode, 是OS 运行的mode.  

##### Restricted Operations
限制性的操作通过system call 暴露给user mode. 调用system call的时候，执行一个`trap`操作，权限升级到kernel mode，然后能访问所有资源，完成操作后，再执行`return-from-trap`返回到user mode.(再intel的系统中，每一个process有一个`kernel stack`,可以理解为在两个模式之间传递数据，系统调用时，会将program counter, flags,and a few other registers推到stack上)。  
系统启动的时候会set up一个`trap table`，在硬件上的，remember address of syscall and exception handler。保证system call的时候。  

##### Switching Between Processes
if a process is running on the CPU, this by definition means the OS is not running. OS没有运行，又怎么控制process呢。  
前期的系统时合作式的，OS将CPU让渡给process，只有在发生`syscall`和`trap`的时候才会介入，如果写一个死循环...
现代的系统用a timer interrupt，每过一段时间OS就会介入。`timer` + `interrupt handler`.  
scheduler 决定哪个process执行。切换还是继续。  
切换的时候需要save and restore context. OS会保存一些现在执行的process的寄存器信息到`kernel stack`，然后将马上执行的进程信息(the general purpose registers, PC, and the kernel stack pointer)，从kernel stack restore.  
切换stack的时候kernel执行`kernel stack`的`switch call`， 返回将要执行process的stack。 然后执行`return-from-trap`，就可以执行信进程了。