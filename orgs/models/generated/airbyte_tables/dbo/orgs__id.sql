{{ config(
    schema = "dbo",
    post_hook = ["
                    {%
                        set scd_table_relation = adapter.get_relation(
                            database=this.database,
                            schema=this.schema,
                            identifier='orgs__id_scd'
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
-- depends_on: {{ ref('orgs__id_ab3') }}
select
    _airbyte_orgs_hashid,
    {{ adapter.quote('$oid') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte__id_hashid
from {{ ref('orgs__id_ab3') }}
-- _id at orgs/_id from {{ ref('orgs') }}
where 1 = 1

