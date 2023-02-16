




# gc logging
```bash
-Xloggc:<gc log filename>
-XX:+PrintGCDetails
-XX:+PrintGCTimeStamps
```




# ibm jvm dumps
```
IBM JVM Dumps
All about the -dump option:
http://www-01.ibm.com/support/docview.wss?uid=swg21242497 

List registered dump agents:

java -Xdump:what 
Registered dump agents
----------------------
dumpFn=doSystemDump
events=gpf+abort
filter=
label=C:\sdk\jre\bin\core.%Y%m%d.%H%M%S.%pid.%seq.dmp
range=1..0
priority=999
request=serial
opts=
----------------------

```

# system dump

```bash
# Large. Viewed with jdmpview (jdmpview -core <core-file>)
-Xdump:system:events=vmstop,request=nodumps+exclusive+prepwalk,file=my.dmp
```

# heap dump

```bash
# PHD - portable format, smaller than a system dump - does not contain object values
-Xdump:heap:events=vmstop,opts=PHD+CLASSIC
```

# java dump

```bash
# Threads, classes, heap stats
-Xdump:java:events=load,filter=*String
```

# snap trace

```bash
-Xdump:snap:events=vmstop+vmstart
```





# java memory spaces

| Space                | Settings                                                     | Monitoring                                                   | Details                                                      |
| -------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Java Heap            | -Xms (minimum Heap size)<br />-Xmx (maximum Heap space)<br />Eg: -Xmx1024m | \- GC logging<br />- JMX API<br />- JConsole<br />- Other monitoring tools | Class instances                                              |
| PermGen              | -XX:MaxPermSize (maximum size)-XX:PermSize (minimum size)<br/>Eg:-XX:MaxPermSize=512m | \- GC logging- JMX API- JConsole- Other monitoring tools     | Class objects such as class names and methods., Internal JVM objects and other JIT optimization related data. |
| Native Heap (C-Heap) | Not configurable directly.<br/>For a 32-bit VM, the C-Heap capacity = 4 Gig – Java Heap - PermGen<br/>For a 64-bit VM, the C-Heap capacity = Physical server total RAM & virtual memory – Java Heap - PermGen | \- Total process size<br/>Windows: Proc. Explorer<br /><br />Linux: top, ps, pmapSolaris: top, ps, pmapAIX: svmon | The C-Heap is storing objects such as MMAP file, other JVM and third party native code objects. |
|                      |                                                              |                                                              |                                                              |

