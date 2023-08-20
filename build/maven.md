



# cheatsheet

```bash
mvn compile                       # compile only
mvn package                       # package (eg. into jar)
mvn clean                         # clean
mvn clean package                 # clean and package
```



# folder structure

```bash
./pom.xml                         # maven build file
./src/main/java/                  # java source 
./target                          # build target
```





# pom.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>kafka.poc</groupId>
    <artifactId>jms-client</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>jar</packaging>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <maven.compiler.source>1.8</maven.compiler.source>
        <maven.compiler.target>1.8</maven.compiler.target>
    </properties>

    <dependencies>
        <dependency>
            <groupId>io.confluent</groupId>
            <artifactId>kafka-jms-client</artifactId>
            <version>7.4.0</version>
        </dependency>
        <dependency>
            <groupId>org.apache.geronimo.specs</groupId>
            <artifactId>geronimo-jms_1.1_spec</artifactId>
            <version>1.1</version>
        </dependency>
    </dependencies>

</project>
```



## uber-jar  / fat-jar / shaded jar

```xml
<project>
...
<build>
  <plugins>
    <plugin>
      <groupId>org.apache.maven.plugins</groupId>
      <artifactId>maven-shade-plugin</artifactId>
      <version>3.2.4</version> <!-- replace with the version you want -->
      <executions>
        <execution>
          <phase>package</phase>
          <goals>
            <goal>shade</goal>
          </goals>
          <configuration>
            <transformers>
              <transformer implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                <mainClass>change.this.to.your.MainClass</mainClass>
              </transformer>
            </transformers>
          </configuration>
        </execution>
      </executions>
    </plugin>
  </plugins>
</build>
...
</project>
```







init

```bash
mvn archetype:generate 
	-DgroupId=<group>
	-DartifactId=<artifact>
	-DarchetypeArtifactId=maven-archetype-quickstart
	-DinteractiveMode=false
```

