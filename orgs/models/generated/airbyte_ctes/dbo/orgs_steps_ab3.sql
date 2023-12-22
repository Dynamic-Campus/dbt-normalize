{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('orgs_steps_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_orgs_hashid',
        'seq',
        adapter.quote('limit'),
        'title',
        'useracct',
    ]) }} as _airbyte_steps_hashid,
    tmp.*
from {{ ref('orgs_steps_ab2') }} tmp
-- steps at orgs/steps
where 1 = 1

