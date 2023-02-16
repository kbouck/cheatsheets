







```sql
select p.CORPORATIONNAME,d.PROTOCOL,d.HOST,d.PORT,d.LOCATION,d.USERNAME,ppf.VALUESTRING as AS2_TO
from db2prd.partner p
left outer join db2prd.partnerdestination pd
  on p.PARTNERID = pd.PARTNERID
left outer join db2prd.destination d
  on pd.DESTINATIONID = d.DESTINATIONID
left outer join db2prd.PARTNERPROFILEFIELD ppf
  on p.PARTNERID = ppf.PARTNERID and ppf.PROFILEFIELDNAME = 'AS2-To'
```







```sql
set current schema db2prd;
 
select u.id, u.firstname, u.lastname, u.email,
  timestamp('1970-01-01-00.00.00') + (t.created / 1000) seconds
from tblthing t
join t_wm_xt_sysdiruser u
on u.id = t.idthing
where timestamp('1970-01-01-00.00.00') + (t.created / 1000) seconds > current timestamp - 7 days
order by created
;
```

