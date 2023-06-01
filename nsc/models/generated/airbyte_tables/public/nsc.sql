{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "public",
    post_hook = ["
                    {%
                        set scd_table_relation = adapter.get_relation(
                            database=this.database,
                            schema=this.schema,
                            identifier='nsc_scd'
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
-- depends_on: {{ ref('nsc_ab3') }}
select
    {{ adapter.quote('name_suffix') }},
    {{ adapter.quote('degree_cip_4') }},
    {{ adapter.quote('degree_cip_2') }},
    {{ adapter.quote('degree_cip_3') }},
    {{ adapter.quote('college_code_branch') }},
    {{ adapter.quote('first_name') }},
    {{ adapter.quote('college_name') }},
    {{ adapter.quote('graduated') }},
    {{ adapter.quote('degree_title') }},
    {{ adapter.quote('enrollment_major_2') }},
    {{ adapter.quote('degree_cip_1') }},
    {{ adapter.quote('enrollment_major_1') }},
    {{ adapter.quote('class_level') }},
    {{ adapter.quote('your_unique_identifier') }},
    {{ adapter.quote('search_date') }},
    {{ adapter.quote('college_state') }},
    {{ adapter.quote('middle_initial') }},
    {{ adapter.quote('enrollment_begin') }},
    {{ adapter.quote('enrollment_status') }},
    last_modified,
    {{ adapter.quote('enrollment_cip_2') }},
    {{ adapter.quote('enrollment_cip_1') }},
    {{ adapter.quote('degree_major_4') }},
    {{ adapter.quote('degree_major_3') }},
    {{ adapter.quote('graduation_date') }},
    {{ adapter.quote('degree_major_2') }},
    {{ adapter.quote('degree_major_1') }},
    {{ adapter.quote('public_private') }},
    {{ adapter.quote('enrollment_end') }},
    {{ adapter.quote('last_name') }},
    {{ adapter.quote('2-year_4-year') }},
    {{ adapter.quote('record_found_yn') }},
    {{ adapter.quote('college_sequence') }},
    {{ adapter.quote('requester_return_field') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_nsc_hashid
from {{ ref('nsc_ab3') }}
-- nsc from {{ source('public', '_airbyte_raw_nsc') }}
where 1 = 1

