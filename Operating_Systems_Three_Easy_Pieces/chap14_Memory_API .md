- stack memory. In c 由 compiler 管理。
- heap memory. malloc();

```c
int *x = malloc(10 * sizeof(int));
free(x);

```


## Address Translation

> How can we build an efficient virtualization of memory? How do
we provide the flexibility needed by applications? How do we maintain
control over which memory locations an application can access, and thus
ensure that application memory accesses are properly restricted? How
do we do all of this efficiently?  

对虚拟内存的访问都通过硬件redirect到真实的内存上。OS管理着memory，哪些用了，哪些没用，怎么用。process的视角上，有一个独立连续的memory。

dynamic relocation. base + bound.     
`physical address = virtual address + base`  
bound是用来限制virtual address，在合法的范围内。  
我们把帮助address translation的processor叫MMU, memory
management unit.  
