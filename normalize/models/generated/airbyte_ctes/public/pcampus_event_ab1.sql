{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_public",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('public', '_airbyte_raw_pcampus_event') }}
select
    {{ json_extract_scalar('_airbyte_data', ['college'], ['college']) }} as college,
    {{ json_extract_scalar('_airbyte_data', ['eventid'], ['eventid']) }} as eventid,
    {{ json_extract_scalar('_airbyte_data', ['hideonlinesearch'], ['hideonlinesearch']) }} as hideonlinesearch,
    {{ json_extract_scalar('_airbyte_data', ['cip_code'], ['cip_code']) }} as cip_code,
    {{ json_extract_scalar('_airbyte_data', ['description'], ['description']) }} as description,
    {{ json_extract_scalar('_airbyte_data', ['org_code_id'], ['org_code_id']) }} as org_code_id,
    {{ json_extract_scalar('_airbyte_data', ['create_opid'], ['create_opid']) }} as create_opid,
    {{ json_extract_scalar('_airbyte_data', ['class_level'], ['class_level']) }} as class_level,
    {{ json_extract_scalar('_airbyte_data', ['schedule_priority'], ['schedule_priority']) }} as schedule_priority,
    {{ json_extract_scalar('_airbyte_data', ['ceu'], ['ceu']) }} as ceu,
    {{ json_extract_scalar('_airbyte_data', ['event_type'], ['event_type']) }} as event_type,
    {{ json_extract_scalar('_airbyte_data', ['credits'], ['credits']) }} as credits,
    {{ json_extract_scalar('_airbyte_data', ['revision_date'], ['revision_date']) }} as revision_date,
    {{ json_extract_scalar('_airbyte_data', ['event_med_name'], ['event_med_name']) }} as event_med_name,
    {{ json_extract_scalar('_airbyte_data', ['serial_id'], ['serial_id']) }} as serial_id,
    {{ json_extract_scalar('_airbyte_data', ['revision_terminal'], ['revision_terminal']) }} as revision_terminal,
    {{ json_extract_scalar('_airbyte_data', ['department'], ['department']) }} as department,
    {{ json_extract_scalar('_airbyte_data', ['create_date'], ['create_date']) }} as create_date,
    {{ json_extract_scalar('_airbyte_data', ['publication_name_1'], ['publication_name_1']) }} as publication_name_1,
    {{ json_extract_scalar('_airbyte_data', ['event_long_name'], ['event_long_name']) }} as event_long_name,
    {{ json_extract_scalar('_airbyte_data', ['publication_name_2'], ['publication_name_2']) }} as publication_name_2,
    {{ json_extract_scalar('_airbyte_data', ['event_status'], ['event_status']) }} as event_status,
    {{ json_extract_scalar('_airbyte_data', ['general_ed'], ['general_ed']) }} as general_ed,
    {{ json_extract_scalar('_airbyte_data', ['create_time'], ['create_time']) }} as create_time,
    {{ json_extract_scalar('_airbyte_data', ['abt_join'], ['abt_join']) }} as abt_join,
    {{ json_extract_scalar('_airbyte_data', ['speede_code'], ['speede_code']) }} as speede_code,
    {{ json_extract_scalar('_airbyte_data', ['revision_opid'], ['revision_opid']) }} as revision_opid,
    {{ json_extract_scalar('_airbyte_data', ['create_terminal'], ['create_terminal']) }} as create_terminal,
    {{ json_extract_scalar('_airbyte_data', ['curriculum'], ['curriculum']) }} as curriculum,
    {{ json_extract_scalar('_airbyte_data', ['credit_type'], ['credit_type']) }} as credit_type,
    {{ json_extract_scalar('_airbyte_data', ['population'], ['population']) }} as population,
    {{ json_extract_scalar('_airbyte_data', ['nontrad_program'], ['nontrad_program']) }} as nontrad_program,
    {{ json_extract_scalar('_airbyte_data', ['event_id'], ['event_id']) }} as event_id,
    {{ json_extract_scalar('_airbyte_data', ['REPEATABLE'], ['REPEATABLE']) }} as {{ adapter.quote('REPEATABLE') }},
    {{ json_extract_scalar('_airbyte_data', ['revision_time'], ['revision_time']) }} as revision_time,
    {{ json_extract_scalar('_airbyte_data', ['PROGRAM'], ['PROGRAM']) }} as {{ adapter.quote('PROGRAM') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('public', '_airbyte_raw_pcampus_event') }} as table_alias
-- pcampus_event
where 1 = 1

