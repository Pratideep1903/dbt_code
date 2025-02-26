select
L_ORDERKEY as order_key,
L_PARTKEY as part_key,
L_SUPPKEY as supp_key,
L_LINENUMBER as line_number,
L_QUANTITY as quantity,
L_EXTENDEDPRICE as extended_price, 
L_DISCOUNT as discount,
L_TAX as tax
from
{{source('tpch','LINEITEM')}}