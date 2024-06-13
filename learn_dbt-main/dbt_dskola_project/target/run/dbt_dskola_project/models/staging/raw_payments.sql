
  
    

  create  table "db_dskola"."public"."raw_payments__dbt_tmp"
  
  
    as
  
  (
    select
    payment_id,
    order_id,
    payment_amount,
    payment_method
from
    "db_dskola"."public"."payments"
  );
  