
  
    

  create  table "db_dskola"."public"."raw_products__dbt_tmp"
  
  
    as
  
  (
    select
    product_id,
    product_name,
    category
from
    "db_dskola"."public"."products"
  );
  