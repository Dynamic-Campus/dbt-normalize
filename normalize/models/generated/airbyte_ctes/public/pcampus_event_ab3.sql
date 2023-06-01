{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_public",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('pcampus_event_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'college',
        'eventid',
        boolean_to_string('hideonlinesearch'),
        'cip_code',
        'description',
        'org_code_id',
        'create_opid',
        'class_level',
        'schedule_priority',
        'ceu',
        'event_type',
        'credits',
        'revision_date',
        'event_med_name',
        'serial_id',
        'revision_terminal',
        'department',
        'create_date',
        'publication_name_1',
        'event_long_name',
        'publication_name_2',
        'event_status',
        'general_ed',
        'create_time',
        'abt_join',
        'speede_code',
        'revision_opid',
        'create_terminal',
        'curriculum',
        'credit_type',
        'population',
        'nontrad_program',
        'event_id',
        adapter.quote('REPEATABLE'),
        'revision_time',
        adapter.quote('PROGRAM'),
    ]) }} as _airbyte_pcampus_event_hashid,
    tmp.*
from {{ ref('pcampus_event_ab2') }} tmp
-- pcampus_event
where 1 = 1

