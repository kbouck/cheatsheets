



# Akzo OneHUB

```sql
select
     p.CORPORATIONNAME,
     d.PROTOCOL,
     d.HOST,
     d.PORT,
     d.LOCATION,
     d.USERNAME,
     ppf.VALUESTRING as AS2_TO
from db2prd.PARTNERDESTINATION pd
join db2prd.DESTINATION d
  on pd.DESTINATIONID = d.DESTINATIONID
join db2prd.PARTNER p
  on p.PARTNERID = pd.PARTNERID
left outer join db2prd.PARTNERPROFILEFIELD ppf
  on p.PARTNERID = ppf.PARTNERID and ppf.PROFILEFIELDNAME = 'AS2-To'
```



ok, this is getting more complicated. The first reports only included the PARTNERs which were linked to one or more DESTINATIONs using an entry in PARTNERDESTINATION table. Some of the PARTNERs however (including ‘EXT_Akebono US’) don’t have such a link, but may well have entries in PARTNERPROFILEFIELD. In order to catch these as well, I changed the SQL to:

```sql
select 
     p.CORPORATIONNAME,
     d.PROTOCOL,
     d.HOST,
     d.PORT, 
     d.LOCATION,
     d.USERNAME,
     ppf.VALUESTRING as AS2_TO
from db2prd.partner p
left outer join db2prd.partnerdestination pd
  on p.PARTNERID = pd.PARTNERID
left outer join db2prd.destination d
  on pd.DESTINATIONID = d.DESTINATIONID
left outer join db2prd.PARTNERPROFILEFIELD ppf
  on p.PARTNERID = ppf.PARTNERID and ppf.PROFILEFIELDNAME = 'AS2-To'
```

# 