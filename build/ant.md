# ant-contrib

```xml
<taskdef resource="net/sf/antcontrib/antcontrib.properties">
  <classpath>
    <pathelement location="${ant.contrib}"/>
  </classpath>
</taskdef>
```

# properties
```bash
Environment Variables:
<property environment="env" />
${env.WEBMETHODS_HOME}
```

# property files
```xml
<!-- Replace options in install script -->
<urlencode property="is-licensekey-encoded" value="@{is-licensekey}"/>
<propertyfile file="${temp-install-script}">
  <entry key="imageFile" value="${wm.install.image}"/>
  <entry key="InstallDir" value="@{dir}"/>
  <entry key="IntegrationServerPort" value="__VERSION1__,@{is-port-http}"/>
  <entry key="IntegrationServerLicenseChooser" value="__VERSION1__,${is-licensekey-encoded}"/>
</propertyfile>
```


# paths, patterns, filesets
```xml
<path id="classpath.webMethods.server.jars">
  <fileset dir="${webMethods.home}/IntegrationServer/lib/jars">
    <include name="**/*.jar" />
  </fileset>
</path>

<patternset id="webMethods-package-files-pattern">
  <include name="manifest.*" />
  <include name="pub/**" />
  <include name="templates/**" />
  <include name="code/**" />
  <include name="config/**" />
  <include name="lib/**" />
  <include name="ns/**" />
  <include name="pub/**" />
  <include name="resources/**" />
  <include name="templates/**" />
  <include name="web/**" />
  <exclude name="config/*.properties" />
</patternset>

<fileset id="webMethods-package-files" dir="${webMethods.package.dir}">
  <patternset refid="webMethods-package-files-pattern" />
  <exclude name="resources/test/**" />
</fileset>
```


# local variables

```xml
<local name=”propname” />
```


# import tasks
```
Import: 
<import file="wm-tasks.xml" />
```


# regular expressions

```xml
<replaceregexp match="(enabled..)yes" replace="\1no" >
  <fileset dir="/tmp/is" >
    <include name="**/manifest.v3" />
    <exclude name="WmRoot/manifest.v3" />
    <exclude name="WmPublic/manifest.v3" />
    <exclude name="Default/manifest.v3" />
  </fileset>
</replaceregexp>
```


# javascript

```javascript
project.setProperty(‘property’);
project.getProperty(‘property’);

<script language="javascript">
<![CDATA[
  var versionStr = project.getProperty('ant.version');
  var spaceSplitArray = versionStr.split(" ");
  var version = spaceSplitArray[3];
  var versionSplitArray = version.split("");
  if (parseInt(versionSplitArray[1]) > 1) {
    project.setProperty('antVersionCompatible', 'true');
  } else {
    if(parseInt(versionSplitArray[1]) == 1) {
      if(parseInt(versionSplitArray[3]) >= 8) {
        project.setProperty('antVersionCompatible', 'true');
      } else {
        project.setProperty('antVersionCompatible', 'false');
      }
    } else {
      project.setProperty('antVersionCompatible', 'false');
    }
  }
]]>
</script>
```

To get the value of a macro attribute (use quotes):
var srcProp = "@{src-prop}";
				
To resolve a macro attribute to a property value (don’t use quotes)
var wsd = @{src-prop};


# macros
```xml
<macrodef name="start">
    <attribute name="dir"         default="${sag.default.dir}" />
    <attribute name="type"        default="IS" />
    <attribute name="maxwait"     default="${sag.default.is.startmaxwait}" />
    <attribute name="maxwaitunit" default="${sag.default.is.startmaxwaitunit}"/>

    <sequential>
      <local name="port-accessible"/>
      <local name="lockfile-exists"/>
    </sequential>
 </macrodef>
```

