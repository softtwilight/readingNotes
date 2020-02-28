#### Scheduling
> How should we develop a basic framework for thinking about
scheduling policies? What are the key assumptions? What metrics are important? What basic approaches have been used in the earliest of computer systems?

##### First In, First Out
简单，易实现，公平，但是如果前面的任务耗时，会影响完全任务的平均耗时(任务完成的时间-任务提交的时间)

##### Shortest Job First
耗时少的先执行，performance更好，非打断，如果一个先来的任务耗时很长，后来的耗时很短。

##### Shortest Time-to-Completion First
先执行剩余任务中最先完成的。  
但是实际上OS很少能知道任务什么时候执行完。

response time, `Tresponse = Tfirstrun − Tarrival`  
turnaround time,`Tturnaround = Tcompletion − Tarrival`  
前面的策略的响应时间都很差

##### Round Robin
不再是执行任务直到结束，而是以时间片执行任务。  
the length of a time slice must be a multiple of the timer-interrupt period;  
time-slice 越短，响应时间越短，但是context切换占用time-slice的比例也会越高，影响performance.  
When programs run, they build up a great deal of state in CPU caches, TLBs, branch predictors, and other on-chip hardware. 这些都会让switch job变得expensive。
但是Round Robin是让`Round Robin`最差的策略之一。

##### Incorporating I/O
当又IO操作的时候，可以把时间片让给CPU消耗的任务