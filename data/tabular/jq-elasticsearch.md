


# nd-json to elastic bulk api

Convert an nd-json file into elasticsearch bulk api index entries

This example includes extraction of unique document ID and a dynamic index name based on an extracted date field (does not account for timezone)

Uses 3 jq parameters:
- id_field        field to extract unique doc id
- time_field      field to extract timestamp data from
- index           index pattern (eg, tn-bizdoc-%Y.%m)

    ```bash
    jq -c --arg id_field InternalID --arg time_field Timestamp --arg index "tn-bizdoc-%Y.%m" '{ index: { _index: (.[$time_field][0:19] + "Z" | fromdate | strftime($index)), _id: .[$id_field] }},.' ${input-file-ndjson} > ${output-file-bulkapi-json} 
    ```

Explanation:
  -c 

