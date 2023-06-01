{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_public",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('nsc_ab1') }}
select
    cast({{ adapter.quote('Name Suffix') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name_suffix') }},
    cast({{ adapter.quote('Degree CIP 4') }} as {{ dbt_utils.type_numeric() }}) as {{ adapter.quote('degree_cip_4') }},
    cast({{ adapter.quote('Degree CIP 2') }} as {{ dbt_utils.type_numeric() }}) as {{ adapter.quote('degree_cip_2') }},
    cast({{ adapter.quote('Degree CIP 3') }} as {{ dbt_utils.type_numeric() }}) as {{ adapter.quote('degree_cip_3') }},
    cast({{ adapter.quote('College Code/Branch') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('college_code_branch') }},
    cast({{ adapter.quote('First Name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('first_name') }},
    cast({{ adapter.quote('College Name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('college_name') }},
    cast({{ adapter.quote('Graduated?') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('graduated') }},
    cast({{ adapter.quote('Degree Title') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('degree_title') }},
    cast({{ adapter.quote('Enrollment Major 2') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('enrollment_major_2') }},
    cast({{ adapter.quote('Degree CIP 1') }} as {{ dbt_utils.type_numeric() }}) as {{ adapter.quote('degree_cip_1') }},
    cast({{ adapter.quote('Enrollment Major 1') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('enrollment_major_1') }},
    cast({{ adapter.quote('Class Level') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('class_level') }},
    cast({{ adapter.quote('Your Unique Identifier') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('your_unique_identifier') }},
    cast({{ adapter.quote('Search Date') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('search_date') }},
    cast({{ adapter.quote('College State') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('college_state') }},
    cast({{ adapter.quote('Middle Initial') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('middle_initial') }},
    cast({{ adapter.quote('Enrollment Begin') }} as DATE ) as {{ adapter.quote('enrollment_begin') }},
    cast({{ adapter.quote('Enrollment Status') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('enrollment_status') }},
    cast({{ empty_string_to_null('last_modified') }} as {{ type_timestamp_with_timezone() }}) as last_modified,
    cast({{ adapter.quote('Enrollment CIP 2') }} as {{ dbt_utils.type_numeric() }}) as {{ adapter.quote('enrollment_cip_2') }},
    cast({{ adapter.quote('Enrollment CIP 1') }} as {{ dbt_utils.type_numeric() }}) as {{ adapter.quote('enrollment_cip_1') }},
    cast({{ adapter.quote('Degree Major 4') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('degree_major_4') }},
    cast({{ adapter.quote('Degree Major 3') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('degree_major_3') }},
    cast({{ adapter.quote('Graduation Date') }} as  DATE ) as {{ adapter.quote('graduation_date') }},
    cast({{ adapter.quote('Degree Major 2') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('degree_major_2') }},
    cast({{ adapter.quote('Degree Major 1') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('degree_major_1') }},
    cast({{ adapter.quote('Public / Private') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('public_private') }},
    cast({{ adapter.quote('Enrollment End') }} as DATE ) as {{ adapter.quote('enrollment_end') }},
    cast({{ adapter.quote('Last Name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('last_name') }},
    cast({{ adapter.quote('2-year / 4-year') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('2-year_4-year') }},
    cast({{ adapter.quote('Record Found Y/N') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('record_found_yn') }},
    cast({{ adapter.quote('College Sequence') }} as {{ dbt_utils.type_numeric() }}) as {{ adapter.quote('college_sequence') }},
    cast({{ adapter.quote('Requester Return Field') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('requester_return_field') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('nsc_ab1') }}
-- nsc
where 1 = 1

