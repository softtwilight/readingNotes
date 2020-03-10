## Sementation
简单的base + bounds，会造成分配的空间中有很大的一部分没有被使用。比如一个要求32位地址空间的程序，需要的内存是4g，可是实际上其使用的可能是几mb。

为了解决这个问题，提出了segmentation。
process有三个部分会分配内存，Code，Stack， Heap，不再是作为一个整体去分配，只有一个base+bounds，而是三个部分都有各自的base+bounds。

计算直接地址，通过虚拟地址前两位，决定属于哪一个segment（只有3个segment，2bit是足够的），通过segment，映射到一个base 和 bounds， 然后后面的位是相对地址，如果小于等于bounds，就让相对位置 + base。

地址空间变为原来的1/4了。

```c
// get top 2 bits of 14-bit VA
Segment = (VirtualAddress & SEG_MASK) >> SEG_SHIFT // now get offset
Offset = VirtualAddress & OFFSET_MASK
if (Offset >= Bounds[Segment])
RaiseException(PROTECTION_FAULT) else
PhysAddr = Base[Segment] + Offset Register = AccessMemory(PhysAddr)

```

stack的时候，内存是像上分配的，grow negative， base - 相对位置。

内存上很多碎片，external fragmentation.    

## Free-Space Management.  

将内存分为固定大小的segment。  
分为可变大小的segment。  