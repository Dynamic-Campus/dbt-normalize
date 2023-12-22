{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('orgs__id_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_orgs_hashid',
        adapter.quote('$oid'),
    ]) }} as _airbyte__id_hashid,
    tmp.*
from {{ ref('orgs__id_ab2') }} tmp
-- _id at orgs/_id
where 1 = 1

