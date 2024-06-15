-- models/fact_orders.sql
WITH order_details_cte AS (
    SELECT
        od.orderid,
        o.orderdate,
        od.productid,
        p.categoryid,
        od.unitprice,
        od.quantity,
        od.discount,
        s.supplierid,
        o.employeeid,
        (od.unitprice - (od.unitprice * od.discount)) * od.quantity AS gross_revenue
    FROM
        {{ ref('order_details') }} AS od
    JOIN
        {{ ref('orders') }} AS o ON od.orderid = o.orderid
    JOIN
        {{ ref('products') }} AS p ON od.productid = p.productid
    JOIN
        {{ ref('suppliers') }} AS s ON p.supplierid = s.supplierid
)
SELECT
    orderid,
    orderdate,
    productid,
    categoryid,
    supplierid,
    employeeid,
    SUM(gross_revenue) AS total_gross_revenue
FROM
    order_details_cte
GROUP BY
    orderid, orderdate, productid, categoryid, supplierid, employeeid
