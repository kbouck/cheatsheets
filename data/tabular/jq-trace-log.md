







```bash

# Get list of top-level services
jq -c '{ Sender, "@topLevelService" }' trace-2021-11-0*.json > top-level-svcs-latest.ndjson

```

