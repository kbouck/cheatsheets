

# Test Stack
- Gradle: build tool to find and execute test scripts, produce html test reports from junit results
- JUnit: test runner, reports
- REST-assured: JSON/XML requests and concise response path parsing
- Hamcrest: matchers
- Groovy: concise test script, power assertions give verbose assertion output
- Java: verbose but familiar language to author test scripts
- wM client.jar - for when direct client context connections are




# runners
Gradle (w/ 'java' plugin) + JUnit



# requests

WmContext

- com.x.wm.client.connect/invoke/
- import static com.x.wm.client.invoke;
- invoke(..)
- wm client.jar





```java

WmClient
import static com.x.wm.client.*; // WmClient, and invoke()


WmClient.host = ...           // Sets default host. If unset defaults to $WM_HOST environment var or else "localhost"
WmClient.port = ...           // Defaults to $WM_PORT environment var, or "5555" if not set
WmClient.user = ...           // Defaults to $WM_USER environment var, or "Administrator" if not set
WmClient.pass = ...           // Defaults to $WM_PASS environment var, or "manage" if not set
WmClient.reset();             // Reset d
  
IData response = invoke(String service)               // 
IData response = invoke(String service, IData pipeline);
IDataMap response = invokeMap(String service, IDataMap pipelineMap);    

== WmPath
import static com.x.wm.path.*;

getAsString(idata, path[, default]);
getAsObject(idata, path[, default]);
getAsBoolean(idata, path[, default]);
getAsInt(idata, path[, default]);
getAsFloat(idata, path[, default]);
getAsDouble(idata, path[, default]);
getAsStringArray(...)
get(response, "..");
put(...)
del(...)
toJson()
fromJson(String json)
fromJson(File json)  
toMap()
fromMap(Map map)
toPipelineXml();
fromPipelineXml(String xml)
fromPipelineXml(File xml)

== com.x.wm.test.regression.junit
  
runRegressionTest(input, expected);


```



HTTP-based
- rest-assured


# path accessors

IData:

- com.x.wm.idatapath.get/put/delete


JSON:
- JsonPath


XML:
- XmlPath



# assertions / matchers
- JUnit
- REST-assured
- Hamcrest



