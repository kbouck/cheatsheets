# my take

java rest service test library







# gradle

minimum build.gradle entries

```groovy
plugins {
    id 'java'
}

repositories {
    mavenCentral()
}

dependencies {
    // Rest-Assured
    testImplementation 'io.rest-assured:rest-assured:4.5.1'
    // JUnit test framework
    testImplementation 'junit:junit:4.13.2'
    // This dependency is used by the application.
    implementation 'com.google.guava:guava:30.1.1-jre'
}
```

other possible related dependencies

```groovy
dependencies {
    testImplementation 'io.rest-assured:rest-assured:4.5.1'           // includes JsonPath and XmlPath
    testImplementation 'io.rest-assured:json-path:4.5.1'              // standalone JsonPath (if rest-assured not used)
    testImplementation 'io.rest-assured:xml-path:4.5.1'               // standalone XmlPath (if rest-assured not used)
    testImplementation 'io.rest-assured:json-schema-validator:4.5.1'  // json schema validation
}
```



# test class - java

```java
// place in src/test/java/**/*.java

package OH_Runtime_Receive;

import org.junit.Test;
// import static org.junit.Assert.*;
import static io.restassured.RestAssured.*;
import static io.restassured.matcher.RestAssuredMatchers.*;
import static org.hamcrest.Matchers.*;
import io.restassured.RestAssured;

public class Tests {

    static {
        RestAssured.baseURI = "https://httpbin.org/";
    }

    @Test public void empty_payload_returns_http_500() {

        given().
                //standaloneSetup(new GreetingController()).
                param("name", "Johan").
        when().
                get("http://www.google.com").
        then().
                statusCode(500);
                //body("id", equalTo(1)).
                //body("content", equalTo("Hello, Johan!"));
    }
}
```



# static imports

```java
// static
import static io.restassured.RestAssured.*;   // given(), etc.
import static io.restassured.matcher.RestAssuredMatchers.*;
import static org.hamcrest.Matchers.*;
import static com.akzonobel.onehub.wm.test.todo.*;
  
// non-static  
import io.restassured.RestAssured;
import io.restassured.response.Response;
```

# defaults

```java
// Common defaults
RestAssured.baseURI = "http://myhost.org";
RestAssured.port = 80;
RestAssured.basePath = "/resource";
RestAssured.authentication = basic("username", "password");
RestAssured.rootPath = "x.y.z";

// Other possible defaults
RestAssured.filters(..);               // List of default filters
RestAssured.requestSpecification = ..  // Default request specification
RestAssured.responseSpecification = .. // Default response specification
RestAssured.urlEncodingEnabled = ..    // Specify if Rest Assured should URL encoding the parameters
RestAssured.defaultParser = ..         // Specify a default parser for response bodies if no registered 
                                       //   parser can handle data of the response content-type
RestAssured.registerParser(..)         // Specify a parser for the given content-type
RestAssured.unregisterParser(..)       // Unregister a parser for the given content-type
  
// Reset any of the above back to default
RestAssured.reset();
```

# examples

```java

given().                 // RequestSpecification
    ...
    header(name, value).
    body()               // String, byte[], Object
when().
    ...
    get(<path>).
    post(<path>).
then().                  // ResponseSpecification
    statusCode(200).
    body("<jsonpath-string", equalTo(5)).
    ...

// Body Examples
body(byte[])
body(obj, ContentType.O)

  
// ContentTypes
.header("Content-type", "application/json")
  
// Object Mappers
// - JSON: must have Jackson, Jackson2, Gson or Johnzon in classpath 
// - XML: must have Jakarta EE or JAXB in classpath
// - eg. io.restassured.mapper.ObjectMapperType.GSON
import io.restassured.mapper.ObjectMapperType;
ObjectMapperType.JACKSON_1
ObjectMapperType.JACKSON_2  
ObjectMapperType.GSON  
ObjectMapperType.JAXB
```





# json (jsonpath)



# xml (xmlpath)


```java
String xml = post("/greetXML?firstName=John&lastName=Doe").andReturn().asString();
// Now use XmlPath to get the first and last name
String firstName = from(xml).get("greeting.firstName");
String lastName = from(xml).get("greeting.firstName");

// or a bit more efficiently:
XmlPath xmlPath = new XmlPath(xml).setRoot("greeting");
String firstName = xmlPath.get("firstName");
String lastName = xmlPath.get("lastName");
```





# overriding

```java

// Override given -- is this also possible to do instead by using a request specfication?
public static RequestSpecification given() {
    return RestAssured.given()
        .config(RestAssured.config()
            .objectMapperConfig(new ObjectMapperConfig(ObjectMapperType.GSON)));
}

// Seems this 
RestAssured.config = RestAssuredConfig.config()
    .decoderConfig(new DecoderConfig("UTF-8"))
    .encoderConfig(new EncoderConfig("UTF-8", "UTF-8"))
    .objectMapperConfig(new ObjectMapperConfig(GSON));
```



# reference

- https://github.com/rest-assured/rest-assured/wiki/Usage
