# Phoronix Test Suite

This section will describe the design of a tool to do regression performance testing to understand the change to 
the after the system has been modified



## Reasons for choosing Phoronix Test Suite

<ul>
    <li>Comprehensive Benchmarking Platform</li>
    <ul>
        <li>CPU Performance</li>
        <li>Memory Bandwidth</li>
        <li>Disk I/O</li>
        <li>Network Throughput</li>
        <li>GPU Compute</li>
    </ul>
    <li>Runs on a different systems including Linux, Mac, FreeBsd</li>
</ul>

## Architecture Decisions

### Overall Architecture

|Component| Reasons |
|---------|---------|
| Phonix Test Suite | Runs on different computers and covers all the test that I need ( cpu, i/o, gpu )| 
| Mongo DB | The database where results will be stored |

### Commands

#### Informational Commands

|Command|Description|
|-------|-----------|
|phoronix-test-suite system-info | Provides information for Processor, Grpahics, MotherBoard, Membory, Disk and OS ( Inlcuding Security )
|phoronix-test-suite system-sensors | Displays both Supported and Unsupported snesors. |
|phoronix-test-suite list-available-suites| |
|phoronix-test-suite list-available-tests | |
|phoronix-test-suite info pts/hpc| Given a suite from the <b>phoronix-test-suite list-available-suites</b> will provide all the tests for the suite|
|phoronix-test-suite info pts/quantlib| Give a test from the <b>horonix-test-suite list-available-tests</b> will dispaly the descrition, installed/not installed, Dependencies and git history  

