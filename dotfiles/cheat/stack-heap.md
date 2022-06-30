# Stack vs Heap: Know the Difference

ByMatthew Martin	
January 1, 2022

# What is a Stack?

A stack is a special area of computer’s memory which stores temporary variables created by a function. In stack, variables are declared, stored and initialized during runtime.

It is a temporary storage memory. When the computing task is complete, the memory of the variable will be automatically erased. The stack section mostly contains methods, local variable, and reference variables.

In this tutorial, you will learn,

    What is Stack?
    What is Heap?
    Key Differences between Stack and Heap
    Advantages of using Stack
    Advantages of using Heap
    Disadvantages of using Stack
    Disadvantages of using Heap
    When to use the Heap or stack?

# What is Heap?

The heap is a memory used by programming languages to store global variables. By default, all global variable are stored in heap memory space. It supports Dynamic memory allocation.

The heap is not managed automatically for you and is not as tightly managed by the CPU. It is more like a free-floating region of memory.

# KEY DIFFERENCE

    Stack is a linear data structure whereas Heap is a hierarchical data structure.
    Stack memory will never become fragmented whereas Heap memory can become fragmented as blocks of memory are first allocated and then freed.
    Stack accesses local variables only while Heap allows you to access variables globally.
    Stack variables can’t be resized whereas Heap variables can be resized.
    Stack memory is allocated in a contiguous block whereas Heap memory is allocated in any random order.
    Stack doesn’t require to de-allocate variables whereas in Heap de-allocation is needed.
    Stack allocation and deallocation are done by compiler instructions whereas Heap allocation and deallocation is done by the programmer.

# Key Differences between Stack and Heap

Parameter 	Stack 	Heap
Type of data structures 	A stack is a linear data structure. 	Heap is a hierarchical data structure.
Access speed 	High-speed access 	Slower compared to stack
Space management 	Space managed efficiently by OS so memory will never become fragmented. 	Heap Space not used as efficiently. Memory can become fragmented as blocks of memory first allocated and then freed.
Access 	Local variables only 	It allows you to access variables globally.
Limit of space size 	Limit on stack size dependent on OS. 	Does not have a specific limit on memory size.
Resize 	Variables cannot be resized 	Variables can be resized.
Memory Allocation 	Memory is allocated in a contiguous block. 	Memory is allocated in any random order.
Allocation and Deallocation 	Automatically done by compiler instructions. 	It is manually done by the programmer.
Deallocation 	Does not require to de-allocate variables. 	Explicit de-allocation is needed.
Cost 	Less 	More
Implementation 	A stack can be implemented in 3 ways simple array based, using dynamic memory, and Linked list based. 	Heap can be implemented using array and trees.
Main Issue 	Shortage of memory 	Memory fragmentation
Locality of reference 	Automatic compile time instructions. 	Adequate
Flexibility 	Fixed size 	Resizing is possible
Access time 	Faster 	Slower
Advantages of using Stack

# Here, are the pros/benefits of using stack:

    Helps you to manage the data in a Last In First Out(LIFO) method which is not possible with Linked list and array.
    When a function is called the local variables are stored in a stack, and it is automatically destroyed once returned.
    A stack is used when a variable is not used outside that function.
    It allows you to control how memory is allocated and deallocated.
    Stack automatically cleans up the object.
    Not easily corrupted
    Variables cannot be resized.

# Advantages of using Heap

# Pros/benefit of using heap memory are:

    Heap helps you to find the greatest and minimum number
    Garbage collection runs on the heap memory to free the memory used by the object.
    Heap method also used in the Priority Queue.
    It allows you to access variables globally.
    Heap doesn’t have any limit on memory size.

# Disadvantages of using Stack

# Cons/Drawbacks of using Stack memory are:

    Stack memory is very limited.
    Creating too many objects on the stack can increase the risk of stack overflow.
    Random access is not possible.
    Variable storage will be overwritten, which sometimes leads to undefined behavior of the function or program.
    The stack will fall outside of the memory area, which might lead to an abnormal termination.

# Disadvantages of using Heap

# Cons/drawbacks of using Heaps memory are:

    It can provide the maximum memory an OS can provide
    It takes more time to compute.
    Memory management is more complicated in heap memory as it is used globally.
    It takes too much time in execution compared to the stack.

# When to use the Heap or stack?

You should use heap when you require to allocate a large block of memory. For example, you want to create a large size array or big structure to keep that variable around a long time then you should allocate it on the heap.

However, If you are working with relatively small variables that are only required until the function using them is alive. Then you need to use the stack, which is faster and easier.



