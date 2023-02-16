# design / purpose

```markdown
- create scripts to capture raw source data in backed-up folders (we want to reliably preserve the data history)
- create scripts/automation to convert raw source to various output formats:
	- metric db import formats
	- human readable formtas (csv/excel)
	- reports
- create


# metrics
- utility usage/cost
- personal finance
- apple health metrics (running, etc)

```











# hardware

```bash


# kill a watt
orno 


# CT clamps

https://www.home-assistant.io/docs/energy/electricity-grid/#reading-the-meter-via-a-pulse-counter

Shelly EM
https://shop.shelly.cloud/shelly-em-50a-clamp-wifi-smart-home-automation-1#143



```



# create

```sql
# create db and tables
psql -c "CREATE DATABASE metrics;"
psql --dbname=metrics -f create_tables.sql 

# create grafana user
CREATE USER grafana WITH PASSWORD 'grafana';
GRANT USAGE ON SCHEMA public TO grafana;
GRANT SELECT ON public.utility TO grafana;
GRANT SELECT ON public.temperature TO grafana; 
```

# load

```sql
COPY <table-name>(<col1, col2, col3, col4)
FROM 'file.csv'
DELIMITER ','
CSV HEADER;                  -- data contains header

-- if csv columns match table columns, column names can be omitted
COPY <table-name>
FROM 'file.csv'
DELIMITER ','
CSV HEADER;                  
```



```bash
# load csv from command-line
psql -c "\copy <table-name> FROM 'file.csv' csv"
psql --dbname=metrics -c "\copy utility FROM '/tmp/utility-metrics-2021-11.csv' CSV HEADER;"
```





# queries

```sql
-- get readings (human-readable numbers)
select u.reading_time as time,
       u.utility,
       to_char(min(u2.quantity),'0.99') as min,
       to_char(u.quantity,      '0.99') as qty,
       to_char(avg(u2.quantity),'0.99') as avg,
       to_char(max(u2.quantity),'0.99') as max

  from utility u

  join utility u2
    on (u.reading_hour = u2.reading_hour
   and  u.utility      = u2.utility)

 where u.reading_date >=  '2021-11-01'
   and u.reading_date <   '2022-02-01'
   and u2.reading_date >= u.reading_date - interval '15 day'
   and u2.reading_date <  u.reading_date + interval '15 day'
   and u.utility = 'gas'

 group by 1,2,4
 order by 1,2 asc;
 

-- =====================
-- get readings over time
select u.reading_time as time,
       u.utility as metric,
       min(u2.quantity) as min,
       u.quantity as qty,
       avg(u2.quantity) as avg,
       max(u2.quantity) as max

  from utility u

  join utility u2
    on (u.reading_hour = u2.reading_hour
   and  u.utility      = u2.utility)

 -- where $__timeFilter(u.reading_date)
 where u.reading_date >=  '2021-11-01'
   and u.reading_date <   '2022-02-01'
   and u2.reading_date >= u.reading_date - interval '15 day'
   and u2.reading_date <  u.reading_date + interval '15 day'
   and u.utility = 'gas'

 group by 1,2,4
 order by 1,2 asc;


-- ====================
-- get readings statistics per hour
select u.utility as metric,
       u.reading_hour as hour,
       min(u.quantity) as min,
       avg(u.quantity) as avg,
       max(u.quantity) as max
       
  from utility u

 -- where $__timeFilter(u.reading_date)
 where u.reading_date >=  '2021-11-01'
   and u.reading_date <   '2022-02-01'
   
 group by 1,2
 order by 1,2 asc;

```



melcloud

```bash



# login
GET https://app.melcloud.com
capture:
    var appVersion = "1.23.6.0";
    window.reCaptchaPublicKey = "6LdYx1IUAAAAAOROf5sx8mdxQYYzKtlrmBaD32JL";


POST https://app.melcloud.com/Mitsubishi.Wifi.Client/Login/ClientLogin
{
"Email":"kevin.bouck@gmail.com",
"Password":"!@Nodlehed9me",
"Language":0,
"AppVersion":"1.23.6.0",
"Persist":false,
"CaptchaResponse":null
}




"https://app.melcloud.com/Mitsubishi.Wifi.Client/Login/ClientLogin?AppVersion=1.9.3.0&Email=kevin.bouck@gmail.com&Password=!@Nodlehed9me"


baseurl: app.melcloud.com
            headers = {'Content-Type': 'application/x-www-form-urlencoded;',
                       'Host': self.melcloud_baseurl,
                       'User-Agent': 'Domoticz/1.0',
                       'X-MitsContextKey': self.melcloud_key}
                       
"AppVersion=1.9.3.0&Email={0}&Password={1}".format(Parameters["Username"], Parameters["Password"])
/Mitsubishi.Wifi.Client/Login/ClientLogin


# capture context key

if ("ErrorId" not in response.keys()) or (response["ErrorId"] is None):
    key = response["LoginData"]["ContextKey"]
elif response["ErrorId"] == 1:
    Domoticz.Log("MELCloud login fail: check login and password")
else:
    Domoticz.Log("MELCloud failed with unknown error "+str(response["ErrorId"]))
    self.melcloud_state = "LOGIN_FAILED"


# list 
X-MitsContextKey: <context-key>



```

