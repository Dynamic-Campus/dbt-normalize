{{ config(
    schema = "dbo",
    post_hook = ["
                    {%
                        set scd_table_relation = adapter.get_relation(
                            database=this.database,
                            schema=this.schema,
                            identifier='orgs_steps_scd'
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
    tags = [ "nested" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('orgs_steps_ab3') }}
select
    _airbyte_orgs_hashid,
    seq,
    {{ adapter.quote('limit') }},
    title,
    useracct,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_steps_hashid
from {{ ref('orgs_steps_ab3') }}
-- steps at orgs/steps from {{ ref('orgs') }}
where 1 = 1

