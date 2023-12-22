{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('orgs__id_ab1') }}
select
    _airbyte_orgs_hashid,
    cast({{ adapter.quote('$oid') }} as varchar(500) ) as {{ adapter.quote('$oid') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('orgs__id_ab1') }}
-- _id at orgs/_id
where 1 = 1

