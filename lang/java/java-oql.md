


OQL Notes

# generate heap dump
TODO: Java Options

```bash
jmap -dump:file=format=b,D:\tmp\baseline.bin <pid>
(note: must have access to process, so must be process owner or an admin on windows)
```




# wm classes
```bash
# Classes of Interest
com.wm.app.b2b.server.InvokeState
com.wm.data.ISMemDataImpl
java.util.concurrent.ConcurrentHashMap$HashEntry
com.wm.app.b2b.server.FlowSvcImpl
  .pkg
    .name
  .nsName
    .fullName

net.sf.ehcache.Cache
  .key
  .value

net.sf.ehcache.CacheManager
  .runtimeCfg
    .cacheManagerName

com.wm.pkg.art.ns.AdapterServiceNode
```



# adapter svcs

```sql

SELECT 
  toString(node.pkg.name), 
  toString(node.nsName.fullName),
  node.@retainedHeapSize AS "Heap Size" 
FROM com.wm.pkg.art.ns.AdapterServiceNode node 

-- Class Loaders
SELECT *
FROM java.net.URLClassLoader cl
Cache Sizes
SELECT 
    toString(c.cacheManager.runtimeCfg.cacheManagerName) AS CacheManager,
    toString(c.configuration.name) AS Cache,
    c.@retainedHeapSize AS HeapSize
FROM net.sf.ehcache.Cache c
```





# flow definitions

```sql
SELECT 
    toString(f.pkg.name) AS Package, 
    toString(f.nsName.fullName) AS Service, 
    f.@retainedHeapSize AS "Heap Size" 
FROM 
    com.wm.app.b2b.server.FlowSvcImpl f 
```





# package sizes

```sql
SELECT toString(p.gName.value), @retainedHeapSize 
FROM com.wm.app.b2b.server.Package p 
```



# TN query results cache

```sql
SELECT 
    toString(e.key), 
    e.value.@size,
    e.elementEvictionData.creationTime, 
    e.elementEvictionData.lastAccessTime, 
    e.@retainedHeapSize 
FROM net.sf.ehcache.Element e 
WHERE 
    (toString(e.key) LIKE "TNPortalQueryResults.*")
```

# running services
```sql
SELECT 
    toString(st.name) AS "Thread Name", 
    toString(st.tid) AS "Thread ID", 
    toString(st.state.callStack.elementData[0].pkg.name) AS Package, 
    toString(st.state.callStack.elementData[0].nsName.fullName) AS TopLevelSvc, 
    toString(st.state.callStack.elementData[(st.state.callStack.elementData.getLength() - 1)].nsName.fullName) AS CurrSvc
    st.@retainedHeapSize AS HeapSize FROM com.wm.app.b2b.server.ServerThread st 
WHERE (st.state.callStack.elementData[0] != null)
```


Note:Transformation services (must fiddle with last element index to get it right

```sql
SELECT toString(st.name) AS "Thread Name", toString(st.tid) AS "Thread ID", toString(st.state.callStack.elementData[6].pkg.name) AS Package, toString(st.state.callStack.elementData[6].nsName.fullName) AS TransformSvc, toString(st.state.callStack.elementData[8].nsName.fullName) AS CurrSvc, st.@retainedHeapSize AS HeapSize FROM com.wm.app.b2b.server.ServerThread st WHERE (st.state.callStack.elementData[0] != null)

Byte Arrays
select * from byte[]
where @retainedHeapSize > 1000000
```



# fix

```
com.softwareag.estd.fix.format.TagManager
```



