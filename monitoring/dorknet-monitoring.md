



# Design Principles

- Data files as system-of-record 
  - Files (generally csv-formatted) act as the system-of-record for each data set
  - Files are versatile as they can be archived, queried ad-hoc, edited, transformed, and imported into other analytics sources. 
  - The data files are stored on a shared filesystem allowing access by multiple computers in the network
  - Automation scripts load each data set from the archive into the respective analytics database(s), and dervied data formats / reports
  - Some data will be kept indefifinitely, other data will be purged periodically after becoming irrelevant

- Multiple Analytics DBs
  - Pipe the same data to multiple analytics DBs in order to evaluate and compare
    - easy of loading
    - ease of querying
    - ease of graphing
    - easy of ad-hoc analysis
    - performance and efficiency

# Data Sets

| Data Set          | iCloud Folder | Source               | Update Trigger | Data Resolution | Record DB | Analysis DB | DB/table | Data Retention |
|--                 |--                    |--          |--                 |--                 |--                 |--                 |--                 |--                 |
| Apple Health Data | health/apple | iPhone Health | Manual | -- | -- | Sqlite| apple_health/record apple_health/workout | Long-term |
| Utility Bill      | home/utilities/gas_electric | Vattenfall API | Manual | Hourly | iCloud | Sqlite| home/utilities | Long-term |
| AC Device Metrics | home/hvac    | MELcloud             | Auto | 5m | Local | Sqlite or Postgres| home/hvac | Recent Only |
| Weather Data      | home/temperature | VisualCrossing | Auto |Hourly|Local|Sqlite or Postgres|home/weather|Recent Only|
| Network Metrics   | home/network | Unifi Controller     | Auto | 5m | Local | Elasticsearch? since logs + metrics | network | Recent Only |


todo: check out norwegian weather api. free, no login needed.
https://developer.yr.no



# Analytics DB Choices

- Sqlite
  - ++ Good to practice SQL
  - ++ Good to familiarize self with a popular data science tool
  - ++ Useful for related data sets (weather, hvac, utility bill)
  - ++ Queries can produce derived easy to query data sets and reports (eg. csv)
  - -- Wide-schema is less flexible
- Postgres
  - ++ All the same benefits of sqlite
  - ++ Can be accessed remotely
  - ++ TimescaleDB (time-series + joins)
- Elastic
  - ++ Schema-less makes adding fields easy
  - ++ Good if also storing logs or other non-metric based data
  - ++ Good prior experience with ES and filebeat 
- Prometheus
  - -- No timestamps?
- Influx
  - ++ timestamps
  - ++ simple wire format



# DB Column Naming

- Goal: harmonize column naming to make query writing easier

- column names lower-case, and underscore separated

- time: iso text date-time stamp

- time_epoch: epoch seconds or 

- time_epoch_ms: epoch milliseconds

  

# Kafka

- replaces cron'd loading of db
- output connectors:
  - sqlite db and postgres (for comparison)
  - elastic
  - other data stores for comparison
- topics:
  - net.ping
  - net.dns
  - net.unifi.ap
  - net.unifi.gw
  - home.doors
  - home.util.ac
  - home.util.gas_electric
  - home.util.water
  - weather
- stream processing:
  - alert on energy price increases
  - alert
  - alert on front door visitors



