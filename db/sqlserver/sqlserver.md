

date and time

```sql
# sql server - date-time - where
CONVERT(datetime2, '2020-10-19T22:00:00.000Z', 126) -- convert date string to datetime2

from 
    dbo.TABLE_SUIVI_MESSAGE
where       
    date_heure_debut_session >= CONVERT(datetime2, '2020-10-19T22:00:00.000Z', 126) AND
    date_heure_debut_session <= CONVERT(datetime2, '2020-10-25T13:22:58.838Z', 126)
```



# CTE

```sql
WITH doctypes AS 
(SELECT
-- primary id
concat(n_session, '_', n_message) as msg_id,

-- doctype
CASE
	WHEN CHARINDEX('_ACKHDR_', table_correspondance) > 0 THEN 'ACKHDR'
	WHEN CHARINDEX('_APERAK_', table_correspondance) > 0 THEN 'APERAK'
	WHEN CHARINDEX('_AUTACK_', table_correspondance) > 0 THEN 'AUTACK'
	WHEN CHARINDEX('_CONTRL_', table_correspondance) > 0 THEN 'CONTRL'
	WHEN CHARINDEX('_CORHDR_', table_correspondance) > 0 THEN 'CORHDR'
	WHEN CHARINDEX('_CREDIT_', table_correspondance) > 0 THEN 'CREDIT'
	WHEN CHARINDEX('_CREHDR_', table_correspondance) > 0 THEN 'CREHDR'
	WHEN CHARINDEX('_DELHDR_', table_correspondance) > 0 THEN 'DELHDR'
	WHEN CHARINDEX('_DESADV_', table_correspondance) > 0 THEN 'DESADV'
	WHEN CHARINDEX('_IFTMIN_', table_correspondance) > 0 THEN 'IFTMIN'
	WHEN CHARINDEX('_INVAPR_', table_correspondance) > 0 THEN 'INVAPR'
	WHEN CHARINDEX('_INVFIL_', table_correspondance) > 0 THEN 'INVFIL'
	WHEN CHARINDEX('_INVOIC_', table_correspondance) > 0 THEN 'INVOIC'
	WHEN CHARINDEX('_ORDACK_', table_correspondance) > 0 THEN 'ORDACK'
	WHEN CHARINDEX('_ORDERS_', table_correspondance) > 0 THEN 'ORDERS'
	WHEN CHARINDEX('_ORDHDR_', table_correspondance) > 0 THEN 'ORDHDR'
	WHEN CHARINDEX('_ORDRSP_', table_correspondance) > 0 THEN 'ORDRSP'
	WHEN CHARINDEX('_REMADV_', table_correspondance) > 0 THEN 'REMADV'
	WHEN CHARINDEX('_RETANN_', table_correspondance) > 0 THEN 'RETANN'
	WHEN CHARINDEX('_RETINS_', table_correspondance) > 0 THEN 'RETINS'
	WHEN CHARINDEX('_SRMHDR_', table_correspondance) > 0 THEN 'SRMHDR'
ELSE NULL
	END as message,
 
CASE
	WHEN CHARINDEX('HDR_', table_correspondance) > 0 THEN 'TRADACOMS'
	WHEN CHARINDEX('_INVFIL_', table_correspondance) > 0 THEN 'TRADACOMS'
	WHEN CHARINDEX('_ASC_', table_correspondance) > 0 THEN 'ASC'
	WHEN CHARINDEX('_IDS_', table_correspondance) > 0 THEN 'IDS'  -- special case for csv pre-processed to XML
	WHEN CHARINDEX('_U21', table_correspondance) > 0 THEN 'UBL'
	WHEN CHARINDEX('_UBL', table_correspondance) > 0 THEN 'UBL'
	WHEN CHARINDEX('_XML', table_correspondance) > 0 THEN 'XML'
ELSE 'EDIFACT'
	END as standard,
 
CASE
	WHEN CHARINDEX('_850', table_correspondance) > 0 THEN '850'
	WHEN CHARINDEX('_01B', table_correspondance) > 0 THEN '01B'
	WHEN CHARINDEX('_02A', table_correspondance) > 0 THEN '02A'
	WHEN CHARINDEX('_04A', table_correspondance) > 0 THEN '04A'
	WHEN CHARINDEX('_93A', table_correspondance) > 0 THEN '93A'
	WHEN CHARINDEX('_96A', table_correspondance) > 0 THEN '96A'
	WHEN CHARINDEX('_TR4', table_correspondance) > 0 THEN 'TR4'
	WHEN CHARINDEX('_TR6', table_correspondance) > 0 THEN 'TR6'
	WHEN CHARINDEX('_TR7', table_correspondance) > 0 THEN 'TR7'
	WHEN CHARINDEX('_TR8', table_correspondance) > 0 THEN 'TR8'
	WHEN CHARINDEX('_TR9', table_correspondance) > 0 THEN 'TR9'
	WHEN CHARINDEX('_U21', table_correspondance) > 0 THEN 'U21'
ELSE NULL
	END as version
     
from dbo.TABLE_SUIVI_MESSAGE)

select top 100

-- primary key, timestamp
concat(m.n_session, '_', m.n_message) as msg_id,
--date_heure_debut_session as timestamp,
CONVERT(VARCHAR(25),date_heure_debut_session,126) + 'Z' AS timestamp,

-- sender/receiver/doctype/country
--   sender/receiver/country
CASE
	WHEN sens_traitement = 'O' THEN
	CASE
		WHEN SUBSTRING(id_activite, 2, 1) = 'S' 
		THEN 'AN_DECO Dynamics'
		ELSE 'AN_DECO Saturn'
	END
	WHEN sens_traitement = 'I' THEN 
		CONCAT('EXT_', SUBSTRING(ISNULL(libelle_partenaire, 'UNKNOWN'), ISNULL(CHARINDEX('*', libelle_partenaire)+1, 0), 50))
	END as sender,
CASE
	WHEN sens_traitement = 'O' THEN 
		CONCAT('EXT_', SUBSTRING(ISNULL(libelle_partenaire, 'UNKNOWN'), ISNULL(CHARINDEX('*', libelle_partenaire)+1, 0), 50))
	WHEN sens_traitement = 'I' THEN
	CASE
		WHEN SUBSTRING(id_activite, 2, 1) = 'S' THEN 'AN_DECO Dynamics'
		ELSE 'AN_DECO Saturn'
	END
END as receiver,
ltrim(rtrim(concat(d.standard, ' ', d.version, ' ', d.message))) as doctype,
d.standard as attr_edi_standard,
d.version as attr_edi_version,
d.message as attr_edi_message,


-- status
CASE WHEN code_retour = 0 THEN 'DONE' ELSE 'FAILED' END AS status,
 
-- message attributes
LEFT(id_activite, 2) as attr_country,
 
code_emetteur_normalise as attr_sender_ean,
code_destinataire_normalise as attr_receiver_ean,
 
REPLACE(LTRIM(idoc_nrs), '<br>', ' ') as attr_idocs,
  
 
-- IN/OUT channels/files
code_reseau as attr_network,
nom_fichier_entree as attr_in_file,
nom_fichier_sortie as attr_out_file,
RIGHT(repertoire_fichier_sortie, CHARINDEX('\', REVERSE(repertoire_fichier_sortie))-1) as attr_out_channel,
--repertoire_fichier_sortie as attr_outbound_file,
 
 
libelle_zone_utilisateur1 as attr1_name,
zone_utilisateur1 as attr1_value,    
libelle_zone_utilisateur2 as attr2_name,
zone_utilisateur2 as attr2_value,    
libelle_zone_utilisateur3 as attr3_name,
zone_utilisateur3 as attr3_value,
libelle_zone_utilisateur4 as attr4_name,
zone_utilisateur4 as attr4_value,   
libelle_zone_utilisateur5 as attr5_name,
zone_utilisateur5 as attr5_value    



from 
    dbo.TABLE_SUIVI_MESSAGE m
join doctypes d on msg_id = concat(m.n_session, '_', m.n_message)
where       
    date_heure_debut_session >= CONVERT(datetime2, ?, 126) AND
    date_heure_debut_session <= CONVERT(datetime2, ?, 126)
order by 2
```

