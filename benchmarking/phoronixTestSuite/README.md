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

#### Running Test Without any Parameters

This section will document how the test can be executed without having to fill in any parameters when the test is started.

Command being executed that will expect arguments
```
phoronix-test-suite benchmark pts/c-ray
```
<b>The two input parameters the user must enter are:</b>
<ul>
    <li>Processor Test Configuration</li>
    <li>Would you like to save the test results</li>
</ul>

<b>Command being executed that will expect no arguments</b>

<b>Would you like to save the test results</b>

|Description|Command|
|-----------|-------|
|Set the file name | TEST_RESULTS_NAME="mytest" |

<b>Processor Test Configuration</b>

|Description|Command Argument|
|-----------|-------|
|Change the command from benchmark to default-bench so the defaults are used instead of asking the user | default-benchmark |

<b>Actual Command</b>

```
TEST_RESULTS_NAME="mytest"
phoronix-test-suite default default-benchmark pts/c-ray
```

#### Filenames 

The results are put in the following directory

```
$HOME/.phoronix-test-suite/test-results/$TEST_RESULTS_NAME/test-logs/<hash code>/<results-file>
```
