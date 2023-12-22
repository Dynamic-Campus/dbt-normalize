{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ ref('orgs') }}
select
    _airbyte_orgs_hashid,
    {{ json_extract_scalar('_id', ['$oid'], ['$oid']) }} as {{ adapter.quote('$oid') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('orgs') }} as table_alias
-- _id at orgs/_id
where 1 = 1
and _id is not null

