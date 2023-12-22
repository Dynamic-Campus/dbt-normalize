{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    schema = "_airbyte_public",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('orgs_steps_ab1') }}
select
    _airbyte_orgs_hashid,
    cast(seq as {{ dbt_utils.type_float() }}) as seq,
    cast({{ adapter.quote('limit') }} as nvarchar(500) ) as {{ adapter.quote('limit') }},
    cast(title as nvarchar(500) ) as title,
    cast(useracct as nvarchar(500) ) as useracct,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('orgs_steps_ab1') }}
-- steps at orgs/steps
where 1 = 1

