
# Issue Import

https://docs.sonarqube.org/latest/analysis/external-issues/
https://docs.sonarqube.org/latest/analysis/generic-issue/



## analysis parameter

```bash
sonar.externalIssuesReportPaths          # command-delimted list of paths to reports
```




```json
{ 
  "issues": [
    {
      "engineId": "test",
      "ruleId": "rule1",
      "severity":"BLOCKER",
      "type":"CODE_SMELL",
      "primaryLocation": {
        "message": "fully-fleshed issue",
        "filePath": "sources/A.java",
        "textRange": {
          "startLine": 30,
          "endLine": 30,
          "startColumn": 9,
          "endColumn": 14
        }
      }
    }
  ]
}
```



where

```bash
# Issue Fields
# ============
engineId              # string
ruleId                # string
primaryLocation       # Location object
type                  # string. One of BUG, VULNERABILITY, CODE_SMELL
severity              # string. One of BLOCKER, CRITICAL, MAJOR, MINOR, INFO
effortMinutes         # integer, optional. Defaults to 0
secondaryLocations    # array of Location objects, optional

# Location Fields
# ===============
message               # string
filePath              # string
textRange             # TextRange object, optional for secondary locations only

# TextRange fields
# ================
startLine             # integer. 1-indexed
endLine               # integer, optional. 1-indexed
startColumn           # integer, optional. 0-indexed
endColumn             # integer, optional. 0-indexed
```

