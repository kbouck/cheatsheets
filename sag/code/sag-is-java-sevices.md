



# invoke 

## Service.doInvoke

```java
import com.wm.lang.ns.NSName;

Service.doInvoke(NSName.create("service"), (new IDataMap() {{     
    put("dateString", minDate); 
}}).getIData());
```



## inline pipeline

```java
invoke("an.dashboard.internal.utils.date.dateStringToISO8601", new IDataMap() {{     
    put("dateString", minDate); 
}}); // requires invoke helper

```

## helpers

```java
	public static IData invoke(String serviceName, IDataMap pipeMap) throws ServiceException {
		  return invoke(serviceName, pipeMap.getIData());
	}
	
	public static IData invoke(String serviceName, IData pipeline) throws ServiceException {
		  NSName service = NSName.create(serviceName);
		  try {
			    IData output = Service.doInvoke(service, pipeline);
			    return output;
		  } catch (Exception e) {
			    if (e instanceof ServiceException) {
		  	      throw (ServiceException)e;
		      } else {
		    	    throw new ServiceException(e);
		      }
		  }
	}
```





# IData 

## put

```java
import java.util.Map;
import java.lang.reflect.Constructor;

	public static IDataMap putToIData(IDataMap idataMap, String path, Object value) {
		  putToIData(idataMap.getIData(), path, value);
      return idataMap;
	}
	
	public static IData putToIData(IData idata, String path, Object value) {
	
	    // Trim leading and trailing /'s from path
	    path = path.replaceAll("^/+", "").replaceAll("/+$", "");
	
      // Split path string into array of path nodes
	    String[] pathNodes = path.split("/");
	    Map currentMap = new IDataMap(idata);
	
	    // Drill-down into second-to-last path node
	    for (int i = 0; i <= pathNodes.length-2; i++) {
	
	        // If a map already exists at this path node, then we use it
	        if (currentMap.get(pathNodes[i]) instanceof IData) {
	            currentMap = new IDataMap((IData)currentMap.get(pathNodes[i]));
	
	        // Otherwise create/override this path node with a newly created IData
	        } else {      
	            IData newIData = IDataFactory.create();
	            currentMap.put(pathNodes[i], newIData);
	            currentMap = new IDataMap(newIData);
	        }
	    }
	
	    // Put value into location referenced by last path node
	    currentMap.put(pathNodes[pathNodes.length-1], value);
      return currentMap.getIData();
	}
```


## get

```java
// TODO - add optional param to return a default value instead of null

import java.util.Map;

	public static Object getFromIData(IDataMap idataMap, String path) {
		  return getFromIData(idataMap.getIData(), path);
	}
	
	public static Object getFromIData(IData idata, String path) {
	
	    // Trim leading and trailing /'s from path
	    path = path.replaceAll("^/+", "").replaceAll("/+$", ""); 
	
      // Split path string into array of path nodes
	    String[] pathNodes = path.split("/");
	    IDataMap currentMap = new IDataMap(idata);
	
	    // Drill-down into second-to-last path node
	    for (int i = 0; i <= pathNodes.length-2; i++) {
	        if (currentMap.get(pathNodes[i]) instanceof IData) {
	          currentMap = new IDataMap((IData)currentMap.get(pathNodes[i]));
	        } else {
	            return null;
	        }
	    }
	
	    // Return value referenced by the the last path node
	    return currentMap.get(pathNodes[pathNodes.length-1]);
	}
```

## delete

```java

	public static Object deleteFromIData(IDataMap idataMap, String path) {
	    return deleteFromIData(idataMap.getIData(), path);
	};
	
	// Same functionality as getFromIData, but deletes entry before returning value
  // TODO - consider merging with getFromIData
	public static Object deleteFromIData(IData idata, String path) {
		
	    // Trim leading and trailing /'s from path
	    path = path.replaceAll("^/+", "").replaceAll("/+$", ""); 
	
	    String[] pathNodes = path.split("/");
	    IDataMap currentMap = new IDataMap(idata);
	
	    // Drill down into second-to-last path node
	    for (int i = 0; i <= pathNodes.length-2; i++) {
	        if (currentMap.get(pathNodes[i]) instanceof IData) {
	          currentMap = new IDataMap((IData)currentMap.get(pathNodes[i]));
	        } else {
	            return null;
	        }
	    }
	
	    // Return the value at the last node
	    Object value = currentMap.remove(pathNodes[pathNodes.length-1]);
	    return value;
	}
```

