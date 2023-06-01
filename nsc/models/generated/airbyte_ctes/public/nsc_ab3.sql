{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_public",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('nsc_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        adapter.quote('name_suffix'),
        adapter.quote('degree_cip_4'),
        adapter.quote('degree_cip_2'),
        adapter.quote('degree_cip_3'),
        adapter.quote('college_code_branch'),
        adapter.quote('first_name'),
        adapter.quote('college_name'),
        adapter.quote('graduated'),
        adapter.quote('degree_title'),
        adapter.quote('enrollment_major_2'),
        adapter.quote('degree_cip_1'),
        adapter.quote('enrollment_major_1'),
        adapter.quote('class_level'),
        adapter.quote('your_unique_identifier'),
        adapter.quote('search_date'),
        adapter.quote('college_state'),
        adapter.quote('middle_initial'),
        adapter.quote('enrollment_begin'),
        adapter.quote('enrollment_status'),
        'last_modified',
        adapter.quote('enrollment_cip_2'),
        adapter.quote('enrollment_cip_1'),
        adapter.quote('degree_major_4'),
        adapter.quote('degree_major_3'),
        adapter.quote('graduation_date'),
        adapter.quote('degree_major_2'),
        adapter.quote('degree_major_1'),
        adapter.quote('public_private'),
        adapter.quote('enrollment_end'),
        adapter.quote('last_name'),
        adapter.quote('2-year_4-year'),
        adapter.quote('record_found_yn'),
        adapter.quote('college_sequence'),
        adapter.quote('requester_return_field'),
    ]) }} as _airbyte_nsc_hashid,
    tmp.*
from {{ ref('nsc_ab2') }} tmp
-- nsc
where 1 = 1

