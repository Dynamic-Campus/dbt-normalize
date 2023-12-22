{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ ref('orgs') }}
{{ unnest_cte(ref('orgs'), 'orgs', 'steps') }}
select
    _airbyte_orgs_hashid,
    {{ json_extract_scalar(unnested_column_value('steps'), ['seq'], ['seq']) }} as seq,
    {{ json_extract_scalar(unnested_column_value('steps'), ['limit'], ['limit']) }} as {{ adapter.quote('limit') }},
    {{ json_extract_scalar(unnested_column_value('steps'), ['title'], ['title']) }} as title,
    {{ json_extract_scalar(unnested_column_value('steps'), ['userAcct'], ['userAcct']) }} as useracct,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('orgs') }} as table_alias
-- steps at orgs/steps
{{ cross_join_unnest('orgs', 'steps') }}
where 1 = 1
and steps is not null

