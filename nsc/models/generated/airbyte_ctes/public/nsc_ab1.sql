{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_public",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('public', '_airbyte_raw_nsc') }}
select
    {{ json_extract_scalar('_airbyte_data', ['Name Suffix'], ['Name Suffix']) }} as {{ adapter.quote('Name Suffix') }},
    {{ json_extract_scalar('_airbyte_data', ['Degree CIP 4'], ['Degree CIP 4']) }} as {{ adapter.quote('Degree CIP 4') }},
    {{ json_extract_scalar('_airbyte_data', ['Degree CIP 2'], ['Degree CIP 2']) }} as {{ adapter.quote('Degree CIP 2') }},
    {{ json_extract_scalar('_airbyte_data', ['Degree CIP 3'], ['Degree CIP 3']) }} as {{ adapter.quote('Degree CIP 3') }},
    {{ json_extract_scalar('_airbyte_data', ['College Code/Branch'], ['College Code/Branch']) }} as {{ adapter.quote('College Code/Branch') }},
    {{ json_extract_scalar('_airbyte_data', ['First Name'], ['First Name']) }} as {{ adapter.quote('First Name') }},
    {{ json_extract_scalar('_airbyte_data', ['College Name'], ['College Name']) }} as {{ adapter.quote('College Name') }},
    {{ json_extract_scalar('_airbyte_data', ['Graduated?'], ['Graduated?']) }} as {{ adapter.quote('Graduated?') }},
    {{ json_extract_scalar('_airbyte_data', ['Degree Title'], ['Degree Title']) }} as {{ adapter.quote('Degree Title') }},
    {{ json_extract_scalar('_airbyte_data', ['Enrollment Major 2'], ['Enrollment Major 2']) }} as {{ adapter.quote('Enrollment Major 2') }},
    {{ json_extract_scalar('_airbyte_data', ['Degree CIP 1'], ['Degree CIP 1']) }} as {{ adapter.quote('Degree CIP 1') }},
    {{ json_extract_scalar('_airbyte_data', ['Enrollment Major 1'], ['Enrollment Major 1']) }} as {{ adapter.quote('Enrollment Major 1') }},
    {{ json_extract_scalar('_airbyte_data', ['Class Level'], ['Class Level']) }} as {{ adapter.quote('Class Level') }},
    {{ json_extract_scalar('_airbyte_data', ['Your Unique Identifier'], ['Your Unique Identifier']) }} as {{ adapter.quote('Your Unique Identifier') }},
    {{ json_extract_scalar('_airbyte_data', ['Search Date'], ['Search Date']) }} as {{ adapter.quote('Search Date') }},
    {{ json_extract_scalar('_airbyte_data', ['College State'], ['College State']) }} as {{ adapter.quote('College State') }},
    {{ json_extract_scalar('_airbyte_data', ['Middle Initial'], ['Middle Initial']) }} as {{ adapter.quote('Middle Initial') }},
    {{ json_extract_scalar('_airbyte_data', ['Enrollment Begin'], ['Enrollment Begin']) }} as {{ adapter.quote('Enrollment Begin') }},
    {{ json_extract_scalar('_airbyte_data', ['Enrollment Status'], ['Enrollment Status']) }} as {{ adapter.quote('Enrollment Status') }},
    {{ json_extract_scalar('_airbyte_data', ['last_modified'], ['last_modified']) }} as last_modified,
    {{ json_extract_scalar('_airbyte_data', ['Enrollment CIP 2'], ['Enrollment CIP 2']) }} as {{ adapter.quote('Enrollment CIP 2') }},
    {{ json_extract_scalar('_airbyte_data', ['Enrollment CIP 1'], ['Enrollment CIP 1']) }} as {{ adapter.quote('Enrollment CIP 1') }},
    {{ json_extract_scalar('_airbyte_data', ['Degree Major 4'], ['Degree Major 4']) }} as {{ adapter.quote('Degree Major 4') }},
    {{ json_extract_scalar('_airbyte_data', ['Degree Major 3'], ['Degree Major 3']) }} as {{ adapter.quote('Degree Major 3') }},
    {{ json_extract_scalar('_airbyte_data', ['Graduation Date'], ['Graduation Date']) }} as {{ adapter.quote('Graduation Date') }},
    {{ json_extract_scalar('_airbyte_data', ['Degree Major 2'], ['Degree Major 2']) }} as {{ adapter.quote('Degree Major 2') }},
    {{ json_extract_scalar('_airbyte_data', ['Degree Major 1'], ['Degree Major 1']) }} as {{ adapter.quote('Degree Major 1') }},
    {{ json_extract_scalar('_airbyte_data', ['Public / Private'], ['Public / Private']) }} as {{ adapter.quote('Public / Private') }},
    {{ json_extract_scalar('_airbyte_data', ['Enrollment End'], ['Enrollment End']) }} as {{ adapter.quote('Enrollment End') }},
    {{ json_extract_scalar('_airbyte_data', ['Last Name'], ['Last Name']) }} as {{ adapter.quote('Last Name') }},
    {{ json_extract_scalar('_airbyte_data', ['2-year / 4-year'], ['2-year / 4-year']) }} as {{ adapter.quote('2-year / 4-year') }},
    {{ json_extract_scalar('_airbyte_data', ['Record Found Y/N'], ['Record Found Y/N']) }} as {{ adapter.quote('Record Found Y/N') }},
    {{ json_extract_scalar('_airbyte_data', ['College Sequence'], ['College Sequence']) }} as {{ adapter.quote('College Sequence') }},
    {{ json_extract_scalar('_airbyte_data', ['Requester Return Field'], ['Requester Return Field']) }} as {{ adapter.quote('Requester Return Field') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('public', '_airbyte_raw_nsc') }} as table_alias
-- nsc
where 1 = 1

