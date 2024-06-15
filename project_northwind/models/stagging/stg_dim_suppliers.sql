-- models/dim_suppliers.sql
SELECT
    supplierid,
    companyname,
    contactname,
    contacttitle,
    address,
    city,
    region,
    postalcode,
    country,
    phone,
    fax,
    homepage
FROM
    {{ ref('suppliers') }}
