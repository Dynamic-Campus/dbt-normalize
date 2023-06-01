{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "public",
    post_hook = ["
                    {%
                        set scd_table_relation = adapter.get_relation(
                            database=this.database,
                            schema=this.schema,
                            identifier='pcampus_event_scd'
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
-- depends_on: {{ ref('pcampus_event_ab3') }}
select
    college,
    eventid,
    hideonlinesearch,
    cip_code,
    description,
    org_code_id,
    create_opid,
    class_level,
    schedule_priority,
    ceu,
    event_type,
    credits,
    revision_date,
    event_med_name,
    serial_id,
    revision_terminal,
    department,
    create_date,
    publication_name_1,
    event_long_name,
    publication_name_2,
    event_status,
    general_ed,
    create_time,
    abt_join,
    speede_code,
    revision_opid,
    create_terminal,
    curriculum,
    credit_type,
    population,
    nontrad_program,
    event_id,
    {{ adapter.quote('REPEATABLE') }},
    revision_time,
    {{ adapter.quote('PROGRAM') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_pcampus_event_hashid
from {{ ref('pcampus_event_ab3') }}
-- pcampus_event from {{ source('public', '_airbyte_raw_pcampus_event') }}
where 1 = 1

