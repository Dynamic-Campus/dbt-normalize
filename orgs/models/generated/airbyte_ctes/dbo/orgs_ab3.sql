{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('orgs_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        object_to_string('_id'),
        'num',
        'name',
        array_to_string('steps'),
    ]) }} as _airbyte_orgs_hashid,
    tmp.*
from {{ ref('orgs_ab2') }} tmp
-- orgs
where 1 = 1

