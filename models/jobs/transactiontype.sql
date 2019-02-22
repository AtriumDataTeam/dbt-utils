{{
	config(
		materialized='incremental',
		unique_key='TransTypeId',
		schema= 'DIM'
	)
}}
SELECT DISTINCT CAC AS TransTypeId, BusCgyTy AS BusinessCategoryType, Dsc AS TransactionTypeDesc, {{surrogate_key('CAC', 'BusCgyTy')}} AS TRANSTYPEIDSK
FROM "PC_FIVETRAN_DB"."SUBSCRIBE_DBO"."CAC"
	