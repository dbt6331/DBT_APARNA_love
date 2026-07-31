select {{ count_new('date') }} 
from {{ source('stage', 'CHEMCALSAMPLE') }}