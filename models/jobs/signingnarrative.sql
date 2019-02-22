{{
	config(
		materialized='incremental',
		unique_key='TRANSID',
		schema= 'DIM'
	)
}}

select
	DISTINCT TRNID AS TransId, {{ dbt_utils.pivot('NARRTY', dbt_utils.get_column_values('PC_FIVETRAN_DB.SUBSCRIBE_DBO.USMNARR','NARRTY'),true,'min','=','','','NARR','NULL') }}
	FROM "PC_FIVETRAN_DB"."SUBSCRIBE_DBO"."USMNARR"
	GROUP BY TRNID, NARR

	
	
