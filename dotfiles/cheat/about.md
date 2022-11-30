Opened 2022-01-22


# INTRO
            
            Computer concepts in plain English

This is a cheat for things about computers that I want to keep
Mainly it is simple high-level concepts that are sometimes missed in the thicket of programming

# What is a Virtual Machine
A VM is an isolated Operating System hosted on a base OS
eg You could run Ubuntu on Manjaro in a VM


# Hypervisor
A hypervisor is a piece of software that allows you to run VMs
Examples of Hypervisors are: VirtualBox, VMWare, QEMU, KVM 

# ISO
Is a disk image often used to create boot media to allow the installation of an OS on your system


# ORM - Object-Relational Mapping
Without an ORM, running a query would be in a different programming language (ie SQL) to the surrounding code
The abstraction provided by say Django's ORM lets you forget about all those details, allowing you to focus on the business logic.

# SPA single page applications (SPAs). 
A SPA is loaded only once and afterwards, everything is updated dynamically using Javascript. An example of a SPA application is Gmail.

# Serverless
Serverless doesn’t mean that there’s no server. It only means that you’re utilizing someone else’s server.

# AWS Services
https://expeditedsecurity.com/aws-in-plain-english/

# Porcelain
User-friendly interface for an application e.g. Magit in Emacs is a git porcelain (probably the best)

# An expression (in contrast to a statement)
Expres­sions are things that are eval­u­ated to produce a value 
State­ments are things that denote an action
For instance, in Python, x = 42 is a state­ment, and x + 42 is an expres­sion.

# The browser
A browser is a universal Virtual Machine which just only takes JS and WASM at the moment (2022).

# Fiber
Fiber or direct Ethernet connections means that the transmitted data remains digital and is passed directly to the next network node for processing
unlike in normal transmission where the data is sent to a modem to change into analogue so as to transmit it over wire or wireless. Hence fiber is
much faster and more reliable.

# BiBTeX
The LaTeX implementation of a bibliography manager 

# Side-effects
Side-effects are the changes that a function makes to its implicit context. If a function saves or deletes data in a global variable or in the persistence layer, it is said to have a side-effect.

# Serverless
Serverless is a cloud-native development model that allows developers to build and run applications without having to manage servers. There are still servers in serverless, but they are abstracted away from app development. A cloud provider handles the routine work of provisioning, maintaining, and scaling the server infrastructure.

# TUI vs CLI
CLI - Command Line Interface means you are using a shell e.g. bash, zsh, fish etc.
TUI - Terminal User Interface means you opened an application in the terminal and are typing in the terminal e.g. vim, nano, emacs, ranger, htop, glances

# Expression (vs statement)
an expression means that every directive returns some kind of data.

# Functional language
It is a declarative programming paradigm, which means programming is done with expressions or declarations instead of statements.

# X11 (Linux)
X11 is a distributed systems communication protocol which happens to have graphical output as a side effect

# reverse proxy (networking)
It means a computer that is connected directly to the internet. A confusing term.

# Virtual Network Computing (VNC) 
a useful way to connect to a remote desktop when you need a graphical user interface (GUI) to accomplish your task.

# currying
In functional languages, functions always take one argument and produce one output; to get more, you can chain multiple functions together, known as "currying". 

# closures
Closures can avoid the use of global values and provides some form of data hiding. It can also provide an object oriented solution to a problem.
The term closure is often used as a synonym for anonymous function. 

# bikeshedding
When organizations spend disproportionate time on trivial issues - in the design of a nuclear plant when 90% of the discussion is around the design of the
bikeshed

# microprocessors v microcontrollers
Microprocessors (µPs) are also referred to as microprocessor units (MPUs). Early MPUs contained only a central processing unit (CPU). Over time, other functions were added like cache memory, floating point units (FPUs), memory management units (MMUs), and so on. The key point is that — other than any cache and things like FPUs and MMUs — a microprocessor doesn’t contain any internal memory or peripherals. 

By comparison, microcontrollers (µCs), which are also referred to as microcontroller units (MCUs), contain non-volatile memory like Flash, volatile memory like SRAM, peripherals like counters, timers, analog-to-digital converters (ADCs), and communications interfaces like UART, I2C, and SPI. Essentially, a microcontroller is a little standalone computer presented on a single silicon chip that contains its own program, which it starts executing as soon as it powers-up. This explains why microcontrollers appear in embedded systems, and why embedded systems appear all over the place.

# Airgap 
refers to a computer (or network) that is physically disconnected from a larger network and the Internet.

# Yggdrasil 
a Mesh Network that is fully Encrypted and provides an IPv6 IP on the network to anyone.
 
# Attention Economy
Profiting from convincing (or, perhaps more accurately, “manipulating”) people to pay attention. 
# Stack and heap

The three types of memory, and when to use them

## Stack
Stack or Automatic storage is where local variables are stored. A new region of automatic storage is created for a function when it is called, and deleted when it returns. Only the return value is kept; it is copied into the automatic storage of the function which called it. This means that it is unsafe to return a pointer to a local variable, because the underlying data will be silently deleted. Automatic storage is often called the stack.

## Heap
Heap or Allocated storage is the result of using malloc(). It survives until it is free()‘d, so can be passed wherever, including upwards to calling functions. It is often called the heap.

## (other)
Static storage is valid for the lifetime of the program. It is allocated when the process starts. Global variables are stored here.


