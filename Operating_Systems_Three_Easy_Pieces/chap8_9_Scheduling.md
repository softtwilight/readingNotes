## The Multi-Level Feedback Queue

现在的unix, windows, solaris都是用类似的scheduler。

- 缩短_turnaround time_ 
- minimize responsive

用过去预测未来，在branch predictors 和 caching algorithm中都有这种思想。

MLFQ有一些不同的queue, 每一个queue被赋予不同的优先级level。

怎么决定job的优先级呢，基于观察到的历史行为。

change priority。5条rule:  
• Rule 1: If Priority(A) > Priority(B), A runs (B doesn’t).  
• Rule 2: If Priority(A) = Priority(B), A & B run in RR.  
• Rule 3: When a job enters the system, it is placed at the highest priority (the topmost queue).  
• Rule 4a: If a job uses up an entire time slice while running, its priority is reduced (i.e., it moves down one queue).  
• Rule 4b: If a job gives up the CPU before the time slice is up, it stays at the same priority level.  


因为不知道一个任务的耗时，所以新任务来的时候都假定为短任务，给予高的优先级，然后再逐步降级。如果不是一个cpu密集任务，比如很多IO，在time-slice结束前就relinquish cpu, 不会降级。

三个问题： 
 	一直有任务进来，就可能有任务一直不被执行  
	恶意程序，在slice time结束前发起io request， 独占cpu  
	程序的行为会改变，最开始是cpu密集型，可以变为io密集型

• Rule 5: After some time period S, move all the jobs in the system to the topmost queue.  
• Rule 4: Once a job uses up its time allotment at a given level (re- gardless of how many times it has given up the CPU), its priority is reduced (i.e., it moves down one queue).   
用每个level限额解决问题2， reboost 解决1,3。
不同的level time-slice也可以不一样。

## Scheduling: Proportional Share
- 随机，Tickets represent the share. 随机简单轻量，需要记录的全局状态少。
- 公平模式， 最小queue， 执行进度最小的process， 执行完加上正比于tickets的倒数的数。 

### CFS
Linux : Completely Fair Scheduler.   
is a bit like weighted round-robin with dynamic time slices .  
Schedler efficienty is surprisingly important.  
**virtual runtime** 随着process run， vruntime会增长，CFS寻找最小的vruntime执行。lottery scheduling      
**sched_latency** 决定着在考虑switch前进程会运行多长时间，dynamic。除以运行的进程数。stride scheduling    
**min_granularity** 当进程特别多，每个time-slice就很小，可能会频繁切换context，引入这个参数。  
**nice** 权重，-20～19，负值意味着更高的priority。权重除总权重数，乘以sched_latency是time-slice， virtual runtime 的增量则反比于权重。

CFS用红黑树来keeping process。只记录running和runnable的process。orderd by virtual runtime.  
从block醒来的process，CFS降其vruntime 设置为tree中的最小vruntime.

还有很多很多特性。