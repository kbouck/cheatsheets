







# Policy Expressions

Policy Expressions use C# 6.0 syntax and have access to a subset of the .NET Framework types. They also have access to an implicit context variable whose members have information about the request and/or the response.

```C#
@(...)   // single-statement expression
@{...}   // multi-statement expression. must end with a return statement

// JSON
// ====
(string)((JObject)context.Variables["someJson"]).ToString()   // JSON to String
JObject.Parse(someJsonString);                                // String to JSON


// context.Request
// ===============

// basic auth
context.Request.Headers.GetValueOrDefault("Authorization").AsBasic().UserId
context.Request.Headers.GetValueOrDefault("Authorization").AsBasic().Password
  
  
// context.Response
// ================
  
```

