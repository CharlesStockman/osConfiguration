# Use Case To Describe the Problem

|Component|Description|
|---------------|---------------------------------------------------------------------|
|Actor          |The Computer which must have the AMD Chipsset for Graphics           |
|Flow           |Path 1 : The computer is able to run CUDA Applications               |
|               |Path 2 : The computer can compile the CUDA Language                  |
|Pre-Conditions |The Actor ( Computer ) must have and AMD Chip                        |
|Post-Condition |The Actor ( Computer ) can comile and run applicsations needing CUDA |

# Assumptions 
&emsp;- All work will be using AMD Graphics<br/>
&emsp;- Installation and Testing should be made as portable as possible.<br/>

# High Level Deisgin

## List of Questions to be anwered.
&emsp;- Install FreeBSD with a Window Manager, Development Tools and AMD Graphic Drivers at a mininium<br/>
&emsp;- Install RocM for Hip ( helps to understand AMD's CUDA )<br/>
&emsp;- Find a Test Suite and understnad how much of the CUDA Language it understands<br/>
&emap;- Find a collection of CUDA Executables to Test<br/>
&emsp;- Unserstand KLUDA and HIP.  Do they different probglems or the same problem.  KLUDA is for binaries and HIP is to compile<br/>
&emsp;- Crete an install script and test script for the solution<br/>

## Solution
