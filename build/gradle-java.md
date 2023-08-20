

# java plugin

adds tasks:

- compileJava
- compileTestJava
- jar
- javadoc
- ... and more

```groovy
plugins {
  id 'java'
}
```



# repos

```groovy
repositories {
    mavenCentral() 
}
```



# dependencies

```groovy
dependencies {
    testImplementation 'org.junit.jupiter:junit-jupiter:5.9.2'
    testRuntimeOnly 'org.junit.platform:junit-platform-launcher'
    implementation 'com.google.guava:guava:31.1-jre' 
  
    // local file
    implementation files('libs/something_local.jar')
}
```



# target build version

```groovy
version = '0.0.1-SNAPSHOT'
```



# java version compatibility

```groovy
// at top level
sourceCompatibility = 1.8
targetCompatibility = 1.8
```



# jar

```groovy
mainClassName = 'hello.HelloWorld'

jar {
    archiveBaseName = 'gs-gradle'
    archiveVersion =  '0.1.0'
}
```



