## 13 The Abstraction:Adress Spaces
最开始的系统对内存没有什么抽象，程序直接读取内存。  
当系统开始支持多个process运行，time sharing之后， 切换process的时候，如果把内存的数据写到硬盘再切换， 非常慢。如果process的数据都保存在内存，那么必须对内存进行隔离。  
`address space`  is the running program's view of memory.

## 14 Interlude: Memory API

stack memory  

      
