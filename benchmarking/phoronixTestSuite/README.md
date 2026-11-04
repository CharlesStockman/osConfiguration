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

