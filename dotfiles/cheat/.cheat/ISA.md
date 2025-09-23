# FRONTMATTER
Opened 2025-07-23
Filepath  /home/donagh/PORTABLE_ENV/dotfiles/cheat/.cheat/arch_comps


# ISA Architecture for Computers
# =============================================================================================================

From [Architectures](https://wiki.gentoo.org/wiki/Handbook:Main_Page)


An instruction set architecture -- ISA (Wikipedia) or architecture for short is a family of CPUs (processors) who support the same instructions. 
The two most prominent architectures in the desktop world are the x86 architecture and the x86_64 architecture — for which Gentoo uses the amd64 notation. But many other architectures exist, such as sparc, ppc the (PowerPC) family, mips, arm, etc...

Most people that do not know the architecture of their PC system are likely interested in amd64.

Be sure to verify the CPU's architecture before installing an OS.


## Note

The arm and arm64 architectures are supported by the Gentoo project but do not yet have Handbooks at their disposal due to too many variations in SoCs. It is simply not practical for the Handbook project to maintain a cohesive set of installation instructions. Please refer to the ARM or ARM64 project pages and bug #534376 for more information.

Equally, the riscv architecture is supported, however there is no separate Handbook for it (yet). More information can be found on the RISC-V project page.

## Tip

A rule of thumb for new users: If the CPU was manufactured after 2015 and the manufacturer is either Intel or AMD, choosing the AMD64 Handbook is probably the correct route.


## Alpha 

The Alpha architecture is a 64-bit architecture developed by Digital Equipment Corporation (DEC). It is still in use by some mid-range and high-end servers, but the architecture is slowly being phased out. Variants include: ES40, AlphaPC, UP1000, and Noname.


## AMD64 (aka x86_64)

AMD64 is a 64-bit architecture that is compatible with the x86 architecture (and thus also known as x86_64). It was first used by AMD (under the AMD64 name) and Intel (under the EM64T name) and is now the most prominent architecture for medium and high-end desktop PCs. It is also commonly found in the server segment. Variants include: AMD Athlon 64, Opteron, Sempron, Phenom, FX, Ryzen, Threadripper, and Epyc along with Intel Pentium 4, Core2, Core i3, i5, i7, i9, Xeon, and some Atoms.


## ARM  /  Aarch

ARM is a 32-bit architecture that is very popular in embedded and small systems. Sub-architectures range from ARMv2 to ARMv6 (legacy), to ARMv6-M (Cortex), as well as ARMv8-R and ARMv8-M and are often found in smart phones, tablets, hand-held consoles, end-user GPS navigation systems, etc. Variants include: StrongARM and Cortex-M.


## ARM64  /  Aarch

ARM64 is a 64-bit variant of ARM for embedded and server systems. The primary sub-architecture referred to as AArch64 (also known as ARMv8-A) is produced by a few manufacturers. AArch64 chips are seen in a variety of SoCs including developer boards, smart phones, tablets, smart TVs, etc. Variants include: ARM Holdings' Cortex-A53, A57, A72, A73, and Qualcomm's Kryo and Falkor.


## HPPA 

Referred to as HPPA, the PA-RISC architecture is an instruction set developed by Hewlett-Packard and was used in their mid- and high-end server series until about 2008 (after which HP started using Intel Itanium). Variants include: HP 9000 and PA-8600.


## IA64 

IA64 is a 64-bit architecture designed by Intel and used in their Intel Itanium processor series. This architecture is not compatible with x86 or x86_64 (a.k.a. amd64) and is mostly found in medium and high-end server series. Variants include: Intel Itanium.


## MIPS 

Developed by MIPS Technologies, the MIPS architecture comprises multiple subfamilies (called revisions) such as MIPS I, MIPS III, MIPS32, MIPS64 and more. MIPS is most common in embedded systems. Variants include: MIPS32 1074K and R16000.

## PPC 

PPC is a 32-bit architecture used by many Apple, IBM, and Motorola processors. They are most commonly found in embedded systems. Variants include: Apple OldWorld, Apple NewWorld, generi Pegasos, Efika, older IBM iSeries and pSeries. Readers of this handbook may wish to briefly scan the PPC FAQ page before getting started.


## PPC64 Handbook

PPC64 is the 64-bit variant of the PPC architecture, popular in both embedded as well as high-end performance servers. Variants include: IBM RS/6000s, IBM pSeries, and IBM iSeries. Readers of this handbook may wish to briefly scan the PPC FAQ page before getting started.


## RISC-V 

RISC-V is an upcoming 32-bit, 64-bit, and 128-bit architecture with an open instruction set. Currently, the 64-bit RISC-V variant is supported by Gentoo.


## SPARC 

The SPARC architecture is best known by its most common producers, Sun Microsystems (now Oracle) and Fujitsu. It is used in server systems although a few workstations exist as well. In Gentoo, only SPARC64-compatible CPUs are supported. Variants include: E3000, Blade 1000, and Ultra 2.


## X86 

X86 is a 32-bit architecture used by CPUs that are often said to be "Intel compatible". It was until recently the most popular architecture for desktop PCs. Gentoo offers builds for i486 (supports all families) and i686 (supports Pentium and higher or compatible). Variants include: i486, i686, AMD Athlon, Intel Core, and some Intel Atoms.




# =============================================================================================================
# FOOTNOTES

