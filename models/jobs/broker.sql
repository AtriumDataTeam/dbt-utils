{{
	config(
		materialized='incremental',
		unique_key='BROKERID',
		schema= 'DIM'
	)
}}
SELECT DISTINCT BkrPSU AS BROKERNAME, BkrCd AS BROKERID, BkrRef AS BROKERREF, {{surrogate_key('BkrCd', 'BkrRef', 'BkrPSU')}} AS BROKERIDSK
FROM "PC_FIVETRAN_DB"."SUBSCRIBE_DBO"."USMMAIN"
	


