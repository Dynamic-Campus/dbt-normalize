{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_public",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('pcampus_event_ab1') }}
select
    cast(college as {{ dbt_utils.type_string() }}) as college,
    cast(eventid as {{ dbt_utils.type_bigint() }}) as eventid,
    {{ cast_to_boolean('hideonlinesearch') }} as hideonlinesearch,
    cast(cip_code as {{ dbt_utils.type_string() }}) as cip_code,
    cast(description as {{ dbt_utils.type_string() }}) as description,
    cast(org_code_id as {{ dbt_utils.type_string() }}) as org_code_id,
    cast(create_opid as {{ dbt_utils.type_string() }}) as create_opid,
    cast(class_level as {{ dbt_utils.type_string() }}) as class_level,
    cast(schedule_priority as {{ dbt_utils.type_string() }}) as schedule_priority,
    cast(ceu as {{ dbt_utils.type_numeric() }}) as ceu,
    cast(event_type as {{ dbt_utils.type_string() }}) as event_type,
    cast(credits as {{ dbt_utils.type_numeric() }}) as credits,
    cast(revision_date as DATE) as revision_date,
    cast(event_med_name as {{ dbt_utils.type_string() }}) as event_med_name,
    cast(serial_id as {{ dbt_utils.type_string() }}) as serial_id,
    cast(revision_terminal as {{ dbt_utils.type_string() }}) as revision_terminal,
    cast(department as {{ dbt_utils.type_string() }}) as department,
    cast(create_date as DATE) as create_date,
    cast(publication_name_1 as {{ dbt_utils.type_string() }}) as publication_name_1,
    cast(event_long_name as {{ dbt_utils.type_string() }}) as event_long_name,
    cast(publication_name_2 as {{ dbt_utils.type_string() }}) as publication_name_2,
    cast(event_status as {{ dbt_utils.type_string() }}) as event_status,
    cast(general_ed as {{ dbt_utils.type_string() }}) as general_ed,
    cast(create_time as {{ dbt_utils.type_string() }}) as create_time,
    cast(abt_join as {{ dbt_utils.type_string() }}) as abt_join,
    cast(speede_code as {{ dbt_utils.type_string() }}) as speede_code,
    cast(revision_opid as {{ dbt_utils.type_string() }}) as revision_opid,
    cast(create_terminal as {{ dbt_utils.type_string() }}) as create_terminal,
    cast(curriculum as {{ dbt_utils.type_string() }}) as curriculum,
    cast(credit_type as {{ dbt_utils.type_string() }}) as credit_type,
    cast(population as {{ dbt_utils.type_string() }}) as population,
    cast(nontrad_program as {{ dbt_utils.type_string() }}) as nontrad_program,
    cast(event_id as {{ dbt_utils.type_string() }}) as event_id,
    cast({{ adapter.quote('REPEATABLE') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('REPEATABLE') }},
    cast(revision_time as {{ dbt_utils.type_string() }}) as revision_time,
    cast({{ adapter.quote('PROGRAM') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('PROGRAM') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('pcampus_event_ab1') }}
-- pcampus_event
where 1 = 1

