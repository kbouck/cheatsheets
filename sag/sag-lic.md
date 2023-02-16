


classes of interest
```bash
com.softwareag.common.lic.SagLic;

com.wm.app.b2b.server.lic.LicUtil;
- public bool isExpirationDateUnlimited(componentName)
- public bool LICcheckExpiration(componentName)
- public bool LICcheckSignature()

LicUtil.getData(this.isCompInfo, "Clustering")))



com.wm.app.b2b.server.lic.ISComponentInfo;
- public bool isExpiryUnlimited()
- public bool isExpired()




============
com.wm.app.b2b.server.Server is class where the main orchestrating logic is

com.wm.app.b2b.server.Server.updateKey()
...
    KeyInfo.setKeyInfo(keyFile);    // com.wm.app.b2b.server.lic.KeyInfo
    checkKey(false);
    
    
com.wm.app.b2b.server.Server.checkKey() 
- schedules shutdown under several conditions



```







```bash
scenario 1
- custom_wrapper -javaagent
- classpath: no jar
- result:
  - works for org.eclipse.equinox.launcher.Main
  - but, fails with java.lang.ClassNotFoundException: org.jboss.byteman.rule.exception.EarlyReturnException
    at java.base/java.net.URLClassLoader.findClass(URLClassLoader.java:471)



scenario 2
- custom_wrapper: -javaagent
- classpath: jar in prepend
- result:
  - works for org.eclipse.equinox.launcher.Main
  - avoids classnotfoundexception
  - does not work for Server.class rule :-/   try import ?
  
  








```

