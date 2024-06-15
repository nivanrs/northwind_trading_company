-- models/dim_products.sql
SELECT
    productid,
    productname,
    supplierid,
    categoryid,
    quantityperunit,
    unitprice,
    unitsinstock,
    unitsonorder,
    reorderlevel,
    discontinued
FROM
    {{ ref('products') }}
