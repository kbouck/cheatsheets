

# wrapper

```bash
$ gradle wrapper --gradle-version 6.0.1

# creates
└── gradlew
└── gradlew.bat
└── gradle
    └── wrapper
        └── gradle-wrapper.jar
        └── gradle-wrapper.properties
```



# common commands

```bash
./gradlew init ...               # create project files
./gradlew build                  # 
./gradlew test                   # execute tests
```

# 



# init

```bash
# interactive
gradle init

# choices:
# - project type (basic, app, library, gradle plugin)
# - build script dsl language (groovy, kotlin)
# - project name (default: current dicatr name)


# non-interactive
gradle init \ 
    --type basic                        # creates only gradle files, no src|test dirs, no build file contents
    --type java-application             # creates app/src/..., app/test/... 
    --type java-library                 # creates lib/src/..., lib/test/...
    
    --dsl groovy
    --dsl kotlin
    
    --test-framework junit             # JUnit 4
    --test-framework junit-jupiter     # JUnit 5 (Jupiter)
    --test-framework testng            # TestNG
    --test-framework spock             # Spock
    
    --project-name <name>              # Project name (default: current dir)
    --package <pkg>                    # Java package prefix (eg. com.one.two.three)


gradle init --type basic --dsl groovy --project-name $(basename $(pwd))
gradle init --type java-application --dsl groovy --project-name $(basename $(pwd)) --package "com.a.b.c" --test-framework junit
gradle init --type java-libary --dsl groovy --project-name $(basename $(pwd)) --package "com.a.b.c" --test-framework junit




# creates:
├── gradle 
│   └── wrapper
│       ├── gradle-wrapper.jar
│       └── gradle-wrapper.properties
│
├── gradlew 
├── gradlew.bat 
├── settings.gradle 
├── app                                     # --type java-application
    ├── build.gradle 
    └── src
        ├── main
        │   └── java 
        │       └── demo
        │           └── App.java
        └── test
            └── java 
                └── demo
                    └── AppTest.java
                    
                    
├── lib
│   ├── build.gradle 
│   └── src
│    
├── plugin 
    ├── build.gradle 
    └── src


```



# plugins

```groovy
plugins {
  
    id 'java' // tasks like testImplementation

    // Apply the groovy plugin to also add support for Groovy (needed for Spock)
    // id 'groovy'

    // application plugin to add support for building a CLI application in Java.
    // id 'application'
  
    // Apply the Java Gradle plugin development plugin to add support for developing Gradle plugins
    //  id 'java-gradle-plugin'
}
```



# repositories

```groovy
repositories {
    // Use Maven Central for resolving dependencies.
    // mavenCentral()
}
```



# dependencies

- implementation: Required dependencies for compiling the project code, but that will be provided at runtime by a container running the code (for example, the Java Servlet API).
- testImplementation: Dependencies used for compiling and running tests, but not required for building or running the project’s runtime code.



```groovy
dependencies {
  
    // testImplementation
    // ==================
    // Dependencies used for compiling and running tests, but not required for building or running the project’s runtime code
  
  
    // JUnit Jupiter
    // -------------
    // testImplementation 'org.junit.jupiter:junit-jupiter:5.7.2'     # JUnit Jupiter

    // JUnit 4
    // -------
    // testImplementation 'junit:junit:4.13.2'                        # JUnit 4

    // Spock
    // -----
    // Use the latest Groovy version for Spock testing
    // testImplementation 'org.codehaus.groovy:groovy:3.0.8'
    // Use the awesome Spock testing and specification framework even with Java
    // testImplementation 'org.spockframework:spock-core:2.0-groovy-3.0'
    // testImplementation 'junit:junit:4.13.2'

    // TestNG
    // ------
    // Use TestNG framework
    // NOTE! also must call test.useTestNG() in tasks.named('test') -- see section 'test'
    // testImplementation 'org.testng:testng:7.4.0'    

    // Rest Assured
    // ------------
    // testImplementation 'io.rest-assured:rest-assured:4.5.1'
  

    // Implementation
    // ==============
    // Required dependencies for compiling the project code, but that will be provided at 
    // runtime by a container running the code
    
    // This dependency is used internally, and not exposed to consumers on their own compile classpath.
    implementation 'com.google.guava:guava:30.1.1-jre'
  
  
    // Other common libraries
  
    // Joda Time
    // implementation "joda-time:joda-time:2.2"
  
    // Local depdendencies
    // 
}
```





# sourceSets

```groovy
// TODO - are these needed?  defaults?

sourceSets {
    main {
        java {
            srcDirs = ['src/java']
        }
    }
    test {
        java {
            srcDirs = ['test/java']
        }
    }
}
```





# build

```bash
$ gradlew build
```

```bash
# creates
build
├── classes
│   └── main
│       └── hello
│           ├── Greeter.class
│           └── HelloWorld.class
├── dependency-cache
├── libs
│   └── gs-gradle-0.1.0.jar
└── tmp
    └── jar
        └── MANIFEST.MF
```

# test

```bash
$ gradlew test
```

```groovy
// NOTE! Requires certain dependencies. See section 'dependencies'

tasks.named('test') {
    // JUnit 4 / JUnit Jupiter / Spock
    // ===============================
    // useJUnitPlatform()
    
    // TestNG
    // ======
    // useTestNG()
}
```





# file structure

```bash
build.gradle           # Main build file
gradlew                # gradle wrapper 
gradlew.bat            # 
settings.gradle        # 
.gitignore             # Ignore .gradle/ build/

# Gradle wrapper
gradle/                
└── wrapper/                
    └── wrapper/

# Gradle internal / bookkeeping
.gradle/               
├── 7.2/                
│   ├── executionHistory/
│   ├── fileChanges/
│   ├── dependencies-accessors/
│   ├── fileHashes/
│   └── dependencies-accessors/
│   
└── checksums/


# Source Files
src/                   
└── main/                # Source Base
    ├── groovy/
    └── java/
    
# Test Files
src/                     
└── test/                # Test Base
    ├── groovy/
    └── java/


# Build Output Files
build/                   # base dir
├── distributions/
├── tmp/                 # temp for jar creation, manifest.mf, etc.
├── scripts/
├── libs/
├── classes/
└── generated/


```



  

# jar

## library

- just an archive of compiled classes

```groovy

```

## executable jar

- dependencies not included

```groovy
jar {
    manifest {
        attributes(
            'Main-Class': 'com.foo.bar.MainClass'
        )
    }
}
```

## executable super-jar

- dependencies included

```groovy
jar {
    manifest {
        attributes(
            'Main-Class': 'com.foo.bar.MainClass'
        )
    }
    from {
        configurations.runtimeClasspath.collect { it.isDirectory() ? it : zipTree(it) }
    }
 }
```



```groovy
// for references -- need to 
// todo - need more stuff here - also how to package jar into java portable executable

sourceCompatibility = 1.8
targetCompatibility = 1.8

apply plugin: 'application'
mainClassName = 'hello.HelloWorld'

jar {
    archiveBaseName = 'gs-gradle'
    archiveVersion =  '0.1.0'
}

```

