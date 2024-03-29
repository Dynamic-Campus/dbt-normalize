{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "dbo",
    post_hook = ["
                    {%
                        set scd_table_relation = adapter.get_relation(
                            database=this.database,
                            schema=this.schema,
                            identifier='orgs_scd'
                        )
                    %}
                    {%
                        if scd_table_relation is not none
                    %}
                    {%
                            do adapter.drop_relation(scd_table_relation)
                    %}
                    {% endif %}
                        "],
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('orgs_ab3') }}
select
    _id,
    num,
    name,
    steps,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_orgs_hashid
from {{ ref('orgs_ab3') }}
-- orgs from {{ source('dbo', '_airbyte_raw_orgs') }}
where 1 = 1

