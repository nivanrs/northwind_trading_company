
  
    

  create  table "db_dskola"."public"."raw_orders__dbt_tmp"
  
  
    as
  
  (
    select
    order_id,
    order_date,
    customer_id,
    product_id,
    order_amount
from
    "db_dskola"."public"."orders"
  );
  