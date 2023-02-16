# Variables

## Scopes

- **Global** - available throughout a workspace
- **Collection** - available throughout the requests in a collection and do not change based on the selected environment
- **Environment** - variables w/ different value per environment. eg. testing vs. production
- **Local** - temporary, and only accessible in your request scripts
- **Data** - come from external CSV and JSON files to define data sets you can use when running collections via Newman or the Collection Runner

In case name defined in multiple scopes, Narrowest scope wins (Local > Data > Env > Collection > Global)

# Scripts

## Variables

```javascript
# Environment
pm.environment.set("variable_key", "variable_value");
pm.environment.get("variable_key");       
pm.environment.unset("variable_key");

# Global
pm.globals.set("variable_key", "variable_value");
pm.globals.get("variable_key");             
pm.globals.unset("variable_key");

# Normal Variables
pm.variables.get("variable_key");

# Collection
pm.collectionVariables.set("variable_key", "variable_value");
pm.collectionVariables.get("variable_key");
pm.collectionVariables.unset("variable_key");
```



## Requests

```javascript
# Send request
pm.sendRequest("https://postman-echo.com/get", function (err, response) {
    console.log(response.json());
});
```

## Assertions

```javascript
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

# Response body contains string
pm.test("Body matches string", function () {
    pm.expect(pm.response.text()).to.include("string_you_want_to_search");
});

# JSON value check
pm.test("Your test name", function () {
    var jsonData = pm.response.json();
    pm.expect(jsonData.value).to.eql(100);
});

# Response body exact match
pm.test("Body is correct", function () {
    pm.response.to.have.body("response_body_string");
});

# Response header check
pm.test("Content-Type is present", function () {
    pm.response.to.have.header("Content-Type");
});

# Response time
pm.test("Response time is less than 200ms", function () {
    pm.expect(pm.response.responseTime).to.be.below(200);
});

# HTTP Status Code(s)
pm.test("Successful POST request", function () {
    pm.expect(pm.response.code).to.be.oneOf([201, 202]);
});

# HTTP Status Message
pm.test("Status code name has string", function () {
    pm.response.to.have.status("Created");
});

# XML to JSON
var jsonObject = xml2Json(responseBody);
var schema = {
    "items": {
        "type": "boolean"
    }
};

# JSON Data Validator
var data1 = [true, false];
var data2 = [true, 123];
pm.test('Schema is valid', function () {
    pm.expect(tv4.validate(data1, schema)).to.be.true;
    pm.expect(tv4.validate(data2, schema)).to.be.true;
});
```



## Pre-request Scripts

# 

## Test Scripts



# Sharing Code/Functions

First request in the collection:

```javascript
// Save common tests in a global variable
postman.setGlobalVariable("commonTests", () => {
    // The Content-Type must be JSON
    tests["Content-Type header is set"] = postman.getResponseHeader("Content-Type") === "application/json";

    // The response time must be less than 500 milliseconds
    tests["Response time is acceptable"] = responseTime < 500;

    // The response body must include an "id" property
    var data = JSON.parse(responseBody);
    tests["Response has an ID"] = data.id !== undefined;
});
```

Other requests in the collection:

```javascript
// run common tests
eval(globals.commonTests)();

// then run specific tests
// ...
```

