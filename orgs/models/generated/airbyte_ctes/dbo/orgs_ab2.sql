{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('orgs_ab1') }}
select
    cast(_id as varchar(500) ) as _id,
    cast(num as {{ dbt_utils.type_float() }}) as num,
    cast(name as varchar(500) ) as name,
    steps,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('orgs_ab1') }}
-- orgs
where 1 = 1

